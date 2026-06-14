-- Remove invalid promotion records where promo ID is missing

DELETE FROM promotion_data
WHERE promo_ID IS NULL;
