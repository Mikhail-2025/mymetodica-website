#!/bin/bash
urls=(
'https://mymetodica.com/shorts/the-secret-benefits-of-hyaluronic-acid-you-need-to-know.html'
'https://mymetodica.com/shorts/why-skinvive-is-taking-over-advantages-of-skinvive-treatments.html'
'https://mymetodica.com/shorts/best-moisturizer-for-any-skin-type.html'
'https://mymetodica.com/shorts/skinvive-vs-profhilo.-which-is-better-what-are-the-differences.html'
'https://mymetodica.com/shorts/best-summer-facial-care-treatment-for-hydrated-skin.html'
'https://mymetodica.com/shorts/effective-laser-hair-removal-top-tips-and-tricks-for-smooth-skin.html'
'https://mymetodica.com/shorts/achieving-perfection-essential-laser-hair-removal-tips-for-best-results.html'
'https://mymetodica.com/videos/dark-spots-on-face-removal-best-treatments.html'
'https://mymetodica.com/videos/get-ready-for-glowing-skin-with-skinvive-injection.html'
'https://mymetodica.com/shorts/skinvive-vs-juvederm-which-filler-is-right-for-you.html'
)

echo "=== Continuing YouTube API cache warmup (batch 2) ==="
echo "Total pages: ${#urls[@]}"
echo ""

count=10
for url in "${urls[@]}"; do
    count=$((count + 1))
    echo "[$count/20] Warming: $url"
    curl -s -o /dev/null "$url"
    sleep 1
done

echo ""
echo "=== Batch 2 completed ==="
