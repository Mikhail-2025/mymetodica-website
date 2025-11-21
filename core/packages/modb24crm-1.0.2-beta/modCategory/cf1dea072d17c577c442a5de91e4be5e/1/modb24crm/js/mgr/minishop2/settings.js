Ext.ComponentMgr.onAvailable('minishop2-settings-tabs', function(){
    this.items.push({
        title: _('modb24crm_accounts'),
        layout: 'anchor',
        items: [{
            html: _('modb24crm_accounts_intro'),
            bodyCssClass: 'panel-desc',
        }, {
            xtype: 'modb24crm-grid-accounts',
            cls: 'main-wrapper',
        }]
    });
});