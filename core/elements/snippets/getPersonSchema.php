<?php
/**
 * Snippet: getPersonSchema
 * Description: Generates Person Schema for doctor pages (Template #12)
 * Usage: {$_modx->runSnippet('!getPersonSchema')}
 *
 * @author Claude AI
 * @date 2025-11-04
 * @version 1.0
 */

// Only for Template #12 (Доктор)
if ($modx->resource->get('template') != 12) {
    return '';
}

// Basic required fields
$name = $modx->resource->get('pagetitle');
$jobTitle = $modx->resource->getTVValue('doctor_specialization') ?: 'Medical Specialist';
$description = $modx->resource->get('meta_desc') ?: $modx->resource->get('description');
$ogImage = $modx->resource->getTVValue('og_image');

// Build full image URL
if ($ogImage) {
    $image = (strpos($ogImage, 'http') === 0)
        ? $ogImage
        : 'https://mymetodica.com/' . ltrim($ogImage, '/');
} else {
    // Fallback to default pattern
    $alias = $modx->resource->get('alias');
    $image = "https://mymetodica.com/assets/templates/upload/images/main/og-image/{$alias}-1x1.jpg";
}

// Full URL
$url = $modx->makeUrl($modx->resource->get('id'), '', '', 'full');

// Individual doctor data registry
// TODO: Move to TV or MIGX for easier management
$doctorData = [
    84 => [ // Olga Chepurko
        'alumniOf' => 'NYU Langone Health',
        'languages' => ['English', 'Russian', 'Hebrew']
    ],
    32 => [ // Oksana Kazakova
        'alumniOf' => null, // Unknown, skip field
        'languages' => ['English', 'Russian']
    ],
    33 => [ // Alexandra Siutsova
        'alumniOf' => null,
        'languages' => ['English', 'Russian']
    ],
    83 => [ // Maria Zhukovich
        'alumniOf' => null,
        'languages' => ['English', 'Russian']
    ],
    85 => [ // Sophie Begas
        'alumniOf' => null,
        'languages' => ['English', 'French']
    ],
    // Add others as data becomes available
];

$resourceId = $modx->resource->get('id');
$customData = isset($doctorData[$resourceId]) ? $doctorData[$resourceId] : [];

// Build schema array
$schema = [
    '@context' => 'https://schema.org',
    '@type' => 'Person',
    'name' => $name,
    'jobTitle' => $jobTitle,
    'description' => $description,
    'url' => $url,
    'worksFor' => [
        '@type' => 'MedicalBusiness',
        '@id' => 'https://mymetodica.com/#organization'
    ]
];

// Add image with ImageObject format (better for Google)
$schema['image'] = [
    '@type' => 'ImageObject',
    'url' => $image,
    'width' => 800,
    'height' => 800
];

// Add optional fields only if data exists
if (!empty($customData['alumniOf'])) {
    $schema['alumniOf'] = [
        '@type' => 'EducationalOrganization',
        'name' => $customData['alumniOf']
    ];
}

if (!empty($customData['languages'])) {
    $schema['knowsLanguage'] = $customData['languages'];
}

// NOTE: DO NOT add sameAs/telephone/address unless they are personal to the doctor
// Adding clinic data here will cause Google to ignore the Person schema

// Generate JSON-LD
$json = json_encode($schema, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);

return <<<HTML
<!-- Person Schema для страницы врача -->
<script type="application/ld+json">
{$json}
</script>
HTML;
