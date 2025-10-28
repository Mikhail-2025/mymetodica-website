<?php
class modB24Handler extends xPDOSimpleObject {

    /** @var modB24CRM $modB24CRM */
    public $modB24CRM;

    public function __construct(xPDO & $xpdo) {
        parent::__construct($xpdo);
        $this->modB24CRM = $this->xpdo->getService('modB24CRM', 'modB24CRM', MODX_CORE_PATH . 'components/modb24crm/model/');
    }

    /**
     * array $data
     * @return bool|string
     */
    public function run($data = array())
    {
        $className = $this->get('handler');
        if (!$className)
            return false;

        $files = scandir($this->modB24CRM->config['triggersPath']);
        foreach ($files as $file) {
            if (preg_match('/.*?\.class\.php$/i', $file)) {
                /** @noinspection PhpIncludeInspection */
                include_once($this->modB24CRM->config['triggersPath'] . $file);
            }
        }

        if ($className && class_exists($className)) {
            /** @var modB24CRMTriggerHandler $handler */
            $handler = new $className($this->getOne('Account'));
            return $handler->process($data);
        }

        return false;
    }
}