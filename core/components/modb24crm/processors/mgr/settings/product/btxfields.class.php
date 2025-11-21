<?php

require_once dirname(dirname(__FILE__)) . '/btxfields.class.php';

class modB24CRMBtxProductFieldsGetListProcessor extends modB24CRMBtxFieldsGetListProcessor {

    public $languageTopics = array(
        'modb24crm:default',
        'minishop2:product',
        'resource',
    );

    public $excludeFields = array('ID', 'SECTION_ID', 'PREVIEW_PICTURE', 'DETAIL_PICTURE');

    public $btx_section = 'product';

    public function prepareRowDefault($field, $row)
    {
        $k = $row['value'];
        if (in_array($row['value'], array_keys($this->modx->getFields('msProduct')))){
            $field['value_caption'] = $this->modx->lexicon('resource_' . $row['value']) . " (".$row['value'].")";
        }
        elseif (in_array($k, array_keys($this->modx->getFields('msProductData')))){
            $field['value_caption'] = $this->modx->lexicon('ms2_product_' . $row['value']) . " (".$row['value'].")";
        }

        return $field;
    }

}

return 'modB24CRMBtxProductFieldsGetListProcessor';