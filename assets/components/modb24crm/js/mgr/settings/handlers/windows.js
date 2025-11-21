modB24CRM.window.Handler = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'modb24crm-window-handler';
    }

    Ext.applyIf(config, {
        title: _('modb24crm_handler'),
        width: 600,
        baseParams: {
            action: 'mgr/settings/handler/create',
        },
    });
    modB24CRM.window.Handler.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.window.Handler, modB24CRM.window.Default, {
    getFields: function (config) {
        return [{
            xtype: 'hidden',
            name: 'id',
            id: config.id + '-id'
        }, {
            xtype: 'hidden',
            name: 'account_id',
            id: config.id + '-account_id'
        }, {
            xtype: 'textfield',
            fieldLabel: _('modb24crm_event'),
            name: 'event',
            id: config.id + '-event',
            anchor: '99%',
            allowBlank: true,
        }, {
            xtype: 'modb24crm-combo-classes',
            fieldLabel: _('modb24crm_handler'),
            name: 'handler',
            id: config.id + '-handler',
            anchor: '99%',
            allowBlank: true,
        }];
    },
});
Ext.reg('modb24crm-window-handler', modB24CRM.window.Handler);