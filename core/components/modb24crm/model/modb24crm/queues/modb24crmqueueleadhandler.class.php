<?php
require_once dirname(__FILE__) . '/modb24crmqueuehandler.class.php';

class modB24CRMQueueLeadHandler extends modB24CRMQueueHandler
{
    /** @var string $method */
    public $method = 'lead';
    /** @var int $linkId */
    public $linkId = 2;

    public function process()
    {
        /** @var msOrder $msOrder */
        $msOrder = $this->xpdo->getObject('msOrder', $this->queue->get('oid'));
        if (!$msOrder)
            return false;

        /** @var msOrderAddress $address */
        $address = $msOrder->getOne('Address');

        $fields = $this->getBaseFields($msOrder);

        foreach ($this->account->getSectionFields($this->method) as $row){
            if ($row['isfield']){
                if (strpos($row['value'], 'address.') === 0) {
                    $fields[$row['btx']] = $address->get(substr($row['value'], 8));
                }
                else{
                    $fields[$row['btx']] = $msOrder->get($row['value']);
                }
            }
            else{
                $fields[$row['btx']] = $row['value'];
            }
            if (($row['multiple'] || $row['type'] == 'crm_multifield') && !is_array($fields[$row['btx']])){
                $fields[$row['btx']] = array($fields[$row['btx']]);
            }
            if ($row['type'] == 'crm_multifield'){
                foreach ($fields[$row['btx']] as &$v){
                    $v = array(
                        'VALUE' => $v,
                    );
                }
                unset($v);
            }
        }

        $object_id = $this->account->getLink($msOrder->id, $this->linkId);

        if (!empty($object_id)) {
            $response = $this->account->request('crm.'.$this->method.'.update', array(
                'id' => $object_id,
                'fields' => $fields,
            ), $msOrder);
            if (isset($response['error']) && (stripos($response['error_description'], 'Not found') !== false)) {
                $object_id = 0;
            }
        }

        if (empty($object_id)){
            $response = $this->account->request('crm.'.$this->method.'.add', array(
                'fields' => $fields,
                'params' => array(
                    'REGISTER_SONET_EVENT' => 'Y'
                ),
            ), $msOrder);
            if (!isset($response['error']) && !empty($response['result'])){
                $object_id = $response['result'];
                $this->account->addLink($msOrder->id, $object_id, $this->linkId);
            }
        }

        if (empty($object_id))
            return $object_id;

        $products = array();
        foreach ($msOrder->getMany('Products') as $product){
            $btx_id = $this->account->getLink($product->get('product_id'), 1);
            if (empty($btx_id)){
                $btx_id = $this->account->uploadProduct($product->getOne('Product'));
            }

            $products[] = array(
                'PRODUCT_ID' => $btx_id,
                'PRODUCT_NAME' => $product->get('name'),
                'PRICE' => $product->get('price'),
                'QUANTITY' => $product->get('count'),
            );
        }

        if (!empty($msOrder->delivery_cost)){
            $products[] = [
                'PRODUCT_ID' => 0,
                'PRODUCT_NAME' => $msOrder->getOne('Delivery')->get('name'),
                'PRICE' => $msOrder->get('delivery_cost'),
                'QUANTITY' => 1,
            ];
        }

        if (!empty($products)){
            $this->account->request('crm.'.$this->method.'.productrows.set', array(
                'id' => $object_id,
                'rows' => $products,
            ), $msOrder);
        }

        return $object_id;
    }

    public function getBaseFields(msOrder $msOrder)
    {
        /** @var msOrderAddress $address */
        $address = $msOrder->getOne('Address');

        $fields = array(
            "TITLE" => $msOrder->get('num'),
            "OPPORTUNITY" => $msOrder->get('cost'),
            "COMMENTS" => $address->get('comment'),
            "NAME" => $address->get('receiver'),
            "SOURCE_ID" => "WEB",
            "DATE_CREATE" => $msOrder->get('createdon'),
            "STATUS_ID" => $this->account->getStatus($this->method, $msOrder->get('status'), true),
        );

        /** @var modUserProfile $profile */
        if ($profile = $msOrder->getOne('UserProfile')){
            $fields['EMAIL'] = array(array(
                'VALUE' => $profile->get('email'),
                'VALUE_TYPE' => 'HOME',
            ));
        }
        if (!empty($address->get('phone')) ){
            $fields['PHONE'] = array(array(
                'VALUE' => $address->get('phone'),
                'VALUE_TYPE' => 'MOBILE',
            ));
        }

        return $fields;
    }
}