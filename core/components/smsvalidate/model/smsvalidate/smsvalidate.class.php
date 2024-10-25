<?php

class SmsValidate
{
    /** @var modX $modx */
    public $modx;
    /** @var array $config */
    public $config;
    public $fields;


    /**
     * @param modX $modx
     * @param array $config
     */
    function __construct(modX &$modx, array $config = array())
    {
        $this->modx =& $modx;
        $this->modx->lexicon->load('smsvalidate:default');
        $this->config = array_merge([
            'sms_login' => 'Metodica',
            'sms_sender' => 'MedSpa',
            'api_key' => '5e9faf7548f3b6540dd1556b095d244e5a10f7eb',
        ], $config);
        
        $this->fields = [
            'name',
            'phone',
            'email',
            'sms_code',
            'repeat_sms'
        ];   
    }

    public function generateCode($length = 6)
    {
        $max = '';
        for($i = 0; $i < $length; $i++){
            $max .= '9';
        }
        return random_int(1 * 10 ** ($length - 1), (int)$max);
    }

    public function sendSms($phone, $code, $method = 'send')
    {   
        if(!$phone || !$code) {
            return false;
        }
        // приводим телефон к нужному формату
        $phone = str_replace(['+', '(', ')', '-', ' '], '', $phone);
        
        //отправка СМС в сервис
        
        // создаем сигнатуру
        $params = array(
            'timestamp' => time(),
            'login'     => $this->config['sms_login'],
            'phone'     => $phone,
            'sender'    => $this->config['sms_sender'],
            'text'      => $code
        );
        ksort($params);
        reset($params);
        $sign = md5(implode($params) . $this->config['api_key']);
        
        // запрос в сервис
        $get = array(
        	'login'  => $this->config['sms_login'],
        	'signature' => $sign,
        	'phone' => $phone,
        	'text' => $code,
        	'sender' => $this->config['sms_sender'],
        	'timestamp' => time(),
        );
        
        $url = 'https://dashboard.intistele.com/external/get/' . $method . '.php?';
        $ch = curl_init($url . http_build_query($get));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_HEADER, false);
        $html = curl_exec($ch);
        curl_close($ch);
        $res = json_decode($html, true);
        
        $this->modx->log(1, print_r($res, 1));
        
        if($res[$phone]['error'] === '0') {
            return true;
        }
        return false;
    }
    
    // экранирование входящего массива, оставляем только нужные поля
    public function arraySanitise($array) {
        $output = [];
        $included_fieds = $this->fields;
        foreach($array as $key => $item) {
            if(in_array($key, $included_fieds)) {
                $output[$key] = strip_tags($item);
            }
        }
        return $output;
    }

    public function runProcess($request, $value, $limit = 30)
    {
        $success = false;
        $message = '';
        $request = $this->arraySanitise($request);
        if($request['phone'] && $request['name'] && $request['email']) {
            if(!isset($_SESSION['sms_code']) || $request['repeat_sms'] == 1) {
                $_SESSION['sms_code'] = $this->generateCode();
                $_SESSION['exec_time'] = time();
                // отправка СМС на сервис
                if(!$this->sendSms($request['phone'], $_SESSION['sms_code'])) {
                    //$message = 'SMS-service error, contact the site administrator';
                    $message = $this->modx->lexicon('sms_validate_service_error_l');
                } else {
                    if((time() - $_SESSION['exec_time']) < $limit) {
                        $message = $this->modx->lexicon('sms_validate_send_30_seconds');
                    } else {
                        $message = $this->modx->lexicon('sms_validate_send_with_repeat');
                    }
                }
                $this->modx->log(1, $_SESSION['sms_code']);
            }
            elseif ($value == '' && $_SESSION['sms_code']) {
                if((time() - $_SESSION['exec_time']) < $limit) {
                    $message = $this->modx->lexicon('sms_validate_send_30_seconds');
                } else {
                    $message = $this->modx->lexicon('sms_validate_send_with_repeat');
                }
            }
            elseif ($_SESSION['sms_code'] && $value != $_SESSION['sms_code']) {            
                if(time() - $_SESSION['exec_time'] < $limit) {
                    $message = $this->modx->lexicon('sms_validate_send_incorrect_30_seconds');
                } else {
                    $message = $this->modx->lexicon('sms_validate_send_incorrect_with_repeat');
                }
            } else {
                unset($_SESSION['sms_code']);
                unset($_SESSION['exec_time']);
                $success = true;
            }
            $output = [
                'success' => $success,
                'message' => $message,
            ];
        } else {
            $output = [
                'success' => true,
                'message' => '',
            ];
        }
        return $output;
    }
}
