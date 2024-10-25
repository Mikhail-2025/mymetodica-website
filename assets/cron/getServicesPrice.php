<?
define('MODX_API_MODE', true);
require_once('/home/mymetodi/public_html/index.php');
$modx=new modX();
$modx->initialize('web');

$company_id = 305687;
$url = 'https://api.alteg.io/api/v1/services/'.$company_id.'/';

$data = json_encode($data, JSON_UNESCAPED_UNICODE);
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
                /*echo '<pre>';
                print_r($res);
                echo '</pre>';*/
                //$modx->log(1, print_r($res, 1));
                
                $tmp_res = $modx->getObject('modResource', $res[0]);
                if($tmp_res) {
                    $tmp_res->setTVValue('service_price', $value['price_min']);
                }
            } else {
                $modx->log(1, 'Не найден ресурс на сайте по ID=' . $value['id']);
            }
            
        }
    }
    
}