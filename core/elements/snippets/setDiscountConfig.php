<?
// получаем наценку на услуги и ссылку на виджет Altegio a.ivanov
$obj = $modx->getObject('modResource', 1);
if($obj) {
    $discount_percent = $obj->getTVValue('discount_percent');
    $modx->setPlaceholder('discount_percent', $discount_percent); // ловим в чанке chunks/work/service_price_tpl.tpl
    
    $widget_link = $obj->getTVValue('widget_link');
    $modx->setPlaceholder('widget_link', $widget_link); // ловим в чанке chunks/work/service_price_tpl.tpl
}
// получаем наценку на услуги a.ivanov end