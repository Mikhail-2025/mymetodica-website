<?php

class modB24Account extends xPDOSimpleObject
{

    /**
     * @var modRest $rest
     * @access protected
     */
	protected $rest;

	public function __construct(xPDO & $xpdo) {
		parent::__construct($xpdo);
        $this->rest = $this->xpdo->getService('rest', 'rest.modRest');
	}

	public function request($method = '', $data = array(), $object = null){

        $method = trim($method, '/');

		$url = $this->get('host') . 'rest/' . $this->get('userid') . '/' . $this->get('token') . '/' . $method . '/';

        $response = $this->invokeEvent('modB24CRMOnBeforeRequest', array(
            'account' => $this,
            'modB24Account' => $this,
            'method' => $method,
            'data' => $data,
            'object' => $object,
        ));
        if (!($response['success'])) {
            $this->xpdo->log(xPDO::LOG_LEVEL_ERROR,'Error modB24CRMOnBeforeRequest ('.$method.'): '. $response['message']);
            return false;
        }
        $data = $response['data']['data'];

		$response = $this->rest->post($url, $data);
        $result = $response->process();

		if (empty($result)){
			$this->xpdo->log(xPDO::LOG_LEVEL_ERROR,
				'Error ('.$method.') code: '. $response->responseInfo->scalar . "\n" .print_r($data, 1));
		}
		elseif (isset($result['error'])){
			$this->xpdo->log(xPDO::LOG_LEVEL_ERROR,
				'Error ('.$method.') '.$result['error'].' - '.$result['error_description'] . "\n" .print_r($data, 1));
		}
		return $result;
	}

	/**
	 * Connection check
	 * @return bool
	 */
	public function connectionCheck(){
		$response = $this->request('crm.status.list');
		return (!empty($response) && !isset($response['error']));
	}


    const linkCategory = 0;
    const linkProduct = 1;
    const linkLead = 2;
    const linkDeal = 3;
    const linkContact = 4;

    /**
     * Add a link between the modx object and bitrix24
     * @param int $object_id
     * @param int $bitrix_id
     * @param int $type
     * @return bool
     */
	public function addLink($object_id = 0, $bitrix_id = 0, $type = 0){
		if (!$object_id || !$bitrix_id)
			return false;

		$data = array(
			'account_id' => $this->get('id'),
			'object_id' => $object_id,
			'bitrix_id' => $bitrix_id,
			'type' => $type,
		);
		$sql = "
		INSERT INTO ".$this->xpdo->getTableName('modB24Link')."
		(`".implode("`, `",array_keys($data))."`)
        VALUES (".implode(",",array_fill(0,count($data),'?')).")
        ON DUPLICATE KEY UPDATE
            `". implode("` = ?, `",array_keys($data)) ."` = ? ;
        ";
        $stmt = $this->xpdo->prepare($sql);
        if($stmt){
            if (!$stmt->execute(array_merge(array_values($data), array_values($data)))){
            	$this->xpdo->log( xPDO::LOG_LEVEL_ERROR, "addLink SQL error: \n" . $sql . "\n" .print_r($data,1));
                $stmt->closeCursor();
                return false;
            }
        }
        $stmt->closeCursor();
        return true;
	}

    /**
     * Return ID between the modx object and bitrix24
     * @param int $oid
     * @param int $type
     * @param bool $returnBtx

     * @return bool
     */
	public function getLink($oid = 0, $type = 0, $returnBtx = true){
		$select = $returnBtx ? 'bitrix_id' : 'object_id';
		$criteria = !$returnBtx ? 'bitrix_id' : 'object_id';

		$sql = "
		SELECT `{$select}`
		FROM ".$this->xpdo->getTableName('modB24Link')."
		WHERE `account_id` = ?
		AND `{$criteria}` = ?
		AND `type` = ?";

        $return = 0;
        $stmt = $this->xpdo->prepare($sql);
        if ($stmt && $stmt->execute(array(
        	$this->get('id'),
        	$oid,
        	$type
        ))){
        	$return = $stmt->fetchColumn();
        }
        $stmt->closeCursor();

        return $return;
	}

	/**
     * Get Crm contact id
     * @param modUser $modUser
     * @param string $phone
     *
     * @return int
     */
	public function getContactId(modUser $modUser, $phone = '')
	{
        if (!$profile = $modUser->getOne('Profile')){
			return 0;
		}

		$send = true;
		$contact_id = $this->getLink($modUser->id, static::linkContact);

		$name = $profile->get('fullname');
		if (empty($name)){
			$name = $modUser->get('username');
		}

		$fields = array(
			'NAME' => $name,
			'OPENED' =>'Y',
			'ASSIGNED_BY_ID' => 38,
			'TYPE_ID' => 'CLIENT',
			'SOURCE_ID' => 'WEB',
			'EMAIL' => array(
			    array(
					'VALUE' => $profile->get('email'),
					'VALUE_TYPE' => 'HOME',
		        )
		    ),
		);
		if (!empty($profile->get('phone'))){
			$fields['PHONE'][] = array(
				'VALUE' => $profile->get('phone'),
				'VALUE_TYPE' => 'HOME',
			);
		}
		if (!empty($profile->get('mobilephone'))){
			$fields['PHONE'][] = array(
				'VALUE' => $profile->get('mobilephone'),
				'VALUE_TYPE' => 'MOBILE',
			);
		}

		if (empty($contact_id)){
			$filter = ['EMAIL' => $profile->get('email')];
			if (!empty($phone)){
				$filter['PHONE'] = $phone;
			}
			elseif (!empty($profile->get('mobilephone'))){
				$filter['PHONE'] = $profile->get('mobilephone');
			}
			$response = $this->request('crm.contact.list', array(
			    'order' => ['DATE_CREATE'=>'DESC'],
			    'filter' => $filter,
			    'select' => ['ID', 'EMAIL', 'PHONE'],
			));
			if (!isset($response['error']) && !empty($response['result'])){
				$contact_id = $response['result'][0]['ID'];
				if (!empty($phone)){
					foreach ($response['result'][0]['PHONE'] as $v){
						if ($v['VALUE'] == $phone){
							$send = false;
						}
					}
				}
				$this->addLink($modUser->id, $contact_id, static::linkContact);
			}
		}

		if (empty($contact_id)){
			$response = $this->request('crm.contact.add', array(
			    'fields' => $fields,
		        'params' => array(
					'REGISTER_SONET_EVENT' => 'N'
				),
			), $modUser);
			if (!isset($response['error']) && !empty($response['result'])){
				$contact_id = $response['result'];
				$this->addLink($modUser->id, $contact_id, static::linkContact);
			}
		}
		elseif($send){
			$this->request('crm.contact.update', array(
				'id' => $contact_id,
			    'fields' => $fields,
			), $modUser);
		}

		return $contact_id;
	}

    /**
     * Upload msCategory to Product Section
     * @param msCategory $msCategory
     * @return int
     */
	public function uploadCategory(msCategory $msCategory)
	{
	    if (!$this->get('sync_catalog'))
	        return 0;

		$section_id = 0;
		if ($parent = $msCategory->getOne('Parent')){
			if ($parent instanceof msCategory){
				$section_id = $this->getLink($parent->get('id'), static::linkCategory);
				if ($section_id == 0){
					$section_id = $this->uploadCategory($parent);
				}
			}
		}
		$btx_id = $this->getLink($msCategory->get('id'), static::linkCategory);

		$fields = array(
			'SECTION_ID' => $section_id,
			'NAME' => $msCategory->get('pagetitle'),
		);

		if ($btx_id > 0){
			$this->request("crm.productsection.update", array(
				'id' => $btx_id,
				'fields' => $fields,
			), $msCategory);
		}
		else{
			$response = $this->request("crm.productsection.add", array(
				'fields' => $fields,
			), $msCategory);
			if (isset($response['result']) && !empty($response['result'])){
				$btx_id = $response['result'];
				$this->addLink($msCategory->get('id'), $btx_id, static::linkCategory);
			}
		}

		return $btx_id;
	}

    /**
     * Upload msProduct to Product
     * @param msProduct $msProduct
     * @return int
     */
	public function uploadProduct(msProduct $msProduct)
	{
        if (!$this->get('sync_catalog'))
            return 0;

		if (!($msProduct instanceof msProduct)) {
		    return 0;
		}

		$section_id = 0;
		if ($parent = $msProduct->getOne('Category')){
			if ($parent instanceof msCategory){
				$section_id = $this->getLink($parent->get('id'), static::linkCategory);
				if ($section_id == 0){
					$section_id = $this->uploadCategory($parent);
				}
			}
		}
		$btx_id = $this->getLink($msProduct->get('id'), static::linkProduct);

		$fields = array();
		$q = $this->xpdo->newQuery('modB24Field')
    		->where(array(
    			'section' => 'product',
                'account_id' => $this->get('id'),
    		))
    		->select('btx,value,isfield');
    	if ($q->prepare() && $q->stmt->execute()) {
    		while ($row = $q->stmt->fetch(PDO::FETCH_ASSOC)){
                switch ($row['btx']) {
                    case 'CATALOG_ID':
                    case 'VAT_ID':
                    case 'CURRENCY_ID':
                    case 'MEASURE':
                    	$fields[$row['btx']] = $row['value'];
                        break;
                    default:
                        $fields[$row['btx']] = $row['isfield'] ? $msProduct->get($row['value']) : $row['value'];
                        if ($row['btx'] == 'ACTIVE' && $row['isfield']){
                        	$fields[$row['btx']] = $fields[$row['btx']] ? 'Y' : 'N';
                        }
                        break;
                }
    		}
    	}

		$fields = array_merge(array(
			'SECTION_ID' => $section_id,
			'NAME' => $msProduct->get('pagetitle'),
			'PRICE' => $msProduct->get('price'),
			'CURRENCY_ID' => 'RUB',
			'SORT' => $msProduct->get('menuindex'),
			'ACTIVE' => !empty($msProduct->published) ? 'Y' : 'N',
		), $fields);

		if ($thumb = $msProduct->get('thumb')){
			$thumb = MODX_BASE_PATH . ltrim($thumb, '/');
			if (file_exists($thumb)){
				$fields['PREVIEW_PICTURE'] = array(
					'fileData' => array(
						basename($thumb),
						base64_encode(file_get_contents($thumb))
					),
				);
			}
		}

		if ($image = $msProduct->get('image')){
			$image = MODX_BASE_PATH . ltrim($image, '/');
			if (file_exists($thumb)){
				$fields['DETAIL_PICTURE'] = array(
					'fileData' => array(
						basename($image),
						base64_encode(file_get_contents($image))
					),
				);
			}
		}

		if ($btx_id > 0){
			$this->request("crm.product.update", array(
				'id' => $btx_id,
				'fields' => $fields,
			), $msProduct);
		}
		else{
			$response = $this->request("crm.product.add", array(
				'fields' => $fields,
			), $msProduct);
			if (isset($response['result']) && !empty($response['result'])){
				$btx_id = $response['result'];
				$this->addLink($msProduct->get('id'), $btx_id, static::linkProduct);
			}
		}

		return $btx_id;
	}

    /**
     * Upload msOrder to CRM
     * @param msOrder $msOrder
     * @return int
     */
	public function uploadOrder(msOrder $msOrder)
	{
        switch ($this->get('sync_orders')){
            case 1:
                return $this->addQueue($msOrder->get('id'), 'lead');
            case 2:
                return $this->addQueue($msOrder->get('id'), 'deal');
            default:
                return 0;
        }
	}

    /**
     * Get Deal status
     * @param string $section
     * @param int||string $id
     * @param bool $tocrm
     */
	public function getStatus($section = 'deal', $id = '', $tocrm = true)
    {
        $field = $tocrm ? 'value' : 'btx';
        $return = !$tocrm ? 'value' : 'btx';

        $q = $this->xpdo->newQuery('modB24Field')
            ->innerJoin('msOrderStatus', 'Status', 'Status.id = modB24Field.value')
            ->where(array(
                'section' => "status_{$section}",
                'account_id' => $this->get('id'),
                $field => $id,
            ))
            ->select($return);

        if ($q->prepare() && $q->stmt->execute()) {
            if ($status = $q->stmt->fetchColumn()){
                return $status;
            }
        }
        return false;
    }

    /**
     * Get an array of fields for the section
     * @param string $section
     * @return array
     */
	public function getSectionFields($section = '')
    {
        $fields = array();

        if (empty($section))
            return $fields;

        $q = $this->xpdo->newQuery('modB24Field')
            ->where(array(
                'section' => $section,
                'account_id' => $this->get('id'),
            ))
            ->select('btx,value,isfield,type,multiple');
        if ($q->prepare() && $q->stmt->execute()) {
            $fields = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
        }

        return $fields;
    }

    /**
     * Adds task to queue
     *
     * @param $oid
     * @param $handler
     * @param $properties
     *
     * @return bool|string
     */
    public function addQueue($oid, $handler, $properties = array())
    {
        $oid = (int)$oid;
        $handler = trim($handler);

        /** @var modB24Queue $queue */
        $queue = null;

        if ($this->get('use_queue') && in_array($handler, array('product', 'productsection', 'deal', 'lead'))){
            $queue = $this->xpdo->getObject('modB24Queue', array(
                    'createdon' => date('Y-m-d H:i:s'),
                    'account_id' => $this->get('id'),
                    'oid' => $oid,
                    'handler' => $handler,
                )
            );
        }

        if (!$queue) {
            $queue = $this->xpdo->newObject('modB24Queue', array(
                    'account_id' => $this->get('id'),
                    'oid' => $oid,
                    'handler' => $handler,
                    'properties' => $properties,
                )
            );
        }

        return $this->get('use_queue')
            ? $queue->save()
            : $queue->run();
    }



    /**
     * Shorthand for original modX::invokeEvent() method with some useful additions.
     *
     * @param $eventName
     * @param array $params
     * @param $glue
     *
     * @return array
     */
    public function invokeEvent($eventName, array $params = array(), $glue = '<br/>')
    {
        if ($this->xpdo instanceof modX) {
            if (isset($this->xpdo->event->returnedValues)) {
                $this->xpdo->event->returnedValues = null;
            }

            $response = $this->xpdo->invokeEvent($eventName, $params);
            if (is_array($response) && count($response) > 1) {
                foreach ($response as $k => $v) {
                    if (empty($v)) {
                        unset($response[$k]);
                    }
                }
            }

            $message = is_array($response) ? implode($glue, $response) : trim((string)$response);
            if (isset($this->xpdo->event->returnedValues) && is_array($this->xpdo->event->returnedValues)) {
                $params = array_merge($params, $this->xpdo->event->returnedValues);
            }

            return array(
                'success' => empty($message),
                'message' => $message,
                'data' => $params,
            );
        }
        return array(
            'success' => true,
            'message' => '',
            'data' => $params,
        );
    }

}
