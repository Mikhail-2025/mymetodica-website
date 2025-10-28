<?php
// phpThumb configuration for MODX
// Increase max source pixels to handle large images (like 7193x5480)
$PHPTHUMB_CONFIG['config_max_source_pixels'] = 50000000; // 50 million pixels
$PHPTHUMB_CONFIG['config_imagemagick_path'] = '/usr/bin/convert';
$PHPTHUMB_CONFIG['config_prefer_imagemagick'] = true;
$PHPTHUMB_CONFIG['config_cache_directory'] = '/var/www/mymetodica.com/core/cache/phpthumb/';
$PHPTHUMB_CONFIG['config_cache_maxage'] = 2592000; // 30 days
$PHPTHUMB_CONFIG['config_cache_maxsize'] = 104857600; // 100MB
$PHPTHUMB_CONFIG['config_cache_maxfiles'] = 10000;
