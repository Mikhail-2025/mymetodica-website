<?php

class modB24AccountCreateProcessor extends modObjectCreateProcessor
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
        $required = array('host','token','userid');
        foreach ($required as $field) {
            if (!$tmp = trim($this->getProperty($field))) {
                $this->addFieldError($field, $this->modx->lexicon('field_required'));
            } else {
                $this->setProperty($field, $tmp);
            }
        }

        if (!$this->hasErrors()){
            $host = trim($this->getProperty('host'));
            if (!preg_match("/^(http(s):\/\/)/i", $host)) {
                $host = 'https://' . $host;
            }
            $host = parse_url($host);
            $host = $host['scheme'] . '://' . $host['host'] . '/';
            $this->setProperty('host', $host);

            if ($this->modx->getCount($this->classKey, array('name' => $this->getProperty('name')))) {
                $this->modx->error->addField('host', $this->modx->lexicon('modb24crm_account_err_ae'));
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

    /**
     * @return bool
     */
    public function afterSave()
    {

        $table = $this->modx->getTableName('modB24Field');
        $add = $this->modx->prepare("INSERT INTO {$table} (`account_id`, `section`, `btx`, `value`, `isfield`) VALUES (?, ?, ?, ?, ?)");

        $CATALOG_ID = 0;
        $response = $this->object->request("crm.catalog.list", []);
        if (isset($response['result'][0])){
            $CATALOG_ID = $response['result'][0]['ID'];
        }
        $b24fields = array(
            'product' => array(
                'CATALOG_ID' => array($CATALOG_ID,0),
                'VAT_ID' => array(1,0),
                'CURRENCY_ID' => array('RUB',0),
                'PRICE' => array('price',1),
                'NAME' => array('pagetitle',1),
                'DESCRIPTION' => array('content',1),
                'ACTIVE' => array('published',1),
                'SORT' => array('menuindex',1),
                'XML_ID' => array('id',1),
            ),
            'deal' => array(
                'TITLE' => array('num',1),
                'OPPORTUNITY' => array('cost',1),
                'COMMENTS' => array('address.comment',1),
                'DATE_CREATE' => array('createdon',1),
                'DATE_MODIFY' => array('editedon',1),
                'CURRENCY_ID' => array('RUB',0),
                'ASSIGNED_BY_ID' => array($this->object->get('userid'),0),
            ),
            'lead' => array(
                'TITLE' => array('num',1),
                'OPPORTUNITY' => array('cost',1),
                'COMMENTS' => array('address.comment',1),
                'DATE_CREATE' => array('createdon',1),
                'DATE_MODIFY' => array('editedon',1),
                'CURRENCY_ID' => array('RUB',0),
                'ASSIGNED_BY_ID' => array($this->object->get('userid'),0),
            ),
        );

        foreach ($b24fields as $section => $values){
            foreach ($values as $btx => $v){
                $add->execute(array(
                    $this->object->get('id'),
                    $section,
                    $btx,
                    $v[0],
                    $v[1],
                ));
            }
        }

        return parent::afterSave();
    }

}

return 'modB24AccountCreateProcessor';
