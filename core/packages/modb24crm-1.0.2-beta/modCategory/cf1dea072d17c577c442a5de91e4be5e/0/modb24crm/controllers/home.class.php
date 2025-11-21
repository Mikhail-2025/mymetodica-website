<?php

if (!class_exists('modB24CRMManagerController')) {
    require_once dirname(__FILE__) . '/manager.class.php';
}

/**
 * The home manager controller for modB24CRM.
 *
 */
class modB24CRMHomeManagerController extends modB24CRMManagerController
{

    /**
     * @return bool
     */
    public function checkPermissions()
    {
        return true;
    }


    /**
     * @return null|string
     */
    public function getPageTitle()
    {
        return $this->modx->lexicon('modb24crm');
    }


    /**
     * @return void
     */
    public function loadCustomCssJs()
    {
        $this->addCss($this->modB24CRM->config['cssUrl'] . 'mgr/main.css');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/modb24crm.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/misc/default.grid.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/misc/default.window.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/misc/utils.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/misc/combo.js');

        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/accounts/grid.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/accounts/windows.js');

        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/home.panel.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/home.js');

        $config = $this->modB24CRM->config;
        if ($miniShop2 = $this->modx->getService('miniShop2')) {
            $config['minishop2'] = true;
        }
        else{
            $config['minishop2'] = false;
        }
        $this->addHtml('<script type="text/javascript">
        modB24CRM.config = ' . json_encode($config) . ';
        modB24CRM.config.connector_url = "' . $this->modB24CRM->config['connectorUrl'] . '";
        Ext.onReady(function() {MODx.load({ xtype: "modb24crm-page-home"});});
        </script>');
    }


    /**
     * @return string
     */
    public function getTemplateFile()
    {
        $this->content .= '<div id="modb24crm-panel-home-div"></div>';

        return '';
    }
}