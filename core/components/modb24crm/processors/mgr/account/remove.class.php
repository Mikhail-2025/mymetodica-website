<?php

class modB24AccountRemoveProcessor extends modObjectRemoveProcessor
{
    public $classKey = 'modB24Account';
    public $languageTopics = array('modb24crm');
    //public $permission = '';


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

}

return 'modB24AccountRemoveProcessor';