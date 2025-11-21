<?php

define('MODX_API_MODE', true);

/** @noinspection PhpIncludeInspection */
require_once dirname(dirname(dirname(dirname(dirname(__FILE__))))) . '/index.php';
/** @var modX $modx */
$modx->getService('error', 'error.modError');
$modx->getRequest();
$modx->setLogLevel(modX::LOG_LEVEL_ERROR);
$modx->setLogTarget('FILE');
$modx->error->message = null;

/** @var modB24CRM $modB24CRM */
$modB24CRM = $modx->getService('modB24CRM', 'modB24CRM', MODX_CORE_PATH . 'components/modb24crm/model/');

$q = $modx->newQuery('modB24Queue')
    ->sortby('createdon', 'asc')
    ->limit(1)
    ->where([
        'sending:IS' => null,
    ]);

while ($queue = $modx->getObject('modB24Queue', $q)){
    $queue->set('sending', date('Y-m-d H:i:s'));
    $queue->save();

    try {
        if ($queue->run())
            $queue->remove();
    }
    catch (Exception $e){

    }
}

$table = $modx->getTableName('modB24Queue');
$stmt = $modx->query("SELECT MAX(`id`) FROM {$table}");
$max = (integer) $stmt->fetch(PDO::FETCH_COLUMN);
$stmt->closeCursor();
if(!$max) $max = 0;
$max++;
$modx->query("ALTER TABLE {$table} AUTO_INCREMENT = {$max}");
