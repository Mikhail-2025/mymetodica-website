<?php

abstract class modB24CRMQueueHandler
{
	/** @var modB24Queue $queue */
    public $queue;
    /** @var modB24Account $account */
    public $account;
	/** @var xPDO $xpdo */
    public $xpdo;


    /**
     * @param modB24Queue $queue
     */
    function __construct(modB24Queue &$queue)
    {
        $this->queue =& $queue;
        $this->account =& $this->queue->getOne('Account');
        $this->xpdo = $queue->xpdo;
    }

    abstract public function process();
}