#!/usr/bin/env php
<?php
declare(strict_types=1);

require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/lib/BusinessProfileClient.php';

use MyMetodica\Gmb\BusinessProfileClient;

$config = require __DIR__ . '/../config/gmb.php';

$pdo = new PDO(
    'mysql:host=127.0.0.1;dbname=modx_db;charset=utf8mb4',
    'modx_user',
    'ModxPass2025',
    [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]
);

try {
    $client = new BusinessProfileClient($pdo, $config);
    $data = $client->refreshCache();
    
    $log = sprintf(
        "[%s] ✅ OK rating=%.1f count=%d reviews=%d\n",
        date('c'),
        $data['rating']['ratingValue'],
        $data['rating']['ratingCount'],
        count($data['reviews'])
    );
    
    file_put_contents(__DIR__ . '/../logs/gmb_sync.log', $log, FILE_APPEND);
    echo $log;
    exit(0);
    
} catch (Throwable $e) {
    $log = sprintf(
        "[%s] ❌ ERROR %s\n",
        date('c'),
        $e->getMessage()
    );
    
    file_put_contents(__DIR__ . '/../logs/gmb_sync.log', $log, FILE_APPEND);
    fwrite(STDERR, $log);
    exit(1);
}
