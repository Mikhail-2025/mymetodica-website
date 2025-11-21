<?php

define('MODX_API_MODE', true);
define('MODX_ACTION_MODE', true);

$productionIndex = dirname(dirname(dirname(dirname(__FILE__)))) . '/index.php';
$developmentIndex = dirname(dirname(dirname(dirname(dirname(__FILE__))))) . '/index.php';
if (file_exists($productionIndex)) {
/** @noinspection PhpIncludeInspection */
require_once $productionIndex;
} else {
/** @noinspection PhpIncludeInspection */
require_once $developmentIndex;
}

if (!isset($_POST['auth']) || !isset($_POST['event'])){
    die('Access denied');
}

/** @var modX $modx */
$modx->getService('error', 'error.modError');
$modx->setLogLevel(modX::LOG_LEVEL_ERROR);
$modx->setLogTarget('FILE');
$modx->error->message = null;

//$modx->log(1, print_r($_POST,1));

/** @var modB24CRM $modB24CRM */
$modB24CRM = $modx->getService('modB24CRM', 'modB24CRM', MODX_CORE_PATH . 'components/modb24crm/model/');
/** @var modB24Account $modB24Handler */
if ($account = $modx->getObject('modB24Account', array('out_token' => $_POST['auth']['application_token']))){
    $modx->switchContext($account->get('context'));

    /** @var modB24Handler $modB24Handler */
    if (!$modB24Handler = $modx->getObject('modB24Handler', ['account_id' => $account->id, 'event' => $_POST['event']])){
        $modB24Handler = $modx->newObject('modB24Handler');
        $modB24Handler->set('account_id', $account->id);
        $modB24Handler->set('event', $_POST['event']);
        $modB24Handler->save();
    }
    $modB24Handler->run($_POST);
}
else{
    die('Access denied');
}