<?php

class modB24CRMManagerController extends modExtraManagerController
{
    /** @var modB24CRM $modB24CRM */
    public $modB24CRM;


    /**
     *
     */
    public function initialize()
    {
        $this->modB24CRM = $this->modx->getService('modB24CRM', 'modB24CRM', MODX_CORE_PATH . 'components/modb24crm/model/');

        parent::initialize();
    }

    /**
     * @return array
     */
    public function getLanguageTopics()
    {
        return array('modb24crm:default');
    }

    /**
     * @param string $script
     */
    public function addCss($script)
    {
        $script = $script . '?v=' . md5($this->modB24CRM->version);
        parent::addCss($script);
    }


    /**
     * @param string $script
     */
    public function addJavascript($script)
    {
        $script = $script . '?v=' . md5($this->modB24CRM->version);
        parent::addJavascript($script);
    }


    /**
     * @param string $script
     */
    public function addLastJavascript($script)
    {
        $script = $script . '?v=' . md5($this->modB24CRM->version);
        parent::addLastJavascript($script);
    }
}