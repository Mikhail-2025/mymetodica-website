<?php

class modB24CRMBtxGetListProcessor extends modObjectGetListProcessor
{
    /** @var modB24Account $account */
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

    public function iterate(array $data = array())
    {
        /*
        $list = array();
        $section = $this->getProperty('section', '');
        if (!$section) return $list;

        $params = array();
        if ($query = $this->getProperty('query', '')){
            if ($query_field = $this->getProperty('query_field', '')){
                $params['filter'] = array(
                    $query_field => $query
                );
            }
        }

        if ($section == 'user'){
            $method = 'user.get';
        }
        else{
            $method = "crm.{$section}.list";
        }

        $response = $this->account->request($method, $params);
        if (!empty($response) && !isset($response['error'])){
            $list = $response['result'];
            if ($section == 'dealcategory'){
                array_unshift($list, array(
                    'ID' => 0,
                    'NAME' => $this->modx->lexicon('modb24crm_dealcategory_0'),
                ));
            }
            elseif ($section == 'user'){
                foreach ($list as &$row) {
                    $row['NAME'] = implode(' ', array_diff(array(
                        $row['LAST_NAME'],
                        $row['NAME'],
                        $row['SECOND_NAME'],
                    ), array('')));
                }
            }
        }

        return $list;*/
    }

    public function process()
    {
        //$list = $this->iterate();

        $list = array();
        $total = 0;
        $section = $this->getProperty('section', '');
        $limit = $this->getProperty('limit', 20);
        $start = $this->getProperty('start', 0);
        if (!$section)
            return $this->outputArray($list, $total);

        $params = array(
            'start' => $start,
        );
        if ($query = $this->getProperty('query', '')){
            if ($query_field = $this->getProperty('query_field', '')){
                $params['filter'] = array(
                    $query_field => $query
                );
            }
        }

        if ($section == 'user'){
            $method = 'user.get';
        }
        else{
            $method = "crm.{$section}.list";
        }

        $response = $this->account->request($method, $params);
        if (!empty($response) && !isset($response['error'])){
            $list = $response['result'];

            $total = $response['total'];

            if ($section == 'dealcategory'){
                $total++;
                if (empty($start)){
                    array_unshift($list, array(
                        'ID' => 0,
                        'NAME' => $this->modx->lexicon('modb24crm_dealcategory_0'),
                    ));
                }
            }

            if (!empty($limit)){
                //$list = array_splice($list, $start, $limit);
                $list = array_splice($list, 0, $limit);
            }

            if ($section == 'user'){
                foreach ($list as &$row) {
                    $row['NAME'] = implode(' ', array_diff(array(
                        $row['LAST_NAME'],
                        $row['NAME'],
                        $row['SECOND_NAME'],
                    ), array('')));
                    if (empty($row['NAME'])){
                        $row['NAME'] = $row['EMAIL'];
                    }
                }
            }
        }

        return $this->outputArray($list, $total);
    }


}

return 'modB24CRMBtxGetListProcessor';
