modB24CRM.grid.Handlers = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'modb24crm-grid-handlers';
    }

    Ext.applyIf(config, {
        baseParams: {
            action: 'mgr/settings/handler/getlist',
            account_id: MODx.request.account_id,
            sort: 'id',
            dir: 'asc',
        },
        enableDragDrop: false,
        multi_select: false,
    });
    modB24CRM.grid.Handlers.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.grid.Handlers, modB24CRM.grid.Default, {

    getListeners: function () {
        return {
            rowDblClick: function (grid, rowIndex, e) {
                var row = grid.store.getAt(rowIndex);
                this.updateHandler(grid, e, row);
            },
        };
    },

    getFields: function () {
        return ['id', 'account_id', 'event', 'handler', 'actions'];
    },

    getColumns: function () {
        return [{
            header: _('id'),
            dataIndex: 'id',
            sortable: true,
            width: 70
        }, {
            header: _('modb24crm_event'),
            dataIndex: 'event',
            sortable: true,
            width: 70
        }, {
            header: _('modb24crm_handler'),
            dataIndex: 'handler',
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
            handler: this.createHandler,
            scope: this
        },'->', this.getSearchField()];
    },

    createHandler: function (btn, e) {
        var w = Ext.getCmp('modb24crm-window-handler');
        if (w) {
            w.hide();
            w.getEl().remove();
        }

        w = MODx.load({
            xtype: 'modb24crm-window-handler',
            id: 'modb24crm-window-handler',
            record: this.menu.record,
            update: false,
            listeners: {
                success: {
                    fn: function () {
                        this.refresh();
                    }, scope: this
                }
            }
        });
        w.fp.getForm().reset();
        w.fp.getForm().setValues({account_id: MODx.request.account_id});
        w.show(e.target);
    },

    updateHandler: function (btn, e, row) {
        if (typeof(row) != 'undefined') {
            this.menu.record = row.data;
        }

        var w = Ext.getCmp('modb24crm-window-handler');
        if (w) {
            w.close();
        }
        w = MODx.load({
            xtype: 'modb24crm-window-handler',
            id: 'modb24crm-window-handler',
            baseParams: {
                action: 'mgr/settings/handler/update',
            },
            update: true,
            record: this.menu.record,
            title: this.menu.record['name'],
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

    handlerAction: function (method) {
        var ids = this._getSelectedIds();
        if (!ids.length) {
            return false;
        }
        MODx.Ajax.request({
            url: modB24CRM.config.connector_url,
            params: {
                action: 'mgr/settings/handler/multiple',
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

    removeHandler: function () {
        var ids = this._getSelectedIds();

        Ext.MessageBox.confirm(
            _('modb24crm_menu_remove_title'),
            ids.length > 1
                ? _('modb24crm_menu_remove_multiple_confirm')
                : _('modb24crm_menu_remove_confirm'),
            function (val) {
                if (val === 'yes') {
                    this.handlerAction('remove');
                }
            }, this
        );
    },

});
Ext.reg('modb24crm-grid-handlers', modB24CRM.grid.Handlers);