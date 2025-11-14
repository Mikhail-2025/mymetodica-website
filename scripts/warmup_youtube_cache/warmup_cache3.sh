#!/bin/bash
urls=(
'https://mymetodica.com/shorts/why-does-pigmentation-appear-causes-of-pigmentation.html'
'https://mymetodica.com/shorts/ultherapy-non-surgical-facelift-in-1-treatment.html'
'https://mymetodica.com/videos/scars-after-acne-best-acne-marks-treatment.html'
'https://mymetodica.com/videos/morpheus8-vs-ultherapy-face-lift.html'
'https://mymetodica.com/shorts/skincare-for-pigmentation.html'
'https://mymetodica.com/shorts/skinvive-before-and-after.html'
'https://mymetodica.com/shorts/how-to-get-rid-of-melasma.html'
'https://mymetodica.com/shorts/how-does-retinol-actually-fight-breakouts-amazing-results-revealed.html'
'https://mymetodica.com/shorts/how-my-skin-got-younger-after-50-with-this-secret-method.html'
'https://mymetodica.com/shorts/why-this-advanced-skin-scanner-changed-everything.html'
'https://mymetodica.com/videos/remedies-for-skin-tightening-and-face-lift-downturned-mouth-corners.html'
'https://mymetodica.com/videos/acne-causes-types-and-triggers.html'
'https://mymetodica.com/videos/acne-removal-what-really-works-acne-treatments-and-clear-skin-plan.html'
'https://mymetodica.com/videos/best-skincare-ingredients-for-acne.html'
'https://mymetodica.com/videos/how-i-cleared-my-skin-rosacea-solution.html'
'https://mymetodica.com/videos/fix-broken-blood-vessels-on-face.html'
'https://mymetodica.com/videos/reduce-double-chin.html'
'https://mymetodica.com/videos/how-to-remove-facial-hair.html'
)

echo "=== Warming remaining pages (batch 3) ==="
echo "Total pages: ${#urls[@]}"
echo ""

count=20
for url in "${urls[@]}"; do
    count=$((count + 1))
    echo "[$count/38] Warming: $url"
    curl -s -o /dev/null "$url"
    sleep 1
done

echo ""
echo "=== All pages warmed! ==="
