modB24CRM.panel.Settings = function (config) {
    config = config || {};
    Ext.apply(config, {
        baseCls: 'modx-formpanel',
        layout: 'anchor',
        /*
         stateful: true,
         stateId: 'modb24crm-panel-home',
         stateEvents: ['tabchange'],
         getState:function() {return {activeTab:this.items.indexOf(this.getActiveTab())};},
         */
        hideMode: 'offsets',
        items: [{
            html: '<h2>' + _('modb24crm_settings') + '</h2>',
            cls: '',
            style: {margin: '15px 0'}
        }, {
            xtype: 'modx-tabs',
            defaults: {border: false, autoHeight: true},
            border: true,
            hideMode: 'offsets',
            items: this.getTabs(),
        }]
    });
    modB24CRM.panel.Settings.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.panel.Settings, MODx.Panel, {

    getTabs: function () {

        var tabs = [];

        for (i in modB24CRM.config['sections']) {
            if (!modB24CRM.config['sections'].hasOwnProperty(i)) {
                continue;
            }
            var section = modB24CRM.config['sections'][i];
            tabs.push({
                title: _('modb24crm_' + section),
                layout: 'anchor',
                items: [{
                    html: _('modb24crm_' + section + '_fields_intro_msg'),
                    cls: 'panel-desc',
                }, {
                    xtype: 'modb24crm-grid-fields',
                    id: 'modb24crm-grid-' + section + '-fields',
                    btx_section: section,
                    section: section,
                    cls: 'main-wrapper',
                }]
            });
        }
        tabs.push({
            title: _('modb24crm_fihooks'),
            layout: 'anchor',
            items: [{
                html: _('modb24crm_fihooks_intro_msg'),
                cls: 'panel-desc',
            }, {
                xtype: 'modb24crm-grid-fihooks',
                id: 'modb24crm-grid-fihooks',
                cls: 'main-wrapper',
            }]
        });

        return tabs;
    },

});
Ext.reg('modb24crm-panel-settings', modB24CRM.panel.Settings);
