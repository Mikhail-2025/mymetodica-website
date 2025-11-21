<?php

abstract class modB24CRMPlugin
{
    /** @var modX $modx */
    protected $modx;
    /** @var modB24CRM $modB24CRM */
    protected $modB24CRM;
    /** @var array $scriptProperties */
    protected $scriptProperties;

    public function __construct(modB24CRM &$modB24CRM, &$scriptProperties)
    {
        $this->modB24CRM = &$modB24CRM;
        $this->modx = &$modB24CRM->modx;
        $this->scriptProperties =& $scriptProperties;
    }

    abstract public function run();
}