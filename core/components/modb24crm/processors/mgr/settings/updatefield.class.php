<?php

class modB24CRMBtxFieldUpdateProcessor extends modProcessor
{

    public $account;
    //public $permission = '';

    public function checkPermissions() {
        $permission = !empty($this->permission) ? $this->modx->hasPermission($this->permission) : true;
        $account_id = $this->getProperty('account_id');
        if (!$permission || !$account_id || !$this->account = $this->modx->getObject('modB24Account', $account_id)){
            $permission = false;
        }
        return $permission;
    }

    /**
     * @return array|string
     */
    public function process()
    {
        if (!$this->checkPermissions()) {
            return $this->failure($this->modx->lexicon('access_denied'));
        }

        $btx = $this->getProperty('btx');
        $account_id = $this->getProperty('account_id');
        $section = $this->getProperty('section');
        $isfield = $this->getProperty('isfield');
        $type = $this->getProperty('type');
        $multiple = $this->getProperty('multiple');

        if (!$section) {
            return $this->failure($this->modx->lexicon('modb24crm_field_err_section'));
        }
        $value = $this->getProperty('value');

        $table = $this->modx->getTableName('modB24Field');
        $sql = "DELETE FROM {$table} WHERE btx = ? AND account_id = ? AND section = ?;";
        $stmt = $this->modx->prepare($sql);
        if($stmt){
            $stmt->execute(array(
                $btx,
                $account_id,
                $section,
            ));
        }
        $stmt->closeCursor();

        if ($value !== ''){

            $object = $this->modx->newObject('modB24Field');
            $object->set('btx', $btx);
            $object->set('account_id', $account_id);
            $object->set('section', $section);
            $object->set('isfield', $isfield);
            $object->set('value', $value);
            $object->set('type', $type);
            $object->set('multiple', $multiple);
            $object->save();
        }

        return $this->success();
    }

}

return 'modB24CRMBtxFieldUpdateProcessor';
