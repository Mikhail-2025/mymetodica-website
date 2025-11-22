<?php
/** @var modX $modx */
/** @var array $scriptProperties */
/** @var modB24CRM $modB24CRM */
$modB24CRM = $modx->getService('modB24CRM', 'modB24CRM', MODX_CORE_PATH . 'components/modb24crm/model/');
if (!$modB24CRM)
    return;

$modB24CRMHook = $modx->getOption('modB24CRMHook', $scriptProperties, false, true);
if (!$modB24CRMHook)
    return;

$criteria = array(
    'modB24Account.active' => 1,
    'modB24Account.context' => $modx->context->key,
);
if (is_numeric($modB24CRMHook)){
    $criteria['modB24FIHook.id'] = intval($modB24CRMHook);
}
elseif (is_string($modB24CRMHook)){
    $criteria['modB24FIHook.name'] = trim($modB24CRMHook);
}
else{
    return;
}
$q = $modx->newQuery('modB24FIHook')
    ->innerJoin('modB24Account', 'modB24Account', 'modB24Account.id = modB24FIHook.account_id')
    ->where($criteria);

/** @var modB24FIHook $fihook */
if (!$fihook = $modx->getObject('modB24FIHook', $q))
    return;

/** @var modB24Account $account */
$account = $fihook->getOne('Account');

$fields = array();
foreach ($account->getSectionFields('fihook' . $fihook->get('id')) as $row){
    if ($row['isfield']){
        if ($row['type'] == 'file'){
            if (isset($_FILES[$row['value']])) {
                if ($row['multiple']){
                    $tmp = array();
                    foreach (array_keys($_FILES[$row['value']]['name']) as $idx){
                        $tmp[] = array('fileData' => array(
                                $_FILES[$row['value']]['name'][$idx],
                                base64_encode(file_get_contents($_FILES[$row['value']]['tmp_name'][$idx]))
                        ));
                    }
                }
                else {
                    $tmp = array('fileData' => array(
                        $_FILES[$row['value']]['name'],
                        base64_encode(file_get_contents($_FILES[$row['value']]['tmp_name']))
                    ));
                }
            }
        }
        else{
            $tmp = $hook->getValue($row['value']);
        }
    }
    else{
        $tmp = $row['value'];
    }
    if (($row['multiple'] || $row['type'] == 'crm_multifield') && !is_array($tmp)){
        $tmp = array($tmp);
    }
    if ($row['type'] == 'crm_multifield'){
        foreach ($tmp as &$v){
            $v = array(
                'VALUE' => $v,
            );
        }
    }
    $fields[$row['btx']] = $tmp;
}

$account->addQueue($fihook->get('id'), 'fihook', $fields);

return true;