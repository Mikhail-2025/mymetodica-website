#!/usr/bin/env php
<?php
/**
 * Force Snippet Recompile Script for MODX (v2.0 - ChatGPT Fixed)
 *
 * Properly triggers cache refresh like Manager "Save" button does
 *
 * Usage: php force_snippet_recompile_v2.php <snippet_id>
 * Example: php force_snippet_recompile_v2.php 75
 */

if (!isset($argv[1])) {
    die("Usage: php force_snippet_recompile_v2.php <snippet_id>\n");
}

$snippetId = (int)$argv[1];

// Bootstrap MODX
define('MODX_API_MODE', true);
require_once '/var/www/mymetodica.com/index.php';

if (!$modx) {
    die("ERROR: Failed to initialize MODX\n");
}

// Load snippet
$snippet = $modx->getObject('modSnippet', $snippetId);

if (!$snippet) {
    die("ERROR: Snippet ID {$snippetId} not found\n");
}

echo "Found snippet: " . $snippet->get('name') . " (ID: {$snippetId})\n";

// Trigger cache refresh by touching the snippet
$snippet->set('edited', true);
$snippet->set('editedon', time());

// Save (this triggers basic save)
if ($snippet->save()) {
    echo "SUCCESS: Snippet saved\n";

    // NOW: Call proper cache refresh like Manager does
    // This is what was missing!
    $modx->cacheManager->refresh([
        'system_settings' => [],
        'context_settings' => [],
        'resource' => [],
        'scripts' => [],
        'snippets' => [],
        'elements' => [],
    ]);

    echo "SUCCESS: Cache cleared with all namespaces\n";

    // Invalidate PHP opcache for compiled snippet file
    $compiledPath = MODX_CORE_PATH . "cache/includes/elements/modsnippet/{$snippetId}.include.cache.php";

    if (file_exists($compiledPath)) {
        if (function_exists('opcache_invalidate')) {
            opcache_invalidate($compiledPath, true);
            echo "SUCCESS: Opcache invalidated for {$compiledPath}\n";
        }

        echo "SUCCESS: Compiled cache exists at {$compiledPath}\n";
        echo "File size: " . filesize($compiledPath) . " bytes\n";
    } else {
        echo "INFO: Compiled cache will be created on first request\n";
    }

} else {
    die("ERROR: Failed to save snippet\n");
}

echo "\n✅ DONE! Snippet recompiled successfully.\n";
exit(0);
?>
