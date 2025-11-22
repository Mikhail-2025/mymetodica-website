<?php

class modB24FIHookGetListProcessor extends modObjectGetListProcessor
{
    public $classKey = 'modB24FIHook';
    public $defaultSortField = 'id';
    public $defaultSortDirection = 'asc';
    public $permission = 'mssetting_list';
    public $languageTopics = array('modb24crm:default');


    /**
     * @return bool|null|string
     */
    public function initialize()
    {
        if (!$this->modx->hasPermission($this->permission)) {
            return $this->modx->lexicon('access_denied');
        }

        return parent::initialize();
    }

    public function checkPermissions() {
        $permission = !empty($this->permission) ? $this->modx->hasPermission($this->permission) : true;
        $account_id = $this->getProperty('account_id');
        if (!$permission || !$account_id || !$this->account = $this->modx->getObject('modB24Account', $account_id)){
            $permission = false;
        }
        return $permission;
    }

    /**
     * @param xPDOQuery $c
     *
     * @return xPDOQuery
     */
    public function prepareQueryBeforeCount(xPDOQuery $c)
    {
        $account_id = $this->getProperty('account_id');
        $c->where(array(
            'account_id' => $account_id
        ));
        /*
        if ($this->getProperty('combo')) {
            $c->select('id,host');
            $c->where(array('active' => 1, 'OR:id:=' => $this->getProperty('id')));
        }*/

        return $c;
    }


    /**
     * @param xPDOObject $object
     *
     * @return array
     */
    public function prepareRow(xPDOObject $object)
    {
        $data = $object->toArray();
        $data['actions'] = array();

        $data['actions'][] = array(
            'cls' => '',
            'icon' => 'icon icon-edit',
            'title' => $this->modx->lexicon('modb24crm_menu_update'),
            'action' => 'updateFihook',
            'button' => true,
            'menu' => true,
        );
        $data['actions'][] = array(
            'cls' => array(
                'menu' => 'red',
                'button' => 'red',
            ),
            'icon' => 'icon icon-trash-o',
            'title' => $this->modx->lexicon('modb24crm_menu_enable'),
            'multiple' => $this->modx->lexicon('modb24crm_menu_remove_multiple'),
            'action' => 'removeFihook',
            'button' => true,
            'menu' => true,
        );

        return $data;
    }

}

return 'modB24FIHookGetListProcessor';