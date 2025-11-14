<?php
/**
 * CRON script for syncing Altegio reviews to local database
 * Schedule: Every Sunday at 00:00
 * Command: 0 0 * * 0 /usr/bin/php /var/www/mymetodica.com/assets/cron/syncAltegioReviews.php >> /var/www/mymetodica.com/assets/cron/syncAltegioReviews.log 2>&1
 */

// Load credentials from secure config file
$credentialsPath = '/var/www/mymetodica.com/config/altegio_credentials.php';
if (!file_exists($credentialsPath)) {
    die("ERROR: Credentials file not found at $credentialsPath\n");
}
$credentials = require $credentialsPath;

// Load database config from MODX
$modxConfigPath = '/var/www/mymetodica.com/core/config/config.inc.php';
if (!file_exists($modxConfigPath)) {
    die("ERROR: MODX config not found at $modxConfigPath\n");
}
require $modxConfigPath;

$log_file = '/var/www/mymetodica.com/assets/cron/logs/altegio_sync.log';
$company_id = $credentials['company_id'];
$api_url = $credentials['api_base_url'] . '/comments/' . $company_id . '/';
$bearer_token = $credentials['bearer_token'];
$user_token = $credentials['user_token'];

// Database credentials from MODX config
$db_host = $database_server;
$db_name = $dbase;
$db_user = $database_user;
$db_pass = $database_password;

function log_message($message) {
    global $log_file;
    $timestamp = date('Y-m-d H:i:s');
    $log_dir = dirname($log_file);
    if (!is_dir($log_dir)) {
        mkdir($log_dir, 0755, true);
    }
    file_put_contents($log_file, "[$timestamp] $message\n", FILE_APPEND);
    echo "[$timestamp] $message\n";
}

log_message("========================================");
log_message("Начало синхронизации отзывов Altegio");

try {
    $pdo = new PDO("mysql:host=$db_host;dbname=$db_name;charset=utf8mb4", $db_user, $db_pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    log_message("Подключение к БД: OK");
    
    log_message("Запрос к API: $api_url");
    $ch = curl_init($api_url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Accept: application/vnd.api.v2+json',
        'Content-Type: application/json',
        "Authorization: Bearer $bearer_token, User $user_token"
    ));
    
    $response = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    
    if ($http_code !== 200) {
        throw new Exception("API вернул код $http_code");
    }
    
    $data = json_decode($response, true);
    if (!isset($data['data']) || !is_array($data['data'])) {
        throw new Exception("Неверный формат ответа API");
    }
    
    $reviews = $data['data'];
    $total_count = count($reviews);
    log_message("Получено отзывов из API: $total_count");
    
    $stmt = $pdo->prepare("
        INSERT INTO altegio_reviews 
        (review_id, salon_id, master_id, user_name, user_email, user_phone, user_avatar, rating, review_text, review_date)
        VALUES 
        (:review_id, :salon_id, :master_id, :user_name, :user_email, :user_phone, :user_avatar, :rating, :review_text, :review_date)
        ON DUPLICATE KEY UPDATE
            master_id = VALUES(master_id),
            user_name = VALUES(user_name),
            rating = VALUES(rating),
            review_text = VALUES(review_text),
            review_date = VALUES(review_date),
            updated_at = CURRENT_TIMESTAMP
    ");
    
    $inserted = 0;
    $updated = 0;
    
    foreach ($reviews as $review) {
        $check = $pdo->prepare("SELECT id FROM altegio_reviews WHERE review_id = ?");
        $check->execute([$review['id']]);
        $exists = $check->fetch();
        
        $stmt->execute([
            ':review_id' => $review['id'],
            ':salon_id' => $review['salon_id'],
            ':master_id' => $review['master_id'],
            ':user_name' => $review['user_name'] ?? null,
            ':user_email' => $review['user_email'] ?? null,
            ':user_phone' => $review['user_phone'] ?? null,
            ':user_avatar' => $review['user_avatar'] ?? null,
            ':rating' => $review['rating'],
            ':review_text' => $review['text'] ?? null,
            ':review_date' => $review['date']
        ]);
        
        if ($exists) {
            $updated++;
        } else {
            $inserted++;
        }
    }
    
    log_message("Результат:");
    log_message("- Новых отзывов добавлено: $inserted");
    log_message("- Отзывов обновлено: $updated");
    
    $masters_stats = $pdo->query("
        SELECT master_id, COUNT(*) as count, AVG(rating) as avg_rating
        FROM altegio_reviews
        GROUP BY master_id
        ORDER BY count DESC
    ")->fetchAll(PDO::FETCH_ASSOC);
    
    log_message("\nСтатистика по специалистам:");
    foreach ($masters_stats as $stat) {
        log_message(sprintf(
            "- Master ID %d: %d отзывов, средний рейтинг %.1f",
            $stat['master_id'],
            $stat['count'],
            $stat['avg_rating']
        ));
    }
    
    log_message("Синхронизация завершена успешно");
    
} catch (Exception $e) {
    log_message("ОШИБКА: " . $e->getMessage());
    exit(1);
}

log_message("========================================");
exit(0);
