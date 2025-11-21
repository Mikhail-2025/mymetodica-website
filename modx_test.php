<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "=== MODX Bootstrap Test ===\n\n";

// Test 1: config.core.php
echo "1. Testing config.core.php:\n";
if (file_exists('/var/www/mymetodica.local/config.core.php')) {
    require_once '/var/www/mymetodica.local/config.core.php';
    echo "   ✓ config.core.php loaded\n";
    echo "   MODX_CORE_PATH: " . MODX_CORE_PATH . "\n";
} else {
    echo "   ✗ config.core.php not found!\n";
    exit(1);
}

// Test 2: Core exists
echo "\n2. Testing core directory:\n";
if (is_dir(MODX_CORE_PATH)) {
    echo "   ✓ Core directory exists\n";
} else {
    echo "   ✗ Core directory not found!\n";
    exit(1);
}

// Test 3: config.inc.php
echo "\n3. Testing config.inc.php:\n";
 = MODX_CORE_PATH . 'config/config.inc.php';
if (file_exists()) {
    echo "   ✓ config.inc.php found\n";
} else {
    echo "   ✗ config.inc.php not found!\n";
    exit(1);
}

// Test 4: Try to load MODX
echo "\n4. Testing MODX bootstrap:\n";
require_once MODX_CORE_PATH . 'model/modx/modx.class.php';
echo "   ✓ modx.class.php loaded\n";

try {
     = new modX();
    echo "   ✓ MODX object created\n";
    
    ->initialize('web');
    echo "   ✓ MODX initialized for web context\n";
    
    echo "\n=== SUCCESS: MODX is working! ===\n";
} catch (Exception ) {
    echo "   ✗ MODX initialization failed:\n";
    echo "   Error: " . ->getMessage() . "\n";
    echo "   File: " . ->getFile() . ":" . ->getLine() . "\n";
    exit(1);
}
