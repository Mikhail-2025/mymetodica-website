<?php
namespace MyMetodica\Gmb;

use Google\Client;
use Google\Service\MyBusinessBusinessInformation;
use Google\Service\MyBusinessAccountManagement;
use PDO;
use Throwable;

class BusinessProfileClient
{
    private Client $client;
    private PDO $pdo;
    private array $config;

    public function __construct(PDO $pdo, array $config)
    {
        $this->pdo = $pdo;
        $this->config = $config;

        $this->client = new Client();
        $this->client->setApplicationName('Metodica Business Profile Sync');
        $this->client->setScopes([
            'https://www.googleapis.com/auth/business.manage'
        ]);
        $this->client->setAccessType('offline');
        $this->client->setAuthConfig([
            'client_id' => $config['client_id'],
            'client_secret' => $config['client_secret'],
            'redirect_uris' => ['https://developers.google.com/oauthplayground']
        ]);
        $this->client->refreshToken($config['refresh_token']);
    }

    /**
     * Получить Location ID из Business Profile
     */
    public function getLocationId(): string
    {
        if (!empty($this->config['location_id'])) {
            return $this->config['location_id'];
        }

        // Получаем список accounts
        $service = new MyBusinessAccountManagement($this->client);
        $accounts = $service->accounts->listAccounts();

        if (empty($accounts->getAccounts())) {
            throw new \RuntimeException('No Business Profile accounts found');
        }

        $accountName = $accounts->getAccounts()[0]->getName();

        // Получаем locations для первого account
        $infoService = new MyBusinessBusinessInformation($this->client);
        $locations = $infoService->accounts_locations->listAccountsLocations($accountName);

        if (empty($locations->getLocations())) {
            throw new \RuntimeException('No locations found in Business Profile');
        }

        $locationId = $locations->getLocations()[0]->getName();

        // Сохраняем в config для будущего использования
        $this->config['location_id'] = $locationId;

        return $locationId;
    }

    /**
     * Получить агрегированный рейтинг из Google Reviews
     */
    public function fetchAggregateRating(): array
    {
        $locationId = $this->getLocationId();

        $service = new MyBusinessBusinessInformation($this->client);
        $location = $service->accounts_locations->get($locationId, ['readMask' => 'metadata']);

        $metadata = $location->getMetadata();

        if (!$metadata) {
            throw new \RuntimeException('Location metadata not available');
        }

        $averageRating = $metadata->getAverageRating();
        $totalReviewCount = $metadata->getTotalReviewCount();

        if ($averageRating === null || $totalReviewCount === null) {
            // Возвращаем дефолтные значения если нет данных
            return [
                'ratingValue' => 0,
                'ratingCount' => 0,
                'bestRating'  => 5,
                'worstRating' => 1,
            ];
        }

        return [
            'ratingValue' => round($averageRating, 1),
            'ratingCount' => (int) $totalReviewCount,
            'bestRating'  => 5,
            'worstRating' => 1,
        ];
    }

    /**
     * Получить список отзывов
     */
    public function fetchReviews(int $max = 8, int $minRating = 0): array
    {
        $locationId = $this->getLocationId();

        $service = new MyBusinessBusinessInformation($this->client);
        $reviews = $service->accounts_locations_reviews->listAccountsLocationsReviews(
            $locationId,
            [
                'pageSize' => min($max, 50),
                'orderBy' => 'updateTime desc'
            ]
        );

        $result = [];

        if (!$reviews->getReviews()) {
            return $result;
        }

        foreach ($reviews->getReviews() as $review) {
            $rating = $review->getStarRating();
            $ratingNumber = $this->convertStarRating($rating);

            if ($ratingNumber < $minRating) {
                continue;
            }

            $reviewer = $review->getReviewer();
            $displayName = $reviewer ? $reviewer->getDisplayName() : 'Google User';

            $result[] = [
                '@type' => 'Review',
                'author' => [
                    '@type' => 'Person',
                    'name'  => $displayName ?: 'Google User'
                ],
                'datePublished' => substr($review->getCreateTime(), 0, 10),
                'reviewRating' => [
                    '@type' => 'Rating',
                    'ratingValue' => $ratingNumber,
                    'bestRating' => 5,
                    'worstRating' => 1
                ],
                'reviewBody' => $review->getComment() ?: ''
            ];

            if (count($result) >= $max) {
                break;
            }
        }

        return $result;
    }

    private function convertStarRating(?string $star): int
    {
        if (!$star) return 0;

        return match (strtoupper($star)) {
            'ONE' => 1,
            'TWO' => 2,
            'THREE' => 3,
            'FOUR' => 4,
            'FIVE' => 5,
            default => 0,
        };
    }

    /**
     * Обновить кэш в БД
     */
    public function refreshCache(): array
    {
        $rating = $this->fetchAggregateRating();
        $reviews = $this->fetchReviews(
            $this->config['max_reviews'] ?? 8,
            $this->config['min_rating'] ?? 0
        );

        $locationId = $this->getLocationId();

        $stmt = $this->pdo->prepare("
            INSERT INTO gmb_reviews_cache (location_id, rating_value, rating_count, rating_fetch, reviews_json, reviews_fetch)
            VALUES (:loc, :val, :cnt, NOW(), :reviews, NOW())
            ON DUPLICATE KEY UPDATE
                rating_value = VALUES(rating_value),
                rating_count = VALUES(rating_count),
                rating_fetch = NOW(),
                reviews_json = VALUES(reviews_json),
                reviews_fetch = NOW(),
                updated_at = NOW()
        ");

        $stmt->execute([
            ':loc'     => $locationId,
            ':val'     => $rating['ratingValue'],
            ':cnt'     => $rating['ratingCount'],
            ':reviews' => json_encode($reviews, JSON_UNESCAPED_UNICODE)
        ]);

        return [
            'rating'  => $rating,
            'reviews' => $reviews
        ];
    }

    /**
     * Получить данные из кэша
     */
    public function getCachedData(): ?array
    {
        $locationId = $this->getLocationId();

        $stmt = $this->pdo->prepare("
            SELECT rating_value, rating_count, rating_fetch, reviews_json, reviews_fetch
            FROM gmb_reviews_cache
            WHERE location_id = :loc
        ");
        $stmt->execute([':loc' => $locationId]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return [
            'rating' => [
                'ratingValue' => (float)$row['rating_value'],
                'ratingCount' => (int)$row['rating_count'],
                'bestRating'  => 5,
                'worstRating' => 1,
                'fetchedAt'   => $row['rating_fetch']
            ],
            'reviews' => json_decode($row['reviews_json'], true) ?: []
        ];
    }
}
