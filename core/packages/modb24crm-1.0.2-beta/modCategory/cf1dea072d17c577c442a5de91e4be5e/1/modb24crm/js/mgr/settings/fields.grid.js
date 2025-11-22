modB24CRM.grid.Fields = function (config) {
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
    modB24CRM.grid.Fields.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.grid.Fields, modB24CRM.grid.Default, {

    getListeners: function () {
        return {};
    },

    getFields: function () {
        return [
            'account_id',
            'btx',
            'section',
            'btx_section',
            'btx_caption',
            'value',
            //'select_value',
            'value_caption',
            'isfield',
            'type',
            'multiple',
            'xtype',
            'actions'];
    },

    getColumns: function () {
        return [{
            header: _('modb24crm_btx_field'),
            dataIndex: 'btx',
            sortable: true,
            width: 200,
            renderer: this._renderBtxField,
        }, {
            header: _('modb24crm_site_field'),
            dataIndex: 'value',
            sortable: true,
            width: 150,
            renderer: this._renderField,
        }, {
            header: _('modb24crm_actions'),
            dataIndex: 'actions',
            renderer: modB24CRM.utils.renderActions,
            sortable: false,
            width: 50,
            id: 'actions'
        }];
    },

    updateField: function (btn, e, row) {
        if (typeof(row) != 'undefined') {
            this.menu.record = row.data;
        }

        var w = Ext.getCmp('modb24crm-window-field');
        if (w) {
            w.close();
        }
        w = MODx.load({
            xtype: 'modb24crm-window-field',
            id: 'modb24crm-window-field',
            update: true,
            record: this.menu.record,
            title: this.menu.record['btx'],
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                        if (this.menu.record.btx === 'CATEGORY_ID'){
                            Ext.getCmp('modb24crm-grid-status-fields').refresh();
                        }
                    }, scope: this
                },/*
                afterrender: function(){
                    this.updField();
                }*/
            }
        });
        w.fp.getForm().reset();
        w.fp.getForm().setValues(this.menu.record);
        w.show(e.target);
    },

    getTopBar: function () {
        return [];
    },

    _renderField: function (value, cell, row) {
        return row.data['value_caption'];
    },

    _renderBtxField: function (value, cell, row) {
        return row.data['btx_caption'];
    },

});
Ext.reg('modb24crm-grid-fields', modB24CRM.grid.Fields);
