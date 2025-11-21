<?php
$xpdo_meta_map['modB24Account']= array (
  'package' => 'modb24crm',
  'version' => '1.1',
  'table' => 'modb24crm_accounts',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'name' => '',
    'host' => '',
    'token' => '',
    'userid' => 0,
    'context' => 'web',
    'active' => 1,
    'sync_catalog' => 1,
    'sync_orders' => 1,
    'use_queue' => 1,
  ),
  'fieldMeta' => 
  array (
    'name' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '100',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'host' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '100',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'token' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '30',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'userid' => 
    array (
      'dbtype' => 'int',
      'precision' => '10',
      'attributes' => 'unsigned',
      'phptype' => 'integer',
      'null' => true,
      'default' => 0,
    ),
    'context' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '100',
      'phptype' => 'string',
      'null' => true,
      'default' => 'web',
    ),
    'active' => 
    array (
      'dbtype' => 'tinyint',
      'precision' => '1',
      'phptype' => 'boolean',
      'null' => true,
      'default' => 1,
    ),
    'sync_catalog' => 
    array (
      'dbtype' => 'tinyint',
      'precision' => '1',
      'phptype' => 'boolean',
      'null' => true,
      'default' => 1,
    ),
    'sync_orders' => 
    array (
      'dbtype' => 'tinyint',
      'precision' => '1',
      'phptype' => 'integer',
      'null' => true,
      'default' => 1,
    ),
    'use_queue' => 
    array (
      'dbtype' => 'tinyint',
      'precision' => '1',
      'phptype' => 'boolean',
      'null' => true,
      'default' => 1,
    ),
  ),
  'indexes' => 
  array (
    'host' => 
    array (
      'alias' => 'host',
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'host' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'active' => 
    array (
      'alias' => 'active',
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'active' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'sync_catalog' => 
    array (
      'alias' => 'sync_catalog',
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'sync_catalog' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'sync_orders' => 
    array (
      'alias' => 'sync_orders',
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'sync_orders' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
  ),
  'composites' => 
  array (
    'Links' => 
    array (
      'class' => 'modB24Link',
      'local' => 'id',
      'foreign' => 'account_id',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
    'Fields' => 
    array (
      'class' => 'modB24Field',
      'local' => 'id',
      'foreign' => 'account_id',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
    'FiHooks' => 
    array (
      'class' => 'modB24FIHook',
      'local' => 'id',
      'foreign' => 'account_id',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
    'Queues' => 
    array (
      'class' => 'modB24Queue',
      'local' => 'id',
      'foreign' => 'account_id',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
  ),
);
