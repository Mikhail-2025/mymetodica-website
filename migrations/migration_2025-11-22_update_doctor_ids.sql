-- Migration: Update Doctor IDs in Services
-- Date: 2025-11-22
-- Author: Claude Code
-- Description: Remove ID 85 (Sophie Begas - left company) and add ID 399 (Anna Braun) where ID 84 exists
-- Affects: TV field 'services_doctors_ids' (ID: 85) - "Список id докторов из раздела 31, через запятую"

-- Table: abc_site_tmplvar_contentvalues (MODX Template Variable values)
-- Expected changes: 16 services updated

-- ============================================
-- STEP 1: Remove ID 85 (Sophie Begas)
-- ============================================
-- Remove ", 85" (with leading comma and space)
UPDATE abc_site_tmplvar_contentvalues
SET value = REPLACE(value, ', 85', '')
WHERE tmplvarid = 85 AND value LIKE '%, 85%';

-- Remove "85, " (with trailing comma and space)
UPDATE abc_site_tmplvar_contentvalues
SET value = REPLACE(value, '85, ', '')
WHERE tmplvarid = 85 AND value LIKE '%85, %';

-- Remove standalone "85" (if it's the only value)
UPDATE abc_site_tmplvar_contentvalues
SET value = ''
WHERE tmplvarid = 85 AND value = '85';

-- ============================================
-- STEP 2: Add ID 399 (Anna Braun) where 84 exists
-- ============================================
UPDATE abc_site_tmplvar_contentvalues
SET value = CASE
  -- If value contains 84 but not 399, add 399
  WHEN value LIKE '%84%' AND value NOT LIKE '%399%' THEN
    CONCAT(value, ', 399')
  ELSE value
END
WHERE tmplvarid = 85
  AND value LIKE '%84%';

-- ============================================
-- VERIFICATION QUERIES (run after migration)
-- ============================================
-- Check services with ID 399 (should be 16)
-- SELECT COUNT(*) AS services_with_anna_braun FROM abc_site_tmplvar_contentvalues WHERE tmplvarid = 85 AND value LIKE '%399%';

-- Check services with ID 85 (should be 0)
-- SELECT COUNT(*) AS services_with_sophie_begas FROM abc_site_tmplvar_contentvalues WHERE tmplvarid = 85 AND value LIKE '%85%';

-- View all updated services
-- SELECT c.id, c.pagetitle, tv.value
-- FROM abc_site_content c
-- JOIN abc_site_tmplvar_contentvalues tv ON c.id = tv.contentid
-- WHERE tv.tmplvarid = 85 AND tv.value LIKE '%399%'
-- ORDER BY c.id;
