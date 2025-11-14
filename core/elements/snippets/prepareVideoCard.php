<?php
/**
 * prepareVideoCard
 * Enriches pdoResources row with YouTube thumbnail URL/alt text.
 */

if (!is_array() || empty()) {
    return  ?? [];
}

 = ['tv.video_link'] ?? '';
 = '';

if (!empty()) {
    if (preg_match('~(?:youtube\.com/(?:watch\?v=|embed/|v/)|youtu\.be/)([A-Za-z0-9_-]{11})~', , )) {
         = [1];
    } elseif (preg_match('~v=([A-Za-z0-9_-]{11})~', , )) {
         = [1];
    }
}

if () {
    ['video_thumbnail'] = 'https://img.youtube.com/vi/' .  . '/sddefault.jpg';
} else {
    ['video_thumbnail'] = '';
}

 = ['tv.Video_img_alt'] ?? '';
if ( === '') {
     = (['pagetitle'] ?? 'Video') . ' - Video preview';
}
['video_thumbnail_alt'] = ;

return ;
