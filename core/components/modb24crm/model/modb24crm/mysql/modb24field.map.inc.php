<?php
$xpdo_meta_map['modB24Field']= array (
  'package' => 'modb24crm',
  'version' => '1.1',
  'table' => 'modb24crm_fields',
  'extends' => 'xPDOObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'account_id' => 0,
    'section' => '',
    'btx' => '',
    'value' => '',
    'isfield' => 1,
    'type' => '',
    'multiple' => 0,
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
    'section' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '50',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'btx' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '50',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'value' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '255',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'isfield' => 
    array (
      'dbtype' => 'tinyint',
      'precision' => '1',
      'phptype' => 'boolean',
      'null' => false,
      'default' => 1,
    ),
    'type' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '50',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'multiple' => 
    array (
      'dbtype' => 'tinyint',
      'precision' => '1',
      'phptype' => 'boolean',
      'null' => false,
      'default' => 0,
    ),
  ),
  'indexes' => 
  array (
    'field' => 
    array (
      'alias' => 'field',
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
        'section' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
        'btx' => 
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
