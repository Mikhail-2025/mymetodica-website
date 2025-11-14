<?php

class modB24CRMContextGetListProcessor extends modObjectGetListProcessor
{
    public $classKey = 'modContext';
    public $languageTopics = array('context');
    public $defaultSortField = 'key';

    public function beforeQuery()
    {
        if ($this->getProperty('combo')) {
            $this->setProperty('limit', 0);
        }
        return parent::beforeQuery();
    }

    public function prepareQueryBeforeCount(xPDOQuery $c)
    {
        $c->where(array(
            'key:!=' => 'mgr',
        ));

        $search = $this->getProperty('search');
        if (!empty($search)) {
            $c->where(array(
                'key:LIKE' => '%' . $search . '%',
                'OR:description:LIKE' => '%' . $search . '%',
            ));
        }
        return $c;
    }
}

return 'modB24CRMContextGetListProcessor';
