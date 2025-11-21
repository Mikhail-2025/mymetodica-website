<?php

class modB24CRMPluginOnResourceDuplicate extends modB24CRMPlugin
{
    public function run()
    {
        /** @var modResource $newResource */
        $newResource = $this->modx->getOption('newResource', $this->scriptProperties, null, true);

        $className = 'modB24CRMPluginOnDocFormSave';
        $this->modx->loadClass($className, $this->modB24CRM->config['modelPath'] . 'modb24crm/plugins/', true, true);

        if (class_exists($className)) {
            $handler = new $className($this->modx, array_merge($this->scriptProperties, array('resource' => $newResource)));
            $handler->run();
        }
    }
}