<?php

class modB24CRMProductFieldsGetListProcessor extends modObjectGetListProcessor
{
    public $languageTopics = array(
        'modb24crm:default',
        'minishop2:product',
        'core:default',
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
     * @param string $prefix
     * @return array
     */
    public function getOptions($prefix = 'option-')
    {
        $options = array();
        if ($collection = $this->modx->getCollection('msOption')) {
            foreach ($collection as $option) {
                $key = $prefix . $option->get('key');
                $options[$key] = $option->get('caption') . " ({$key})";
            }
        }
        return $options;
    }


    /**
     * @param string $prefix
     * @return array
     */
    public function getTVs($prefix = 'tv')
    {
        $tvs = array();
        $result = array();
        $q = $this->modx->newQuery('modTemplateVar')
            ->leftJoin('modTemplateVarTemplate', 'TemplateVarTemplate', 'modTemplateVar.id = TemplateVarTemplate.tmplvarid')
            ->where("`TemplateVarTemplate`.`templateid` IN (SELECT `template` FROM ".$this->modx->getTableName('msProduct')." WHERE `class_key` = 'msProduct')")
            ->select(array(
                'modTemplateVar.*',
            ));
        if ($q->prepare() && $q->stmt->execute()) {
            while ($tv = $q->stmt->fetch(PDO::FETCH_ASSOC)){
                $key = $prefix . $tv['id'];
                $tvs[$key] = (!empty($tv['caption']) ? $tv['caption'] : $tv['name']) . " ({$tv['name']})";
            }
        }
        return $tvs;
    }

    /**
     * @param string $prefix
     * @return array
     */
    public function getProductFields($prefix = '')
    {
        $fields = array();
        if ($fds = $this->modx->getFields('msProduct')) {
            foreach (array_keys($fds) as $k) {
                if (in_array($k, array(
                    'context_key',
                    'class_key',
                    'contentType',
                    'pub_date',
                    'unpub_date',
                    'isfolder',
                    'deletedon',
                    'deletedby',
                    'publishedon',
                    'publishedby',
                    'donthit',
                    'privateweb',
                    'privatemgr',
                    'content_dispo',
                    'hidemenu',
                    'content_type',
                    'hide_children_in_tree',
                    'show_in_tree',
                    'properties',
                ))) continue;

                $key = $prefix . $k;
                $lexicon = $this->modx->lexicon($k);
                if ($lexicon == $k)
                    $lexicon = $this->modx->lexicon('resource_' . $k);
                
                $fields[$key] = $lexicon . " ({$k})";
            }
        }
        if ($fds = $this->modx->getFields('msProductData')) {
            foreach (array_keys($fds) as $k) {
                if ($k == 'id') continue;

                $key = $prefix . $k;
                $fields[$key] = $this->modx->lexicon('ms2_product_' . $k) . " ({$k})";
            }
        }
        return $fields;
    }

    /**
     * @return array
     */
    public function getAllFields()
    {

        $fields = array_merge(
            $this->getProductFields(),
            $this->getOptions('options-', ' (Option)'),
            $this->getTVs('tv', ' (TV)')
        );

        return $fields;

    }


}

return 'modB24CRMProductFieldsGetListProcessor';