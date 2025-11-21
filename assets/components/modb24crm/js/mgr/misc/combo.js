modB24CRM.combo.Search = function (config) {
    config = config || {};
    Ext.applyIf(config, {
        xtype: 'twintrigger',
        ctCls: 'x-field-search',
        allowBlank: true,
        msgTarget: 'under',
        emptyText: _('search'),
        name: 'query',
        triggerAction: 'all',
        clearBtnCls: 'x-field-search-clear',
        searchBtnCls: 'x-field-search-go',
        onTrigger1Click: this._triggerSearch,
        onTrigger2Click: this._triggerClear,
    });
    modB24CRM.combo.Search.superclass.constructor.call(this, config);
    this.on('render', function () {
        this.getEl().addKeyListener(Ext.EventObject.ENTER, function () {
            this._triggerSearch();
        }, this);
    });
    this.addEvents('clear', 'search');
};
Ext.extend(modB24CRM.combo.Search, Ext.form.TwinTriggerField, {

    initComponent: function () {
        Ext.form.TwinTriggerField.superclass.initComponent.call(this);
        this.triggerConfig = {
            tag: 'span',
            cls: 'x-field-search-btns',
            cn: [
                {tag: 'div', cls: 'x-form-trigger ' + this.searchBtnCls},
                {tag: 'div', cls: 'x-form-trigger ' + this.clearBtnCls}
            ]
        };
    },

    _triggerSearch: function () {
        this.fireEvent('search', this);
    },

    _triggerClear: function () {
        this.fireEvent('clear', this);
    },

});
Ext.reg('modb24crm-combo-search', modB24CRM.combo.Search);
Ext.reg('modb24crm-field-search', modB24CRM.combo.Search);

modB24CRM.combo.listeners_disable = {
    render: function () {
        this.store.on('load', function () {
            if (this.store.getTotalCount() == 1 && this.store.getAt(0).id == this.value) {
                this.readOnly = true;
                this.addClass('disabled');
            }
            else {
                this.readOnly = false;
                this.removeClass('disabled');
            }
        }, this);
    }
}

modB24CRM.combo.Context = function (config) {
    config = config || {};

    Ext.applyIf(config, {
        name: 'context',
        id: 'modb24crm-combo-context',
        hiddenName: 'context',
        displayField: 'key',
        valueField: 'key',
        fields: ['key'],
        pageSize: 10,
        emptyText: _('modb24crm_combo_select'),
        url: modB24CRM.config['connector_url'],
        baseParams: {
            action: 'mgr/system/context/getlist',
            combo: true
        },
        listeners: modB24CRM.combo.listeners_disable
    });
    modB24CRM.combo.Context.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.combo.Context, MODx.combo.ComboBox);
Ext.reg('modb24crm-combo-context', modB24CRM.combo.Context);

modB24CRM.combo.Field = function (config) {
    config = config || {};
    if (!config.section) {
        config.section = 'product';
    }
    
    Ext.applyIf(config, {
        name: 'value',
        id: 'modb24crm-combo-' + config.section + '-field',
        hiddenName: 'value',
        displayField: 'name',
        valueField: 'val',
        fields: ['name', 'val'],
        pageSize: 10,
        emptyText: _('modb24crm_combo_select'),
        url: modB24CRM.config['connector_url'],
        listeners: modB24CRM.combo.listeners_disable
    });
    Ext.applyIf(config.baseParams, {
        action: 'mgr/settings/' + config.section + '/getfields',
        combo: true,
    });
    modB24CRM.combo.Field.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.combo.Field, MODx.combo.ComboBox);
Ext.reg('modb24crm-combo-field', modB24CRM.combo.Field);

modB24CRM.combo.CurrencyField = function (config) {
    config = config || {};
    
    Ext.applyIf(config, {
        name: 'value',
        id: 'modb24crm-combo-currency-field',
        hiddenName: 'value',
        displayField: 'FULL_NAME',
        valueField: 'CURRENCY',
        fields: ['FULL_NAME', 'CURRENCY'],
        pageSize: 10,
        emptyText: _('modb24crm_combo_select'),
        url: modB24CRM.config['connector_url'],
        listeners: modB24CRM.combo.listeners_disable
    });
    Ext.applyIf(config.baseParams, {
        action: 'mgr/system/btx/getlist',
        section: 'currency',
        combo: true,
        query_field: 'FULL_NAME',
    });

    config.tpl = new Ext.XTemplate('\
            <tpl for="."><div class="x-combo-list-item">\
                <span>\
                    <b>{'+ config.displayField +'}</b> <small>({'+ config.valueField +'})</small>\
                </span>\
            </div></tpl>', {
            compiled: true
        });
    modB24CRM.combo.CurrencyField.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.combo.CurrencyField, MODx.combo.ComboBox);
Ext.reg('modb24crm-combo-currency-field', modB24CRM.combo.CurrencyField);

modB24CRM.combo.VatField = function (config) {
    config = config || {};
    
    Ext.applyIf(config, {
        name: 'value',
        id: 'modb24crm-combo-vat-field',
        hiddenName: 'value',
        displayField: 'NAME',
        valueField: 'ID',
        fields: ['NAME', 'ID'],
        pageSize: 10,
        emptyText: _('modb24crm_combo_select'),
        url: modB24CRM.config['connector_url'],
        listeners: modB24CRM.combo.listeners_disable
    });
    Ext.applyIf(config.baseParams, {
        action: 'mgr/system/btx/getlist',
        section: 'vat',
        combo: true,
        query_field: 'NAME',
    });
    modB24CRM.combo.VatField.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.combo.VatField, modB24CRM.combo.CurrencyField);
Ext.reg('modb24crm-combo-vat-field', modB24CRM.combo.VatField);

modB24CRM.combo.DealCategoryField = function (config) {
    config = config || {};
    
    Ext.applyIf(config, {
        id: 'modb24crm-combo-dealcategory-field',
    });
    Ext.applyIf(config.baseParams, {
        action: 'mgr/system/btx/getlist',
        section: 'dealcategory',
        combo: true,
        query_field: 'NAME',
    });
    modB24CRM.combo.DealCategoryField.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.combo.DealCategoryField, modB24CRM.combo.VatField);
Ext.reg('modb24crm-combo-dealcategory-field', modB24CRM.combo.DealCategoryField);

modB24CRM.combo.MeasureField = function (config) {
    config = config || {};
    
    Ext.applyIf(config, {
        name: 'value',
        id: 'modb24crm-combo-measure-field',
        hiddenName: 'value',
        displayField: 'MEASURE_TITLE',
        valueField: 'ID',
        fields: ['MEASURE_TITLE', 'ID'],
        pageSize: 10,
        emptyText: _('modb24crm_combo_select'),
        url: modB24CRM.config['connector_url'],
        listeners: modB24CRM.combo.listeners_disable
    });
    Ext.applyIf(config.baseParams, {
        action: 'mgr/system/btx/getlist',
        section: 'measure',
        combo: true,
        query_field: 'MEASURE_TITLE',
    });
    modB24CRM.combo.MeasureField.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.combo.MeasureField, modB24CRM.combo.CurrencyField);
Ext.reg('modb24crm-combo-measure-field', modB24CRM.combo.MeasureField);

modB24CRM.combo.CatalogField = function (config) {
    config = config || {};

    Ext.applyIf(config, {
        id: 'modb24crm-combo-catalog-field',
    });
    Ext.applyIf(config.baseParams, {
        action: 'mgr/system/btx/getlist',
        section: 'catalog',
        combo: true,
        query_field: 'NAME',
    });
    modB24CRM.combo.CatalogField.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.combo.CatalogField, modB24CRM.combo.VatField);
Ext.reg('modb24crm-combo-catalog-field', modB24CRM.combo.CatalogField);

modB24CRM.combo.UserField = function (config) {
    config = config || {};

    Ext.applyIf(config, {
        id: 'modb24crm-combo-user-field',
    });
    Ext.applyIf(config.baseParams, {
        action: 'mgr/system/btx/getlist',
        section: 'user',
        combo: true,
        query_field: 'NAME',
    });
    modB24CRM.combo.UserField.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.combo.UserField, modB24CRM.combo.VatField);
Ext.reg('modb24crm-combo-user-field', modB24CRM.combo.UserField);

modB24CRM.combo.sync_orders = function(config) {
    config = config || {};
    Ext.applyIf(config,{
        store: new Ext.data.SimpleStore({
            fields: ['d','v']
            ,data:[
                [_('modb24crm_sync_orders_0'), 0],
                [_('modb24crm_sync_orders_1'), 1],
                [_('modb24crm_sync_orders_2'), 2]
            ]
        })
        ,displayField: 'd'
        ,valueField: 'v'
        ,hiddenName: 'sync_orders'
        ,name: 'sync_orders'
        ,mode: 'local'
        ,triggerAction: 'all'
        ,editable: false
        ,selectOnFocus: false
        ,preventRender: true
        ,forceSelection: true
        ,enableKeyEvents: true
    });
    modB24CRM.combo.sync_orders.superclass.constructor.call(this,config);
};
Ext.extend(modB24CRM.combo.sync_orders,MODx.combo.ComboBox);
Ext.reg('modb24crm-combo-sync_orders',modB24CRM.combo.sync_orders);
