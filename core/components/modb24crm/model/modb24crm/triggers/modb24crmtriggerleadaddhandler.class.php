<?php
require_once dirname(__FILE__) . '/modb24crmtriggerhandler.class.php';

class modB24CRMTriggerLeadAddHandler extends modB24CRMTriggerHandler
{
    /** @var modB24Account $account */
    public $account;

    public function process($data = array())
    {
        $response = $this->account->request('crm.deal.get', array('id' => $data['data']['FIELDS']['ID']));

        if (!$response['result']){
            return;
        }

        /** @var miniShop2 $miniShop2 */
        $miniShop2 = $this->xpdo->getService('miniShop2');
        $miniShop2->initialize($this->account->get('context'));

        $data = $response['result'];
        $createdon = $data['BEGINDATE'];

        /** @var msOrder $order */
        $msOrder = null;
        if ($object_id = $this->account->getLink($data['ID'], 2, false)){
            $msOrder = $this->xpdo->getObject('msOrder', $object_id);
        }

        if (!$msOrder) {
            $msOrder = $this->xpdo->newObject('msOrder');
            $msOrder->fromArray([
                'context'   =>  $this->account->get('context'),
                'num'       =>  $data['TITLE'],
                'createdon' =>  $createdon,
                'delivery'  =>  1,
                'payment'   =>  1,
            ]);
        }

        $msOrder->fromArray([
            'cost'      =>  $data['OPPORTUNITY'],
            'cart_cost' =>  $data['OPPORTUNITY'],
            'weight'    =>  0,
            'comment'   =>  $data['COMMENTS'],
        ]);

        /** @var msOrderAddress $address */
        $address = $this->xpdo->newObject('msOrderAddress');
        $address->set('createdon', $createdon);
        $fields = $this->account->getSectionFields('deal', ['isfield' => 1]);
        foreach($fields as $field){
            if (strpos($field['value'], 'address.') === 0) {
                $address->set(substr($field['value'], 8), $data[$field['btx']]);
            }
            else{
                $msOrder->set($field['value'], $data[$field['btx']]);
            }
        }

        // Adding address
        /** @var msOrderAddress $address */
        $address = $this->xpdo->newObject('msOrderAddress');
        $user_id = 0;
        if (!empty($response['result']['CONTACT_ID'])){
            $response = $this->account->request('crm.contact.get', array('id' => $response['result']['CONTACT_ID']));
            if (!$user_id = $this->account->getLink($response['result']['ID'], 4, false)){
                $email = isset($response['result']['EMAIL'][0]) ? $response['result']['EMAIL'][0]['VALUE'] : '';
                $phone = isset($response['result']['PHONE'][0]) ? $response['result']['PHONE'][0]['VALUE'] : '';
                $receiver = array();
                foreach (array('NAME', 'SECOND_NAME', 'LAST_NAME') as $f){
                    if (!empty($response['result'][$f])){
                        $receiver[] = $response['result'][$f];
                    }
                }
                $receiver = implode(' ', $receiver);
                if (empty($receiver)) {
                    $receiver = $email
                        ? substr($email, 0, strpos($email, '@'))
                        : ($phone
                            ? preg_replace('#[^0-9]#', '', $phone)
                            : uniqid('user_', false));
                }
                if (empty($email)) {
                    $email = $receiver . '@' . $this->xpdo->getOption('http_host');
                }
                if (!empty($phone)) {
                    $phone = $miniShop2->phone_format($phone, '#');
                }


                $c = $this->xpdo->newQuery('modUser');
                $c->leftJoin('modUserProfile', 'Profile');
                $filter = array('username' => $email, 'OR:Profile.email:=' => $email);
                if (!empty($phone)) {
                    $filter['OR:Profile.mobilephone:='] = $phone;
                }
                $c->where($filter);
                $c->select('modUser.id');
                if (!$customer = $this->xpdo->getObject('modUser', $c)) {
                    $customer = $this->xpdo->newObject('modUser', array('username' => $email, 'password' => md5(rand())));
                    $profile = $this->xpdo->newObject('modUserProfile', array(
                        'email' => $email,
                        'fullname' => $receiver,
                        'mobilephone' => $phone
                    ));
                    $customer->addOne($profile);
                    /** @var modUserSetting $setting */
                    $setting = $this->xpdo->newObject('modUserSetting');
                    $setting->fromArray(array(
                        'key' => 'cultureKey',
                        'area' => 'language',
                        'value' => $this->xpdo->getOption('cultureKey', null, 'en', true),
                    ), '', true);
                    $customer->addMany($setting);
                    if (!$customer->save()) {
                        $customer = null;
                    }
                    else if ($groups = $this->xpdo->getOption('ms2_order_user_groups', null, false)) {
                        $groups = array_map('trim', explode(',', $groups));
                        foreach ($groups as $group) {
                            $customer->joinGroup($group);
                        }
                    }
                }
                $user_id = $customer->get('id');
                $this->account->addLink($user_id, $response['result']['ID'], 4);
            }
            $address->fromArray(array(
                'phone' => isset($response['result']['PHONE'][0]) ? $response['result']['PHONE'][0]['VALUE'] : '',
                'region' => $response['result']['ADDRESS_REGION'],
                'city' => $response['result']['ADDRESS_CITY'],
                'index' => $response['result']['ADDRESS_POSTAL_CODE'],
                'street' => $response['result']['ADDRESS'],
            ));
        }
        $address->set('createdon', $createdon);
        $address->set('user_id', $user_id);
        $order->set('user_id', $user_id);

        $order->addOne($address);

        $weight = 0;
        // Adding products
        $response = $this->account->request('crm.deal.productrows.get', array('id' => $data['data']['FIELDS']['ID']));
        $products = array();
        foreach ($response['result'] as $v) {
            $site_id = $this->account->getLink($v['PRODUCT_ID'], 1, false);

            if ($site_id && $tmp = $this->xpdo->getObject('msProduct', $site_id)) {
                $name = $tmp->get('pagetitle');
            } else {
                $name = $v['PRODUCT_NAME'];
            }

            /** @var msOrderProduct $product */
            $product = $this->xpdo->newObject('msOrderProduct');
            $product->fromArray(array(
                'product_id' => $v['id'],
                'name' => $name,
                'price' => $v['PRICE'],
                'count' => $v['QUANTITY'],
                'cost' => $v['PRICE'] * $v['QUANTITY'],
                'weight' => $tmp ? $tmp->get('weight') : 0,
            ));
            $products[] = $product;

            $weight += $product->get('weight') * $product->get('count');
        }
        $order->set('weight', $weight);
        $order->addMany($products);

        if ($order->save()){
            if ($statusId = $this->account->getStatus('lead', $data['STATUS_ID'], false)){
                $miniShop2->changeOrderStatus($order->id, $statusId);
            }
        }
    }
}