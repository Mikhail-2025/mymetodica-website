<?php
define('MODX_API_MODE', true);
require_once('/var/www/mymetodica.com/index.php');
$modx=new modX();
$modx->initialize('web');

$company_id = 305687;
$url = 'https://api.alteg.io/api/v1/services/'.$company_id.'/';

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_TIMEOUT, 60);
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/vnd.api.v2+json', 'Content-Type: application/json', 'Authorization: Bearer 67s4ntbup9877zhk2kzu, User d171a967be12d4ae7fd836d511090c7a'));
$res = curl_exec($ch);
curl_close($ch);

$result = json_decode($res, true);

if (!empty($result['data'])) {
    foreach ($result['data'] as $key => $value) {
        
        if((int)$value['id'] && $value['price_min'] >= 0) {
            
            $q = $modx->newQuery('modResource');
            $q->leftJoin('modTemplateVarResource', 'Service', 'modResource.id = Service.contentid AND Service.tmplvarid = 102');
            $q->where([
                'modResource.template:IN' => [21],
                'Service.value' => $value['id']
            ]);
            $q->select([
                'modResource.id',
            ]);
            if ($q->prepare() && $q->stmt->execute()) {
                $res = $q->stmt->fetchAll(PDO::FETCH_COLUMN);
            }
            
            if(count($res)) {
                $tmp_res = $modx->getObject('modResource', $res[0]);
                if($tmp_res) {
                    $tmp_res->setTVValue('service_price', $value['price_min']);
                    $tmp_res->setTVValue('service_price_old', $value['price_max']);
                    $tmp_res->save();  // ВАЖНО: Сохранить изменения!
                    echo "Updated: " . $tmp_res->get('pagetitle') . " - $" . $value['price_min'] . "/$" . $value['price_max'] . "\n";
                }
            }
            
        }
    }
    
}
