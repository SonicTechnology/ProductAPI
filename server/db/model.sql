DROP TABLE IF EXISTS products CASCADE;

CREATE TABLE products (
	"id" int UNIQUE NOT NULL,
	"name" TEXT NOT NULL,
	"slogan" TEXT NOT NULL,
	"description" TEXT NOT NULL,
	"category" TEXT NOT NULL,
	"default_price" TEXT NOT NULL,
	CONSTRAINT "Product_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

DROP TABLE IF EXISTS features;

CREATE TABLE features (
	"id" int UNIQUE NOT NULL,
	"product_id" int NOT NULL,
	"feature" TEXT NOT NULL,
	"value" TEXT NOT NULL,
	CONSTRAINT "Features_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

DROP TABLE IF EXISTS styles;

CREATE TABLE styles (
	"style_id" int UNIQUE NOT NULL,
	"name" TEXT NOT NULL,
	"original_price" TEXT NOT NULL,
	"sale_price" TEXT NOT NULL,
	"default?" BOOLEAN NOT NULL,
	"photos" jsonb NOT NULL,
	"skus" jsonb NOT NULL,
	"product_id" int NOT NULL,
	CONSTRAINT "Styles_pk" PRIMARY KEY ("style_id")
) WITH (
  OIDS=FALSE
);


ALTER TABLE "styles" ADD CONSTRAINT "Styles_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
ALTER TABLE "features" ADD CONSTRAINT "Features_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");


COPY products(id, name, slogan, description, category, default_price)
FROM '/Users/masonisblue/Hackreactor/ProductAPI/data/products.csv'
DELIMITER ','
CSV HEADER;

COPY features(id, product_id, feature, value)
FROM '/Users/masonisblue/Hackreactor/ProductAPI/data/features.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE transformed_products AS
SELECT p.*, jsonb_agg(jsonb_build_object('feature', f.feature, 'value', f.value)) AS features
FROM products p
JOIN features f ON p.id = f.product_id
GROUP BY p.id;
