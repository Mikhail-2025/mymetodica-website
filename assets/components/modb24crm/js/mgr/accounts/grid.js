modB24CRM.grid.Accounts = function (config) {
    config = config || {};
    if (!config.id) {
        config.id = 'modb24crm-grid-accounts';
    }

    Ext.applyIf(config, {
        baseParams: {
            action: 'mgr/account/getlist',
            sort: 'id',
            dir: 'asc',
        },
        enableDragDrop: false,
        multi_select: false,
    });
    modB24CRM.grid.Accounts.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.grid.Accounts, modB24CRM.grid.Default, {

    getListeners: function () {
        return {
            rowDblClick: function (grid, rowIndex, e) {
                var row = grid.store.getAt(rowIndex);
                this.updateAccount(grid, e, row);
            },
        };
    },

    getFields: function () {
        return ['id', 'name', 'host', 'token', 'userid', 'sync_orders', 'sync_catalog', 'use_queue', 'context', 'active', 'actions'];
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
            header: _('modb24crm_host'),
            dataIndex: 'host',
            sortable: true,
            width: 70
        }, {
            header: _('modb24crm_token'),
            dataIndex: 'token',
            sortable: true,
            width: 70
        }, {
            header: _('modb24crm_context'),
            dataIndex: 'context',
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
            handler: this.createAccount,
            scope: this
        },'->', this.getSearchField()];
    },

    createAccount: function (btn, e) {
        var w = Ext.getCmp('modb24crm-window-account');
        if (w) {
            w.hide();
            w.getEl().remove();
        }

        w = MODx.load({
            xtype: 'modb24crm-window-account',
            id: 'modb24crm-window-account',
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
        w.fp.getForm().setValues({active: true});
        w.show(e.target);
    },

    updateAccount: function (btn, e, row) {
        if (typeof(row) != 'undefined') {
            this.menu.record = row.data;
        }

        var w = Ext.getCmp('modb24crm-window-account');
        if (w) {
            w.close();
        }
        w = MODx.load({
            xtype: 'modb24crm-window-account',
            id: 'modb24crm-window-account',
            baseParams: {
                action: 'mgr/account/update',
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

    accountAction: function (method) {
        var ids = this._getSelectedIds();
        if (!ids.length) {
            return false;
        }
        MODx.Ajax.request({
            url: modB24CRM.config.connector_url,
            params: {
                action: 'mgr/account/multiple',
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

    enableAccount: function () {
        this.accountAction('enable');
    },

    disableAccount: function () {
        this.accountAction('disable');
    },

    settingsAccount: function (btn, e, row) {
        if (typeof(row) != 'undefined') {
            this.menu.record = row.data;
        }
        else if (!this.menu.record) {
            return false;
        }
        var id = this.menu.record.id;
        
        MODx.loadPage('account', 'namespace=modb24crm&account_id=' + id);
    },

    removeAccount: function () {
        var ids = this._getSelectedIds();

        Ext.MessageBox.confirm(
            _('modb24crm_menu_remove_title'),
            ids.length > 1
                ? _('modb24crm_menu_remove_multiple_confirm')
                : _('modb24crm_menu_remove_confirm'),
            function (val) {
                if (val == 'yes') {
                    this.accountAction('remove');
                }
            }, this
        );
    },

});
Ext.reg('modb24crm-grid-accounts', modB24CRM.grid.Accounts);