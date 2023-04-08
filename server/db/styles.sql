-- ALTER TABLE transformed_styles ADD skus TEXT;

CREATE INDEX idx_skus_style_id
ON skus(style_id);

CREATE INDEX idx_tstyles_style_id
ON transformed_styles(style_id);

UPDATE transformed_styles t
SET skus = (
  SELECT json_object_agg(s.id, json_build_object('quantity', s.quantity, 'size', s.size))
  FROM skus s
  WHERE t.style_id = s.style_id
)
