modB24CRM.panel.Home = function (config) {
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
            html: '<h2>' + _('modb24crm') + '</h2>',
            cls: '',
            style: {margin: '15px 0'}
        }, {
            xtype: 'modx-tabs',
            defaults: {border: false, autoHeight: true},
            border: true,
            hideMode: 'offsets',
            items: [{
                title: _('modb24crm_accounts'),
                layout: 'anchor',
                items: [{
                    xtype: 'modb24crm-grid-accounts',
                    cls: 'main-wrapper',
                }]
            }],
        }]
    });
    modB24CRM.panel.Home.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM.panel.Home, MODx.Panel);
Ext.reg('modb24crm-panel-home', modB24CRM.panel.Home);
