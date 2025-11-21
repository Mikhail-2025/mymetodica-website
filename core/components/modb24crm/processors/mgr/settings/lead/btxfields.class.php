<?php

require_once dirname(dirname(__FILE__)) . '/deal/btxfields.class.php';

class modB24CRMBtxLeadFieldsGetListProcessor extends modB24CRMBtxDealFieldsGetListProcessor {

    public $excludeFields = array('ID');

    public $btx_section = 'lead';
    
}

return 'modB24CRMBtxLeadFieldsGetListProcessor';