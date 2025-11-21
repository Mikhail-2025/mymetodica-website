<?php
class modB24Queue extends xPDOSimpleObject
{

    /** @var modB24CRM $modB24CRM */
    public $modB24CRM;

    public function __construct(xPDO & $xpdo) {
        parent::__construct($xpdo);
        $this->modB24CRM = $this->xpdo->getService('modB24CRM', 'modB24CRM', MODX_CORE_PATH . 'components/modb24crm/model/');
    }

    /**
     * @return bool|string
     */
    public function run()
    {
        $queue = $this->get('handler');

        $className = $this->xpdo->loadClass('modB24CRMQueue' . ucfirst($queue) . 'Handler', $this->modB24CRM->config['queuesPath'], true, true);

        if ($className && class_exists($className)) {
            $handler = new $className($this);
            return $handler->process();
        }

        return false;
    }

}