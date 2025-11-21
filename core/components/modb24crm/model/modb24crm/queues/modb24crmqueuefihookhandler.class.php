<?php
require_once dirname(__FILE__) . '/modb24crmqueuehandler.class.php';

class modB24CRMQueueFihookHandler extends modB24CRMQueueHandler
{
	public function process()
    {
        /** @var modB24FIHook $modB24FIHook */
        $modB24FIHook = $this->xpdo->getObject('modB24FIHook', $this->queue->get('oid'));
        if (!$modB24FIHook)
            return false;

        $section = $modB24FIHook->get('section');
        $fields = $this->queue->get('properties');

        switch ($section){
            case 'lead':
                $fields = array_merge(array(
                    'SOURCE_ID' => 'WEB',
                    'TITLE' => date('Y-m-d H:i:s'),
                    'DATE_CREATE' => date('Y-m-d H:i:s'),
                    'ASSIGNED_BY_ID' => $this->account->get('userid'),
                ), $fields);
                break;
            case 'deal':
                $fields = array_merge(array(
                    "TYPE_ID" => "GOODS",
                    'TITLE' => date('Y-m-d H:i:s'),
                    "OPENED" => "Y",
                    "ASSIGNED_BY_ID" => $this->account->get('userid'),
                    "CURRENCY_ID" => 'RUB',
                    "BEGINDATE" => date('Y-m-d H:i:s'),
                ), $fields);
                break;
            default:
                return false;
        }

        $response = $this->account->request("crm.{$section}.add", array(
            'fields' => $fields,
            'params' => array(
                'REGISTER_SONET_EVENT' => 'Y'
            ),
        ), $modB24FIHook);

        if (!isset($response['error']) && !empty($response['result'])){
            return $response['result'];
        }

        return false;
    }
}