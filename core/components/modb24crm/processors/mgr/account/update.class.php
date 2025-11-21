<?php

class modB24AccountUpdateProcessor extends modObjectUpdateProcessor
{
    /** @var modB24Account $object */
    public $object;
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


    /**
     * @return bool
     */
    public function beforeSet()
    {
        $required = array('token','userid');
        foreach ($required as $field) {
            if (!$tmp = trim($this->getProperty($field))) {
                $this->addFieldError($field, $this->modx->lexicon('field_required'));
            } else {
                $this->setProperty($field, $tmp);
            }
        }

        return !$this->hasErrors();
    }

    /**
     * @return bool
     */
    public function beforeSave()
    {
        if (!$this->object->connectionCheck()) {
            $this->modx->error->addField('host', $this->modx->lexicon('modb24crm_account_err_connect'));
        }

        return parent::beforeSave();
    }
}

return 'modB24AccountUpdateProcessor';