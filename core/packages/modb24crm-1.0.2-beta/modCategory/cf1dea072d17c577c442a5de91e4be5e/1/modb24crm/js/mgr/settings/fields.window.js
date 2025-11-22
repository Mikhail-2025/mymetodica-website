modB24CRM.window.Field = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'modb24crm-window-field';
    }

    Ext.applyIf(config, {
        width: 400,
        baseParams: {
            action: 'mgr/settings/updatefield',
        },
        _loaded: false
    });
    modB24CRM.window.Field.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.window.Field, modB24CRM.window.Default, {

    getComboField: function (config, checked) {
        if (checked){
            return {
                xtype: config.record.xtype,
                section: config.record.btx_section,
                fieldLabel: _('modb24crm_select'),
                name: 'value',
                hiddenName: 'value',
                id: config.id + '-value',
                anchor: '99%',
                allowBlank: true,
                baseParams: {
                    account_id: config.record.account_id
                },
                listeners: modB24CRM.combo.listeners_disable
            };
        }
        else {
            return {
                xtype: 'textfield',
                fieldLabel: _('modb24crm_value'),
                name: 'value',
                id: config.id + '-value',
                anchor: '99%',
                allowBlank: true,
            };
        }
    },

    getFields: function (config) {
        var _self = this;
        var fields = [{
            xtype: 'hidden',
            name: 'btx',
            id: config.id + '-btx'
        }, {
            xtype: 'hidden',
            name: 'account_id',
        }, {
            xtype: 'hidden',
            name: 'section',
        }, {
            xtype: 'hidden',
            name: 'multiple',
        }, {
            xtype: 'hidden',
            name: 'type',
        }];

        switch (config.record.xtype){
            case 'modb24crm-combo-field':
                fields.push({
                    xtype: 'xcheckbox',
                    boxLabel: _('modb24crm_isfield'),
                    name: 'isfield',
                    id: config.id + '-isfield',
                    checked: true,
                    listeners: {
                        afterrender: {
                            fn: function (checkbox) {
                                this.config._loaded = true;
                            }, scope: this
                        },
                        check: {
                            fn: function (checkbox, checked) {
                                if (!this.config._loaded)
                                    return;

                                var f = Ext.getCmp(config.id + '-value');
                                if (f)
                                    f.destroy();

                                var w = Ext.getCmp(config.id);
                                w.items.get(0).add(_self.getComboField(config, checked));
                                w.doLayout();
                                Ext.getCmp(config.id + '-value').setValue(config.record.value);

                            }, scope: this
                        },
                    }
                });
                fields.push(this.getComboField(config, config.record.isfield));
                break;
            case 'minishop2-combo-status':
                fields.push({
                    xtype: 'hidden',
                    name: 'isfield',
                },{
                    xtype: 'minishop2-combo-status',
                    fieldLabel: _('modb24crm_select'),
                    name: 'value',
                    hiddenName: 'value',
                    id: config.id + '-value',
                    anchor: '99%',
                    allowBlank: true,
                });
                break;
            default:
                fields.push({
                    xtype: 'hidden',
                    name: 'isfield',
                },{
                    xtype: config.record.xtype,
                    section: config.record.btx_section,
                    fieldLabel: _('modb24crm_select'),
                    name: 'value',
                    hiddenName: 'value',
                    id: config.id + '-value',
                    anchor: '99%',
                    allowBlank: true,
                    baseParams: {
                        account_id: config.record.account_id
                    },
                });
                break;
        }

        return fields;
    },

});
Ext.reg('modb24crm-window-field', modB24CRM.window.Field);