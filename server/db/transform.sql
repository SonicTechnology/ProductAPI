DROP TABLE IF EXISTS transformed_products;

CREATE TABLE transformed_products AS
SELECT p.*, jsonb_agg(jsonb_build_object('feature', f.feature, 'value', f.value)) AS features
FROM products p
JOIN features f ON p.id = f.product_id
GROUP BY p.id;

DROP TABLE IF EXISTS transformed_styles;

CREATE TABLE transformed_styles AS
SELECT s.*, jsonb_agg(jsonb_build_object('url', p.url, 'thumbnail_url', p.thumbnail_url)) AS images
FROM styles s
JOIN photos p ON s.style_id = p.style_id
GROUP BY s.style_id;