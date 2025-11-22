<?php

class modB24ClassGetListProcessor extends modProcessor
{
    /**
     * @return string
     */
    public function process()
    {
        /** @var modB24CRM $modB24CRM */
        $modB24CRM = $this->modx->getService('modB24CRM', 'modB24CRM', MODX_CORE_PATH . 'components/modb24crm/model/');

        $declared = get_declared_classes();

        // Original classes
        $files = scandir($modB24CRM->config['triggersPath']);
        foreach ($files as $file) {
            if (preg_match('/.*?\.class\.php$/i', $file)) {
                /** @noinspection PhpIncludeInspection */
                include_once($modB24CRM->config['triggersPath'] . $file);
            }
        }

        //$handler = 'modB24CRM' . ucfirst($type) . 'Handler';
        $handler = 'modB24CRMTriggerHandler';

        $declared = array_diff(get_declared_classes(), $declared);
        $available = array();
        foreach ($declared as $class) {
            if ($class == $handler) {
                continue;
            }
            try {
                $object = new $class($this->modx->newObject('modB24Account'));

                if (!empty($object)) {
                    $available[] = array(
                        'class' => $class,
                    );
                }
            } catch (Error $e) {
                // nothing
            }
        }

        return $this->outputArray($available);
    }

}

return 'modB24ClassGetListProcessor';