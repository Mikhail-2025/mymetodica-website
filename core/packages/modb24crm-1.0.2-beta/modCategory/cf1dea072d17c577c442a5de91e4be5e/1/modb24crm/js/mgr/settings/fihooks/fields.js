modB24CRM.grid.FiHookFields = function (config) {
    config = config || {};
    if (!config.section) {
        config.section = 'product';
    }
    if (!config.btx_section) {
        config.btx_section = config.section;
    }
    if (!config.id) {
        config.id = 'modb24crm-grid-'+config.section+'-fields';
    }

    Ext.applyIf(config, {
        baseParams: {
            action: 'mgr/settings/' + config.btx_section + '/btxfields',
            section: config.section,
            account_id: MODx.request.account_id,
            sort: 'btx_field',
            dir: 'asc',
        },
        enableDragDrop: false,
        multi_select: false,
        paging: true,
        pageSize: 10,
    });
    modB24CRM.grid.FiHookFields.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.grid.FiHookFields, modB24CRM.grid.Fields, {

    updateField: function (btn, e, row) {
        if (typeof(row) != 'undefined') {
            this.menu.record = row.data;
        }

        var w = Ext.getCmp('modb24crm-window-fihook-field');
        if (w) {
            w.close();
        }
        w = MODx.load({
            xtype: 'modb24crm-window-fihook-field',
            id: 'modb24crm-window-fihook-field',
            update: true,
            record: this.menu.record,
            title: this.menu.record['btx'],
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                    }, scope: this
                },
            }
        });
        w.fp.getForm().reset();
        w.fp.getForm().setValues(this.menu.record);
        w.show(e.target);
    },
});
Ext.reg('modb24crm-grid-fihook-fields', modB24CRM.grid.FiHookFields);

modB24CRM.window.FiHookField = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'modb24crm-window-fihook-field';
    }

    Ext.applyIf(config, {
        width: 400,
        baseParams: {
            action: 'mgr/settings/updatefield',
        },
        _loaded: false
    });
    modB24CRM.window.FiHookField.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.window.FiHookField, modB24CRM.window.Field, {
    getComboField: function (config, checked) {
        if (!checked){
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
                    boxLabel: _('modb24crm_from_form'),
                    name: 'isfield',
                    id: config.id + '-isfield',
                    checked: true,
                    listeners: {
                        check: {
                            fn: function (checkbox, checked) {
                                var f = Ext.getCmp(config.id + '-value');
                                if (!f || !f.label)
                                    return;

                                f.label.dom.innerHTML = checked ? _('modb24crm_input_name') : _('modb24crm_value');

                            }, scope: this
                        },
                    }
                },{
                    xtype: 'textfield',
                    fieldLabel: config.record.isfield ? _('modb24crm_input_name') : _('modb24crm_value'),
                    name: 'value',
                    id: config.id + '-value',
                    anchor: '99%',
                    allowBlank: true,
                });
                break;
            default:
                fields.push({
                    xtype: 'xcheckbox',
                    boxLabel: _('modb24crm_from_form'),
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
        }

        return fields;
    },
});
Ext.reg('modb24crm-window-fihook-field', modB24CRM.window.FiHookField);