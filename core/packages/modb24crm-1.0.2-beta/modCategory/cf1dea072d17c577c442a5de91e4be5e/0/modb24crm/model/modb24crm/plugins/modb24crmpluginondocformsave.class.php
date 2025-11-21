<?php

class modB24CRMPluginOnDocFormSave extends modB24CRMPlugin
{
    public function run()
    {
        /** @var modResource $resource */
        $resource = $this->modx->getOption('resource', $this->scriptProperties);

        switch ($resource->get('class_key')){
            case 'msCategory':
                $section = 'productsection';
                break;
            case 'msProduct':
                $section = 'product';
                break;
            default:
                return true;
        }

        /** @var modB24Account $account */
        if (!$account = $this->modx->getObject('modB24Account', array('active' => 1, 'context' => $resource->get('context_key'))))
            return true;

        if (!$account->get('sync_catalog'))
            return true;

        return $account->addQueue($resource->get('id'), $section);
    }
}