-- Row Count Validation

SELECT COUNT(*) FROM product_data;
SELECT COUNT(*) FROM sales_data;
SELECT COUNT(*) FROM promotion_data;
SELECT COUNT(*) FROM store_data;
SELECT COUNT(*) FROM inventory_data;

-- Sales → Product Integrity Check

SELECT s.product_upc
FROM sales_data s
LEFT JOIN product_data p
ON s.product_upc = p.product_upc
WHERE p.product_upc IS NULL;

-- Sales → Promotion Integrity Check

SELECT s.promo_ID, s.product_upc
FROM sales_data s
LEFT JOIN promotion_data p
ON s.promo_ID = p.promo_ID
AND s.product_upc = p.product_upc
WHERE s.promo_ID IS NOT NULL
AND p.promo_ID IS NULL;

-- Inventory → Product Integrity Check

SELECT i.product_upc
FROM inventory_data i
LEFT JOIN product_data p
ON i.product_upc = p.product_upc
WHERE p.product_upc IS NULL;
