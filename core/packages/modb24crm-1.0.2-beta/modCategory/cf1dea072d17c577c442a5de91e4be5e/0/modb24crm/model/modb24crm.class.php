<?php

class modB24CRM
{
    /** @var modX $modx */
    public $modx;

    /** @var string $version */
    public $version = '1.0.2-beta';

    /**
     * @param modX $modx
     * @param array $config
     */
    function __construct(modX &$modx, array $config = [])
    {
        $this->modx =& $modx;
        $corePath = MODX_CORE_PATH . 'components/modb24crm/';
        $assetsUrl = MODX_ASSETS_URL . 'components/modb24crm/';

        $this->config = array_merge([
            'corePath' => $corePath,
            'modelPath' => $corePath . 'model/',
            'processorsPath' => $corePath . 'processors/',

            'connectorUrl' => $assetsUrl . 'connector.php',
            'assetsUrl' => $assetsUrl,
            'cssUrl' => $assetsUrl . 'css/',
            'jsUrl' => $assetsUrl . 'js/',

            'queuesPath' => $corePath . 'model/modb24crm/queues/',
        ], $config);

        $this->modx->addPackage('modb24crm', $this->config['modelPath']);
        $this->modx->lexicon->load('modb24crm:default');
    }

}
