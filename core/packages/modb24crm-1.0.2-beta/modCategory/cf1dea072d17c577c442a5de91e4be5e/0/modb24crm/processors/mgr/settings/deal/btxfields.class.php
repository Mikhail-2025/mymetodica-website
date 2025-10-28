<?php

require_once dirname(dirname(__FILE__)) . '/btxfields.class.php';

class modB24CRMBtxDealFieldsGetListProcessor extends modB24CRMBtxFieldsGetListProcessor {

    public $languageTopics = array(
        'modb24crm:default',
        'minishop2:default',
        'minishop2:manager',
    );

    public $excludeFields = array('ID');

    public $btx_section = 'deal';

    public function prepareRowDefault($field, $row)
    {
        $k = $row['value'];
        if (in_array($row['value'], array_keys($this->modx->getFields('msOrder')))){
            $field['value_caption'] = $this->modx->lexicon('ms2_' . $row['value']) . " (".$row['value'].")";
        }

        return $field;
    }
    
}

return 'modB24CRMBtxDealFieldsGetListProcessor';