<?php

class modB24CRMDealFieldsGetListProcessor extends modObjectGetListProcessor
{
    public $languageTopics = array(
        'modb24crm:default',
        'minishop2:default',
        'minishop2:manager',
        'resource',
    );
    public $checkListPermission = true;
    /** @var miniShop2 $miniShop2 */
    public $miniShop2;

    public function initialize()
    {
        $this->miniShop2 = $this->modx->getService('miniShop2');
        return parent::initialize();
    }

    public function iterate(array $data = array())
    {
        $query = $this->getProperty('query', '');
        return $this->getFieldsList($query);
    }

    /**
     * @param string $query
     * @return array
     */
    public function getFieldsList($query = '')
    {

        $fields = $this->getAllFields();

        $list = array();
        if (!empty($fields)) {
            foreach ($fields as $k => $v) {
                if (!empty($query)) {
                    if (preg_match('/' . $query . '/', $k)) {
                        $list[] = array('name' => $v, 'val' => $k);
                    }
                    elseif (preg_match('/' . $query . '/', $v)) {
                        $list[] = array('name' => $v, 'val' => $k);
                    }
                } else {
                    $list[] = array('name' => $v, 'val' => $k);
                }
            }
            return $list;
        }
    }

    public function process()
    {
        $list = $this->iterate();
        $total = count($list);
        
        $limit = $this->getProperty('limit', 20);
        $start = $this->getProperty('start', 0);
        if (!empty($limit)){
            $list = array_splice($list, $start, $limit);
        }

        return $this->outputArray($list, $total);
    }

    /**
     * @return array
     */
    public function getAllFields()
    {

        $fields = array();
        if ($fds = $this->modx->getFields('msOrder')) {
            foreach (array_keys($fds) as $k) {
                if (in_array($k, array('user_id', 'context', 'properties'))) continue;

                $key = $prefix . $k;
                $fields[$key] = $this->modx->lexicon('ms2_' . $k) . " ({$k})";
            }
        }
        if ($fds = $this->modx->getFields('msOrderAddress')) {
            foreach (array_keys($fds) as $k) {
                if (in_array($k, array('id', 'user_id', 'properties'))) continue;

                $key = 'address.' . $k;
                $fields[$key] = $this->modx->lexicon('ms2_' . $k) . " ({$k})";
            }
        }

        return $fields;

    }


}

return 'modB24CRMDealFieldsGetListProcessor';