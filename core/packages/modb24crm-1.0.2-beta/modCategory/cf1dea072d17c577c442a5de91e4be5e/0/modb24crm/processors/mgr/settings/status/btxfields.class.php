<?php

class modB24CRMBtxStatusFieldsGetListProcessor extends modObjectGetListProcessor {

    public $languageTopics = array();

    /** @var modB24Account $account */
    public $account;
    //public $permission = '';
    
    public $btx_section;
    public $section ;
    public $excludeFields = array('ID');
    
    public function checkPermissions() {
        $permission = !empty($this->permission) ? $this->modx->hasPermission($this->permission) : true;
        $account_id = $this->getProperty('account_id');
        if (!$permission || !$account_id || !$this->account = $this->modx->getObject('modB24Account', $account_id)){
			return false;
        }
        switch ($this->account->get('sync_orders')){
            case 1:
                $this->section = 'lead';
                break;
            case 2:
                $this->section = 'deal';
                break;
            default:
                return false;
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
        //$this->section = $this->getProperty('section', $this->btx_section);

        $list = array(); $total = 0;

        if ($this->section == 'lead'){
            $ENTITY_ID = 'STATUS';
        }
        else{
            $ENTITY_ID = 'DEAL_STAGE';
            $q = $this->modx->newQuery('modB24Field')
                ->where(array(
                    'section' => $this->section,
                    'btx'   =>  'CATEGORY_ID',
                    'account_id' => $this->account->get('id'),
                ))
                ->select('value');
            if ($q->prepare() && $q->stmt->execute()) {
                if ($tmp = $q->stmt->fetchColumn()){
                    $ENTITY_ID = "DEAL_STAGE_{$tmp}";
                }
            }
        }

        $res = $this->account->request('crm.status.list',array(
            'filter' => array(
                'ENTITY_ID' => $ENTITY_ID
            ),
        ));
        if (!empty($res)){
        	$fields = array();

            $total = count($res['result']);
            if (!empty($limit)){
                $res['result'] = array_splice($res['result'], $start, $limit);
            }

        	foreach ($res['result'] as $field){
        	    $key = $field['STATUS_ID'];
                $caption = $field['NAME'] . " ({$key})";
                $xtype = 'minishop2-combo-status';

        		$fields[$key] = array(
        			'account_id' => $this->account->id,
                    'btx_section' => $this->btx_section,
                    'section' => 'status_'.$this->section,
        			'btx' => $key,
        			'btx_caption' => $caption,
                    'isfield' => 1,
        			'value' => '',
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
                ->leftJoin('msOrderStatus', 'Status', 'Status.id = modB24Field.value')
        		->where(array(
        			'section' => 'status_'.$this->section,
                    'account_id' => $this->account->id,
        			'btx:IN' => array_keys($fields),
        		))
        		->select('btx,value,isfield,Status.name status_name');
        	if ($q->prepare() && $q->stmt->execute()) {
			    while ($row = $q->stmt->fetch(PDO::FETCH_ASSOC)){
                    $fields[$row['btx']] = array_merge($fields[$row['btx']], array(
                        'value_caption' => $row['status_name'],
                        'value' => $row['value'],
                        //'select_value' => $row['value'],
                    ));
			    }
			}

			$list = array_values($fields);
        }

        //$data = $this->getData();
        
        return $this->outputArray($list, $total);
    }
}

return 'modB24CRMBtxStatusFieldsGetListProcessor';