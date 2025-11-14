<?php

class modB24FIHookCreateProcessor extends modObjectCreateProcessor
{
    /** @var modB24FIHook $object */
    public $object;
    public $classKey = 'modB24FIHook';
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
        $required = array('name','section','account_id');
        foreach ($required as $field) {
            if (!$tmp = trim($this->getProperty($field))) {
                $this->addFieldError($field, $this->modx->lexicon('field_required'));
            } else {
                $this->setProperty($field, $tmp);
            }
        }

        if (!$this->hasErrors()){
            if ($this->modx->getCount($this->classKey, array('name' => $this->getProperty('name'), 'account_id' => $this->getProperty('account_id')))) {
                $this->modx->error->addField('name', $this->modx->lexicon('modb24crm_fihook_err_ae'));
            }
        }

        return !$this->hasErrors();
    }

}

return 'modB24FIHookCreateProcessor';