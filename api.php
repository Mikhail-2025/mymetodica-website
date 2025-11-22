<?php
// Подключаем MODX
require_once dirname(__FILE__) . '/config.core.php';
require_once MODX_CORE_PATH . 'config/' . MODX_CONFIG_KEY . '.inc.php';
require_once MODX_CORE_PATH . 'model/modx/modx.class.php';

$modx = new modX();
$modx->initialize('web');
header('Content-Type: application/json');

// Допускаем только один тип: services
$type = $_GET['type'] ?? 'services';
if ($type !== 'services') {
    http_response_code(403);
    echo json_encode(['error' => 'This API currently supports only type=services']);
    exit;
}

// Корневой ID для раздела Services
$parentId = 54;

// Получение всех вложенных ID
function getAllChildren($modx, $parentId) {
    $ids = [$parentId];
    $children = $modx->getChildIds($parentId, 10, ['modResource']);
    foreach ($children as $childId) {
        $ids[] = $childId;
    }
    return $ids;
}

$allIds = getAllChildren($modx, $parentId);

// Получаем ресурсы
$resources = $modx->getCollection('modResource', [
    'published' => 1,
    'deleted' => 0,
    'id:IN' => $allIds
]);

$output = [];

// Точное TV-поле, в котором лежит нужная информация
$tvFieldExact = 'services_goodinfo';

// Можно оставить список других текстовых полей, если нужно
$tvNames = ['faq_list', 'accordion_titles', 'accordion_text', 'useful_info', 'gpt_blocks'];

foreach ($resources as $res) {
    $id = $res->get('id');
    $alias = $res->get('alias');
    $parent = $res->get('parent');
    $url = 'https://mymetodica.com/' . $alias . '.html';

    // Название родительского раздела
    $parentTitle = '';
    if ($parentObj = $modx->getObject('modResource', $parent)) {
        $parentTitle = $parentObj->get('pagetitle');
    }

    // Простые TV-поля
    $tvData = [];
    foreach ($tvNames as $tv) {
        $tvData[$tv] = $res->getTVValue($tv);
    }

    // Чтение нужного блока данных строго по имени из MODX
    $infoBlockItems = [];
    $json = $res->getTVValue($tvFieldExact);
    if ($json) {
        $parsed = json_decode($json, true);
        if (is_array($parsed)) {
            $infoBlockItems = $parsed;
        }
    }

    $output[] = [
        'page_id' => $id,
        'title' => $res->get('pagetitle'),
        'url' => $url,
        'introtext' => $res->get('introtext'),
        'content' => $res->get('content'),
        'section_type' => $type,
        'parent_title' => $parentTitle,
        'published' => (int)$res->get('published'),
        'tv_fields' => $tvData,
        'services_goodinfo' => $infoBlockItems
    ];
}

echo json_encode($output, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
