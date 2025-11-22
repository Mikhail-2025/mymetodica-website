<?php

class modB24AccountGetListProcessor extends modObjectGetListProcessor
{
    public $classKey = 'modB24Account';
    public $defaultSortField = 'id';
    public $defaultSortDirection = 'asc';
    //public $permission = '';
    public $languageTopics = array('modb24crm:default', 'minishop2:default', 'minishop2:manager');


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


    /**
     * @param xPDOQuery $c
     *
     * @return xPDOQuery
     */
    public function prepareQueryBeforeCount(xPDOQuery $c)
    {
        if ($this->getProperty('combo')) {
            $c->select('id,host');
            $c->where(array('active' => 1, 'OR:id:=' => $this->getProperty('id')));
        }

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
            'icon' => 'icon icon-cogs',
            'title' => $this->modx->lexicon('modb24crm_settings'),
            'action' => 'settingsAccount',
            'button' => true,
            'menu' => true,
        );

        $data['actions'][] = array(
            'cls' => '',
            'icon' => 'icon icon-edit',
            'title' => $this->modx->lexicon('modb24crm_menu_update'),
            'action' => 'updateAccount',
            'button' => true,
            'menu' => true,
        );
        if (empty($data['active'])) {
            $data['actions'][] = array(
                'cls' => '',
                'icon' => 'icon icon-power-off action-green',
                'title' => $this->modx->lexicon('modb24crm_menu_enable'),
                'multiple' => $this->modx->lexicon('modb24crm_menu_enable'),
                'action' => 'enableAccount',
                'button' => true,
                'menu' => true,
            );
        } else {
            $data['actions'][] = array(
                'cls' => '',
                'icon' => 'icon icon-power-off action-gray',
                'title' => $this->modx->lexicon('modb24crm_menu_disable'),
                'multiple' => $this->modx->lexicon('modb24crm_menu_disable'),
                'action' => 'disableAccount',
                'button' => true,
                'menu' => true,
            );
        }
        $data['actions'][] = array(
            'cls' => array(
                'menu' => 'red',
                'button' => 'red',
            ),
            'icon' => 'icon icon-trash-o',
            'title' => $this->modx->lexicon('modb24crm_menu_remove'),
            'multiple' => $this->modx->lexicon('modb24crm_menu_remove_multiple'),
            'action' => 'removeAccount',
            'button' => true,
            'menu' => true,
        );

        return $data;
    }

}

return 'modB24AccountGetListProcessor';