<?php

class modB24HandlerMultipleProcessor extends modProcessor
{


    /**
     * @return array|string
     */
    public function process()
    {
        if (!$method = $this->getProperty('method', false)) {
            return $this->failure();
        }
        $ids = json_decode($this->getProperty('ids'), true);
        if (empty($ids)) {
            return $this->success();
        }

        /** @var modB24CRM $modB24CRM */
        $modB24CRM = $this->modx->getService('modB24CRM', 'modB24CRM', MODX_CORE_PATH . 'components/modb24crm/model/');

        foreach ($ids as $id) {
            /** @var modProcessorResponse $response */
            $response = $this->modx->runProcessor('mgr/settings/handler/' . $method, array('id' => $id), array(
                'processors_path' => $modB24CRM->config['processorsPath'],
            ));
            if ($response->isError()) {
                return $response->getResponse();
            }
        }

        return $this->success();
    }

}

return 'modB24HandlerMultipleProcessor';