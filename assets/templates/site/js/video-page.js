/**
 * Video Page Interactive Features
 * Version: 1.0
 * Date: 2025-11-01
 *
 * Features:
 * - ReadMore/ReadLess toggle for video transcript
 * - Event delegation for dynamic content
 * - Accessibility support
 */

(function() {
    'use strict';

    // Wait for DOM ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }

    function init() {
        // Event delegation for transcript toggle buttons
        document.addEventListener('click', function(event) {
            // Check if clicked element is toggle button
            if (event.target.classList.contains('js-toggle-transcript')) {
                toggleTranscript(event);
            }
        });
    }

    /**
     * Toggle transcript visibility
     * @param {Event} event - Click event
     */
    function toggleTranscript(event) {
        event.preventDefault();

        var btn = event.target;
        var transcriptContainer = btn.closest('.video-transcript');

        if (!transcriptContainer) {
            console.error('Transcript container not found');
            return;
        }

        var content = transcriptContainer.querySelector('.js-transcript-content');

        if (!content) {
            console.error('Transcript content not found');
            return;
        }

        // Toggle visibility
        if (content.style.display === 'none' || content.style.display === '') {
            content.style.display = 'block';
            btn.textContent = 'Read Less';
            btn.setAttribute('aria-expanded', 'true');
        } else {
            content.style.display = 'none';
            btn.textContent = 'Read More';
            btn.setAttribute('aria-expanded', 'false');
        }
    }

})();
