<?php
require_once dirname(__FILE__) . '/modb24crmqueueleadhandler.class.php';

class modB24CRMQueueDealHandler extends modB24CRMQueueLeadHandler
{
    /** @var string $method */
    public $method = 'deal';
    /** @var int $linkId */
    public $linkId = 3;

    public function getBaseFields(msOrder $msOrder)
    {
        /** @var msOrderAddress $address */
        $address = $msOrder->getOne('Address');

        $fields = array(
            "TITLE" => $msOrder->get('num'),
            "TYPE_ID" => "GOODS",
            "STAGE_ID" => $this->account->getStatus($this->method, $msOrder->get('status'), true),
            "CONTACT_ID" => $this->account->getContactId($msOrder->getOne('User'), $address->get('phone')),
            "OPENED" => "Y",
            "ASSIGNED_BY_ID" => $this->account->get('userid'),
            "CURRENCY_ID" => 'RUB',
            "OPPORTUNITY" => $msOrder->get('cost'),
            "BEGINDATE" => $msOrder->get('createdon'),
            "DATE_MODIFY" => $msOrder->get('updatedon'),
            "COMMENTS" => $address->get('comment'),
        );

        return $fields;
    }
}