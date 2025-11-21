modB24CRM.page.Settings = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        components: [{
            xtype: 'modb24crm-panel-settings',
            renderTo: 'modb24crm-panel-settings-div'
        }],
        buttons: this.getButtons(),
    });
    modB24CRM.page.Settings.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.page.Settings, MODx.Component,{
    getButtons: function() {
        return [{
            text: '<i class="icon icon-undo"></i> ' + _('modb24crm_undo'),
            handler: function(){
                MODx.loadPage('?a=home&namespace=modb24crm');
            },
            scope: this
        }];
    },
});
Ext.reg('modb24crm-page-settings', modB24CRM.page.Settings);