<?php
require_once dirname(__FILE__) . '/modb24crmqueuehandler.class.php';

class modB24CRMQueueProductHandler extends modB24CRMQueueHandler
{
	public function process()
    {
        /** @var msProduct $msProduct */
        $msProduct = $this->xpdo->getObject('msProduct', $this->queue->get('oid'));
        if (!$msProduct)
            return false;

        return $this->account->uploadProduct($msProduct);
    }
}