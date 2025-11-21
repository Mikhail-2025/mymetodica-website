modB24CRM.grid.Fihooks = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'modb24crm-grid-fihooks';
    }

    Ext.applyIf(config, {
        baseParams: {
            action: 'mgr/settings/fihook/getlist',
            account_id: MODx.request.account_id,
            sort: 'id',
            dir: 'asc',
        },
        enableDragDrop: false,
        multi_select: false,
    });
    modB24CRM.grid.Fihooks.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.grid.Fihooks, modB24CRM.grid.Default, {

    getListeners: function () {
        return {
            rowDblClick: function (grid, rowIndex, e) {
                var row = grid.store.getAt(rowIndex);
                this.updateFihook(grid, e, row);
            },
        };
    },

    getFields: function () {
        return ['id', 'name', 'account_id', 'section', 'actions'];
    },

    getColumns: function () {
        return [{
            header: _('id'),
            dataIndex: 'id',
            sortable: true,
            width: 70
        }, {
            header: _('modb24crm_name'),
            dataIndex: 'name',
            sortable: true,
            width: 70
        }, {
            header: _('modb24crm_section'),
            dataIndex: 'section',
            sortable: true,
            width: 70
        }, {
            header: _('modb24crm_actions'),
            dataIndex: 'actions',
            renderer: modB24CRM.utils.renderActions,
            sortable: false,
            width: 100,
            id: 'actions'
        }];
    },

    getTopBar: function (config) {
        return [{
            text: '<i class="icon icon-plus"></i>&nbsp;' + _('modb24crm_btn_create'),
            handler: this.createFihook,
            scope: this
        },'->', this.getSearchField()];
    },

    createFihook: function (btn, e) {
        var w = Ext.getCmp('modb24crm-window-fihook');
        if (w) {
            w.hide();
            w.getEl().remove();
        }

        w = MODx.load({
            xtype: 'modb24crm-window-fihook-create',
            id: 'modb24crm-window-fihook',
            record: this.menu.record,
            update: false,
            listeners: {
                success: {
                    fn: function (response) {
                        this.refresh();
                        this.menu.record = response.a.result.object;
                        this.updateFihook(null, this);
                    }, scope: this
                }
            }
        });
        w.fp.getForm().reset();
        w.fp.getForm().setValues({
            section: 'lead',
            account_id: MODx.request.account_id
        });
        w.show(e.target);
    },

    updateFihook: function (btn, e, row) {
        if (typeof(row) != 'undefined') {
            this.menu.record = row.data;
        }

        var w = Ext.getCmp('modb24crm-window-fihook');
        if (w) {
            w.close();
        }
        w = MODx.load({
            xtype: 'modb24crm-window-fihook-update',
            id: 'modb24crm-window-fihook',
            record: this.menu.record,
            title: this.menu.record['name'],
            update: true,
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                    }, scope: this
                }
            }
        });
        w.fp.getForm().reset();
        w.fp.getForm().setValues(this.menu.record);
        w.show(e.target);
    },

    fihookAction: function (method) {
        var ids = this._getSelectedIds();
        if (!ids.length) {
            return false;
        }
        MODx.Ajax.request({
            url: modB24CRM.config.connector_url,
            params: {
                action: 'mgr/settings/fihook/multiple',
                method: method,
                ids: Ext.util.JSON.encode(ids),
            },
            listeners: {
                success: {
                    fn: function () {
                        //noinspection JSUnresolvedFunction
                        this.refresh();
                    }, scope: this
                },
                failure: {
                    fn: function (response) {
                        MODx.msg.alert(_('error'), response.message);
                    }, scope: this
                },
            }
        });
    },

    removeFihook: function () {
        var ids = this._getSelectedIds();

        Ext.MessageBox.confirm(
            _('modb24crm_menu_remove_title'),
            ids.length > 1
                ? _('modb24crm_menu_remove_multiple_confirm')
                : _('modb24crm_menu_remove_confirm'),
            function (val) {
                if (val == 'yes') {
                    this.fihookAction('remove');
                }
            }, this
        );
    },

});
Ext.reg('modb24crm-grid-fihooks', modB24CRM.grid.Fihooks);