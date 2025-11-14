#!/bin/bash
urls=(
'https://mymetodica.com/videos/how-smoothglo-tightening-skin-without-surgery/'
'https://mymetodica.com/videos/face-pigmentation-avoid-mistakes-find-solutions.html'
'https://mymetodica.com/shorts/how-to-tighten-loose-skin-on-face-rf-microneedling.html'
'https://mymetodica.com/videos/skinvive-neck-and-face-hydrating-tips.html'
'https://mymetodica.com/videos/sellulite-treatment-reviews.-how-to-tighten-hips-and-thighs.html'
'https://mymetodica.com/shorts/face-pigmentation-causes.html'
'https://mymetodica.com/shorts/lentigo-and-sun-spots-removal.html'
'https://mymetodica.com/shorts/ipl-skin-rejuvenation-for-pigmentation-redness-and-acne.html'
'https://mymetodica.com/shorts/skinvive-before-and-after-skinvive-results.html'
'https://mymetodica.com/shorts/what-is-skin-vive-the-most-insane-skincare-product.html'
)

echo "=== Starting YouTube API cache warmup ==="
echo "Total pages: ${#urls[@]}"
echo ""

count=0
for url in "${urls[@]}"; do
    count=$((count + 1))
    echo "[$count/${#urls[@]}] Warming: $url"
    curl -s -o /dev/null "$url"
    sleep 1
done

echo ""
echo "=== Cache warmup completed ==="
