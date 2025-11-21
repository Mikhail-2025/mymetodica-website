<?php
$xpdo_meta_map['modB24Link']= array (
  'package' => 'modb24crm',
  'version' => '1.1',
  'table' => 'modb24crm_links',
  'extends' => 'xPDOObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'account_id' => 0,
    'object_id' => 0,
    'bitrix_id' => 0,
    'type' => 0,
  ),
  'fieldMeta' => 
  array (
    'account_id' => 
    array (
      'dbtype' => 'int',
      'precision' => '10',
      'attributes' => 'unsigned',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'object_id' => 
    array (
      'dbtype' => 'int',
      'precision' => '10',
      'attributes' => 'unsigned',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'bitrix_id' => 
    array (
      'dbtype' => 'int',
      'precision' => '10',
      'attributes' => 'unsigned',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'type' => 
    array (
      'dbtype' => 'tinyint',
      'precision' => '2',
      'attributes' => 'unsigned',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
  ),
  'indexes' => 
  array (
    'link' => 
    array (
      'alias' => 'link',
      'primary' => true,
      'unique' => true,
      'type' => 'BTREE',
      'columns' => 
      array (
        'account_id' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
        'object_id' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
        'type' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
  ),
  'aggregates' => 
  array (
    'Account' => 
    array (
      'class' => 'modB24Account',
      'local' => 'account_id',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
  ),
);
