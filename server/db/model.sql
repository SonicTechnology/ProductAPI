CREATE TABLE "public.Product" (
	"id" int NOT NULL,
	"name" TEXT NOT NULL,
	"slogan" TEXT NOT NULL,
	"description" TEXT NOT NULL,
	"category" TEXT NOT NULL,
	"default_price" TEXT NOT NULL,
	"features" jsonb NOT NULL,
	CONSTRAINT "Product_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Styles" (
	"style_id" int NOT NULL,
	"name" TEXT NOT NULL,
	"original_price" TEXT NOT NULL,
	"sale_price" TEXT NOT NULL,
	"default?" BOOLEAN NOT NULL,
	"photos" jsonb NOT NULL,
	"skus" jsonb NOT NULL,
	"product_id" TEXT NOT NULL,
	CONSTRAINT "Styles_pk" PRIMARY KEY ("style_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Styles" ADD CONSTRAINT "Styles_fk0" FOREIGN KEY ("product_id") REFERENCES "Product"("id");



