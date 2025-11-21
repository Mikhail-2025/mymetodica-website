<?php

class modB24CRMPluginMsOnUpdateOrder extends modB24CRMPlugin
{
    public function run()
    {
        /** @var msOrder $msOrder */
        $msOrder = $this->modx->getOption('msOrder', $this->scriptProperties);

        /** @var modB24Account $account */
        if (!$account = $this->modx->getObject('modB24Account', array('active' => 1, 'context' => $msOrder->get('context'))))
            return true;

        return $account->uploadOrder($msOrder);
    }
}