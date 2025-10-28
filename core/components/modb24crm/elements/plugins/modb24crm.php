<?php
/** @var modX $modx */
/** @var array $scriptProperties */
/** @var modB24CRM $modB24CRM */
$modB24CRM = $modx->getService('modB24CRM', 'modB24CRM', MODX_CORE_PATH . 'components/modb24crm/model/');

$className = 'modB24CRMPlugin' . ucfirst($modx->event->name);
$modx->loadClass('modB24CRMPlugin', $modB24CRM->config['modelPath'] . 'modb24crm/plugins/', true, true);
$modx->loadClass($className, $modB24CRM->config['modelPath'] . 'modb24crm/plugins/', true, true);

if (class_exists($className)) {
    $handler = new $className($modB24CRM, $scriptProperties);
    $handler->run();
}
return;