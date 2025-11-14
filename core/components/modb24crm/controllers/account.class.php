<?php

if (!class_exists('modB24CRMManagerController')) {
    require_once dirname(__FILE__) . '/manager.class.php';
}

class modB24CRMAccountManagerController extends modB24CRMManagerController
{
    /** @var modB24Account $account */
    public $account;

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
        if ($this->account){
            return $this->account->get('name');
        }
        else{
            return $this->modx->lexicon('modb24crm');
        }
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

        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/settings/fields.grid.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/settings/fields.window.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/settings/fihooks/fields.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/settings/fihooks/grid.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/settings/fihooks/windows.js');

        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/settings/settings.panel.js');
        $this->addJavascript($this->modB24CRM->config['jsUrl'] . 'mgr/settings/settings.js');

        $sections = array();

        /** @var miniShop2 $miniShop2 */
        if ($miniShop2 = $this->modx->getService('miniShop2')) {
            if ($this->account->sync_catalog){
                $sections[] = 'product';
            }

            switch($this->account->sync_orders){
                case 1:
                    $sections[] = 'lead';
                    break;
                case 2:
                    $sections[] = 'deal';
                    break;
            }

            if ($this->account->sync_orders){
                $this->addJavascript($miniShop2->config['jsUrl'] . 'mgr/minishop2.js');
                $this->addJavascript($miniShop2->config['jsUrl'] . 'mgr/misc/ms2.combo.js');
                $this->addHtml('<script type="text/javascript">
                    miniShop2.config = ' . json_encode($miniShop2->config) . ';
                </script>');
                $sections[] = 'status';
            }
        }

        $this->addHtml('<script type="text/javascript">
        modB24CRM.config = ' . json_encode($this->modB24CRM->config) . ';
        modB24CRM.config.sections = ' . json_encode($sections) . ';
        modB24CRM.config.connector_url = "' . $this->modB24CRM->config['connectorUrl'] . '";
        Ext.onReady(function() {MODx.load({ xtype: "modb24crm-page-settings"});});
        </script>');
    }


    /**
     * @return string
     */
    public function getTemplateFile()
    {
        if ($this->account)
            $this->content .= '<div id="modb24crm-panel-settings-div"></div>';

        return '';
    }


    public function process(array $scriptProperties = array()) {
        if (!$this->account = $this->modx->getObject('modB24Account', array('id' => intval($_GET['account_id'])))) {
            return '<div class="modx_error">
                <h2><i class="icon icon-exclamation-triangle"></i> An error occurred...</h2>
                <div class="error_container">
                    <p>'.$this->modx->lexicon('modb24crm_account_nf').'</p>
                </div>
            </div>';
        }
        else
            return parent::process($scriptProperties);
    }
}