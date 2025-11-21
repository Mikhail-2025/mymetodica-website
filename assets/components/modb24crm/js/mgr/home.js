modB24CRM.page.Home = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        components: [{
            xtype: 'modb24crm-panel-home',
            renderTo: 'modb24crm-panel-home-div'
        }]
    });
    modB24CRM.page.Home.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.page.Home, MODx.Component);
Ext.reg('modb24crm-page-home', modB24CRM.page.Home);