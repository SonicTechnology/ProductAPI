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

DROP TABLE IF EXISTS skus;

CREATE TABLE skus (
	"id" int UNIQUE NOT NULL,
	"style_id" int NOT NULL,
	"size" TEXT NOT NULL,
	"quantity" int NOT NULL,
	CONSTRAINT "Skus_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
	"id" int UNIQUE NOT NULL,
	"style_id" int NOT NULL,
	"url" TEXT NOT NULL,
	"thumbnail_url" TEXT NOT NULL,
	CONSTRAINT "Photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

DROP TABLE IF EXISTS styles;

CREATE TABLE styles (
	"style_id" int UNIQUE NOT NULL,
	"product_id" int NOT NULL,
	"name" TEXT NOT NULL,
	"sale_price" TEXT,
	"original_price" TEXT NOT NULL,
	"default?" BOOLEAN NOT NULL,
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

COPY photos(id, style_id, url, thumbnail_url)
FROM '/Users/masonisblue/Hackreactor/ProductAPI/data/photos.csv'
DELIMITER ','
CSV HEADER;

COPY skus(id, style_id, size, quantity)
FROM '/Users/masonisblue/Hackreactor/ProductAPI/data/skus.csv'
DELIMITER ','
CSV HEADER;

COPY styles
FROM '/Users/masonisblue/Hackreactor/ProductAPI/data/styles.csv'
DELIMITER ','
CSV HEADER;