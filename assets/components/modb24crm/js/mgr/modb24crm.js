var modB24CRM = function (config) {
    config = config || {};
    modB24CRM.superclass.constructor.call(this, config);
};
Ext.extend(modB24CRM, Ext.Component, {
    page: {}, window: {}, grid: {}, tree: {}, panel: {}, combo: {}, config: {}, view: {}, utils: {}
});
Ext.reg('modb24crm', modB24CRM);

modB24CRM = new modB24CRM();