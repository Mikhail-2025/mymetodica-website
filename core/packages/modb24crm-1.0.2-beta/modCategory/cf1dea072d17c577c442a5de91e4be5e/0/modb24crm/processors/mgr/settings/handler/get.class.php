<?php

class modB24HandlerGetProcessor extends modObjectGetProcessor
{
    public $classKey = 'modB24Handler';
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

return 'modB24HandlerGetProcessor';