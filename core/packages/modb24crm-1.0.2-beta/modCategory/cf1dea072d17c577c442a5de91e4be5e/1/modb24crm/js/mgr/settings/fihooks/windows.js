modB24CRM.window.FihookCreate = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'modb24crm-window-fihook';
    }

    Ext.applyIf(config, {
        update: false,
        title: _('modb24crm_fihook'),
        width: 300,
        baseParams: {
            action: 'mgr/settings/fihook/create',
        },
    });
    modB24CRM.window.FihookCreate.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.window.FihookCreate, modB24CRM.window.Default, {

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
            fieldLabel: _('modb24crm_name'),
            name: 'name',
            id: config.id + '-name',
            anchor: '99%',
            allowBlank: false,
        }, {
            xtype:'modx-combo',
            name: 'section',
            hiddenName: 'section',
            fieldLabel: _('modb24crm_section'),
            store: new Ext.data.SimpleStore({
                fields: ['d','v']
                ,data:[
                    [_('modb24crm_lead'),'lead'],
                    [_('modb24crm_deal'),'deal']
                ]
            }),
            mode: 'local',
            displayField: 'd',
            valueField: 'v',
            id: config.id + '-section',
            anchor: '99%',
            allowBlank: false,
            disabled: config.update,
        }];
    },
});
Ext.reg('modb24crm-window-fihook-create', modB24CRM.window.FihookCreate);

modB24CRM.window.FihookUpdate = function (config) {
    config = config || {};

    Ext.applyIf(config, {
        width: 600,
        height: 400,
        baseParams: {
            action: 'mgr/settings/fihook/update',
        },
        bodyCssClass: 'tabs',
    });
    modB24CRM.window.FihookUpdate.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.window.FihookUpdate, modB24CRM.window.FihookCreate, {

    getFields: function (config) {
        return [{
            xtype: 'modx-tabs',
            items: [{
                title: _('modb24crm_fihook'),
                layout: 'form',
                items: modB24CRM.window.FihookCreate.prototype.getFields.call(this, config),
            }, {
                title: _('modb24crm_select_field'),
                items: [{
                    xtype: 'panel',
                    closable: true,
                    autoScroll: true,
                    items: [{
                        xtype: 'modb24crm-grid-fihook-fields',
                        id: 'modb24crm-grid-fihook' + config.record.id + '-fields',
                        btx_section: config.record.section,
                        section: 'fihook' + config.record.id,
                    }]
                }]
            }]
        }];
    }

});
Ext.reg('modb24crm-window-fihook-update', modB24CRM.window.FihookUpdate);