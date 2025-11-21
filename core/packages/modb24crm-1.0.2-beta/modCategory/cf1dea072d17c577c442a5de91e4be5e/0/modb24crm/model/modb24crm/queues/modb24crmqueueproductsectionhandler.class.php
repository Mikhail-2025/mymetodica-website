<?php
require_once dirname(__FILE__) . '/modb24crmqueuehandler.class.php';

class modB24CRMQueueProductsectionHandler extends modB24CRMQueueHandler
{
	public function process()
    {
        /** @var msCategory $msCategory */
        $msCategory = $this->xpdo->getObject('msCategory', $this->queue->get('oid'));
        if (!$msCategory)
            return false;

        return $this->account->uploadCategory($msCategory);
    }
}