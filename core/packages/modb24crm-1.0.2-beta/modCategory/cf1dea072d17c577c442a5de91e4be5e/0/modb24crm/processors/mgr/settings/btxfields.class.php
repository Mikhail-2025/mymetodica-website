<?php

class modB24CRMBtxFieldsGetListProcessor extends modObjectGetListProcessor {

    public $languageTopics = array();

    /** @var modB24Account $account */
    public $account;
    //public $permission = '';

    public $btx_section;
    public $section;
    public $excludeFields = array('ID');

    public function checkPermissions() {
        $permission = !empty($this->permission) ? $this->modx->hasPermission($this->permission) : true;
        $account_id = $this->getProperty('account_id');
        if (!$permission || !$account_id || !$this->account = $this->modx->getObject('modB24Account', $account_id)){
			$permission = false;
        }
        return $permission;
    }

    public function process() {
    	/*
        $beforeQuery = $this->beforeQuery();
        if ($beforeQuery !== true) {
            return $this->failure($beforeQuery);
        }*/

        $limit = $this->getProperty('limit', 20);
        $start = $this->getProperty('start', 0);
        $this->section = $this->getProperty('section', $this->btx_section);

        $list = array(); $total = 0;

        $res = $this->account->request('crm.'.$this->btx_section.'.fields');
        if (!empty($res)){
        	$fields = array();
            $res['result'] = array_diff_key($res['result'], array_flip($this->excludeFields));

            $total = count($res['result']);
            if (!empty($limit)){
                $res['result'] = array_splice($res['result'], $start, $limit);
            }

        	foreach ($res['result'] as $key => $field){

                $caption = isset($field['listLabel']) ? $field['listLabel'] : $field['title'];
                if (mb_strtolower($caption) != mb_strtolower($key)){
                    $caption .= " ({$key})";
                }
                switch ($key) {
                    case 'CATALOG_ID':
                        $xtype = 'modb24crm-combo-catalog-field';
                        break;
                    case 'CATEGORY_ID':
                        $xtype = 'modb24crm-combo-dealcategory-field';
                        break;
                    case 'VAT_ID':
                        $xtype = 'modb24crm-combo-vat-field';
                        break;
                    case 'CURRENCY_ID':
                        $xtype = 'modb24crm-combo-currency-field';
                        break;
                    case 'MEASURE':
                        $xtype = 'modb24crm-combo-measure-field';
                        break;
                    case 'ASSIGNED_BY_ID':
                        $xtype = 'modb24crm-combo-user-field';
                        break;
                    default:
                        $xtype = 'modb24crm-combo-field';
                        break;
                }

        		$fields[$key] = array(
        			'account_id' => $this->account->id,
                    'btx_section' => $this->btx_section,
                    'section' => $this->section,
        			'btx' => $key,
        			'btx_caption' => $caption,
        			'value' => '',
                    'type' => $field['type'],
                    'multiple' => $field['isMultiple'],
                    //'select_value' => '',
        			'value_caption' => '',
                    'xtype' => $xtype,
                    'actions' => array(array(
                        'cls' => '',
                        'icon' => 'icon icon-edit',
                        'title' => $this->modx->lexicon('modb24crm_menu_update'),
                        'action' => 'updateField',
                        'button' => true,
                        'menu' => true,
                    )),
        		);
        	}
        	$q = $this->modx->newQuery('modB24Field')
        		->where(array(
        			'section' => $this->section,
                    'account_id' => $this->account->id,
        			'btx:IN' => array_keys($fields),
        		))
        		->select('btx,value,isfield');
        	if ($q->prepare() && $q->stmt->execute()) {
			    while ($row = $q->stmt->fetch(PDO::FETCH_ASSOC)){
                    $fields[$row['btx']] = $this->prepareRowBtx($fields[$row['btx']], $row);
			    }
			}

			$list = array_values($fields);
        }

        //$data = $this->getData();

        return $this->outputArray($list, $total);
    }

    public function prepareRowBtx($field, $row)
    {
        $field['isfield'] = (int)$row['isfield'];
        $field['value'] = $row['value'];

        $field['value_caption'] = $row['value'];
        if ($row['isfield']){
            //$field['select_value'] = $row['value'];
            $field = $this->prepareRowDefault($field, $row);
        }
        else{
            if ($row['value'] !== '') {
                switch ($row['btx']) {
                    case 'CATALOG_ID':
                        $response = $this->account->request('crm.catalog.get', array('id' => $row['value']));
                        if (!empty($response) && !isset($response['error'])) {
                            $field['value_caption'] = $response['result']['NAME'] . " ({$row['value']})";
                        }
                        break;
                    case 'CATEGORY_ID':
                        if ($row['value'] == '0') {
                            $field['value_caption'] = $this->modx->lexicon('modb24crm_dealcategory_0') . " ({$row['value']})";
                        } else {
                            $response = $this->account->request('crm.dealcategory.get', array('id' => $row['value']));
                            if (!empty($response) && !isset($response['error'])) {
                                $field['value_caption'] = $response['result']['NAME'] . " ({$row['value']})";
                            }
                        }
                        break;
                    case 'VAT_ID':
                        $response = $this->account->request('crm.vat.get', array('id' => $row['value']));
                        if (!empty($response) && !isset($response['error'])) {
                            $field['value_caption'] = $response['result']['NAME'] . " ({$row['value']})";
                        }
                        break;
                    case 'CURRENCY_ID':
                        $response = $this->account->request('crm.currency.get', array('id' => $row['value']));
                        if (!empty($response) && !isset($response['error'])) {
                            $field['value_caption'] = $response['result']['FULL_NAME'] . " ({$row['value']})";
                        }
                        break;
                    case 'MEASURE':
                        $response = $this->account->request('crm.measure.get', array('id' => $row['value']));
                        if (!empty($response) && !isset($response['error'])) {
                            $field['value_caption'] = $response['result']['MEASURE_TITLE'] . " ({$row['value']})";
                        }
                        break;
                    case 'ASSIGNED_BY_ID':
                        $response = $this->account->request('user.get', array('id' => $row['value']));
                        if (!empty($response) && !isset($response['error']) && isset($response['result'][0])) {
                            $response = array_diff(array(
                                $response['result'][0]['LAST_NAME'],
                                $response['result'][0]['NAME'],
                                $response['result'][0]['SECOND_NAME'],
                            ), array(''));
                            $field['value_caption'] = implode(' ', $response) . " ({$row['value']})";
                        }
                        break;
                    default:
                        break;
                }
            }

        }

        return $field;
    }

    public function prepareRowDefault($field, $row){
        return $field;
    }

    /*
    public function prepareRowDefault($field, $row)
    {
        $k = $row['value'];
        if (in_array($row['value'], array_keys($this->modx->getFields('msProduct')))){
            $field['value_caption'] = $this->modx->lexicon('resource_' . $row['value']) . " (".$row['value'].")";
        }
        elseif (in_array($k, array_keys(prepareRowDefault$this->modx->getFields('msProductData')))){
            $field['value_caption'] = $this->modx->lexicon('ms2_product_' . $row['value']) . " (".$row['value'].")";
        }

        return $field;
    }*/

}
