<?php

abstract class modB24CRMTriggerHandler
{
    /** @var modB24Account $account */
    public $account;
	/** @var xPDO $xpdo */
    public $xpdo;


    /**
     * @param modB24Account $account
     */
    function __construct(modB24Account &$account)
    {
        $this->account =& $account;
        $this->xpdo = $account->xpdo;
    }

    abstract public function process($data = array());
}