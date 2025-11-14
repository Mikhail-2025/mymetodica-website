modB24CRM.window.Account = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'modb24crm-window-account';
    }

    Ext.applyIf(config, {
        update: false,
        title: _('modb24crm_account'),
        width: 600,
        baseParams: {
            action: 'mgr/account/create',
        },
    });
    modB24CRM.window.Account.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.window.Account, modB24CRM.window.Default, {

    getFields: function (config) {
        var fields = [{
            xtype: 'hidden',
            name: 'id',
            id: config.id + '-id'
        }, {
            xtype: 'textfield',
            fieldLabel: _('modb24crm_name'),
            name: 'name',
            id: config.id + '-name',
            anchor: '99%',
            allowBlank: false,
        }, {
            xtype: 'textfield',
            fieldLabel: _('modb24crm_host'),
            name: 'host',
            id: config.id + '-host',
            anchor: '99%',
            allowBlank: false,
            disabled: config.update,
            listeners: {
                change: {
                    fn: function (input) {
                        const regex = /(https?:\/\/.*\/)rest\/(\d*)\/(.*)\//ius;
                        let m = regex.exec(input.getValue());
                        console.log('change', input, m)
                        if (m){
                            input.setValue(m[1]);
                            Ext.getCmp(config.id + '-userid').setValue(m[2]);
                            Ext.getCmp(config.id + '-token').setValue(m[3]);
                        }
                    }, scope: this
                },
            }
        }, {
            layout: 'column',
            items: [{
                columnWidth: .3,
                layout: 'form',
                defaults: {msgTarget: 'under'},
                items: [{
                    xtype: 'numberfield',
                    fieldLabel: _('modb24crm_userid'),
                    name: 'userid',
                    id: config.id + '-userid',
                    anchor: '99%',
                    allowBlank: false,
                }]
            }, {
                columnWidth: .7,
                layout: 'form',
                defaults: {msgTarget: 'under'},
                items: [{
                    xtype: 'textfield',
                    fieldLabel: _('modb24crm_token'),
                    name: 'token',
                    id: config.id + '-token',
                    anchor: '99%',
                    allowBlank: false,
                }],
            }]
        }, {
            layout: 'column',
            items: [{
                columnWidth: .3,
                layout: 'form',
                defaults: {msgTarget: 'under'},
                items: [{
                    xtype: 'modb24crm-combo-context',
                    fieldLabel: _('modb24crm_context'),
                    name: 'context',
                    id: config.id + '-context',
                    anchor: '99%',
                    allowBlank: false,
                    disabled: config.update
                }]
            }, {
                columnWidth: .3,
                layout: 'form',
                defaults: {msgTarget: 'under'},
                items: [{
                    xtype: 'xcheckbox',
                    fieldLabel: _('modb24crm_active'),
                    boxLabel: _('yes'),
                    name: 'active',
                    id: config.id + '-active',
                    checked: true,
                }],
            }]
        }];

        if (modB24CRM.config['minishop2']){
            fields.push({
                layout: 'column',
                items: [{
                    columnWidth: .4,
                    layout: 'form',
                    defaults: {msgTarget: 'under'},
                    items: [{
                        xtype: 'modb24crm-combo-sync_orders',
                        fieldLabel: _('modb24crm_sync_orders'),
                        name: 'sync_orders',
                        hiddenName: 'sync_orders',
                        id: config.id + '-sync_orders',
                        anchor: '99%',
                        allowBlank: false,
                    }]
                }, {
                    columnWidth: .6,
                    layout: 'form',
                    defaults: {msgTarget: 'under'},
                    items: [{
                        xtype: 'xcheckbox',
                        fieldLabel: _('modb24crm_sync_catalog'),
                        boxLabel: _('yes'),
                        name: 'sync_catalog',
                        id: config.id + '-sync_catalog',
                        checked: true,
                    }],
                }]
            });
        }

        fields.push({
            layout: 'column',
            items: [{
                columnWidth: .8,
                layout: 'form',
                defaults: {msgTarget: 'under'},
                items: [{
                    xtype: 'displayfield',
                    fieldLabel: _('modb24crm_use_queue'),
                    html: _('modb24crm_use_queue_desc'),
                }]
            }, {
                columnWidth: .2,
                layout: 'form',
                defaults: {msgTarget: 'under'},
                items: [{
                    xtype: 'xcheckbox',
                    boxLabel: _('yes'),
                    name: 'use_queue',
                    id: config.id + '-use_queue',
                    checked: true,
                }],
            }]
        });

        return fields;
    },
});
Ext.reg('modb24crm-window-account', modB24CRM.window.Account);
