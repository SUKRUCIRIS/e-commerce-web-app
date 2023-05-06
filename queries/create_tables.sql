CREATE TABLE "Person" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "surname" varchar NOT NULL,
  "birth_date" date NOT NULL,
  "address_id" integer NOT NULL,
  "mobile" bigint NOT NULL
);

CREATE TABLE "Address" (
  "id" SERIAL PRIMARY KEY,
  "city" varchar NOT NULL,
  "postal_code" varchar NOT NULL,
  "country" varchar NOT NULL,
  "address_line1" varchar NOT NULL,
  "address_line2" varchar NOT NULL
);

CREATE TABLE "User" (
  "id" SERIAL PRIMARY KEY,
  "person_id" integer NOT NULL,
  "created_at" timestamp NOT NULL,
  "deleted_at" timestamp,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "low_admin" boolean NOT NULL,
  "high_admin" boolean NOT NULL,
  "deleted" boolean NOT NULL,
  "image_id" integer
);

CREATE TABLE "Company" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "desc" varchar NOT NULL,
  "image_id" integer,
  "admin_user_id" integer NOT NULL,
  "address_id" integer NOT NULL,
  "cut_percentage" integer NOT NULL
);

CREATE TABLE "Product_Category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "desc" varchar NOT NULL,
  "image_id" integer,
  "company_id" integer NOT NULL
);

CREATE TABLE "Product" (
  "id" SERIAL PRIMARY KEY,
  "category_id" integer NOT NULL,
  "name" varchar NOT NULL,
  "desc" varchar NOT NULL,
  "price" integer NOT NULL,
  "stock" integer NOT NULL,
  "discount" boolean NOT NULL,
  "discount_percent" integer NOT NULL,
  "image_id" integer
);

CREATE TABLE "Image" (
  "id" SERIAL PRIMARY KEY,
  "image_path" varchar NOT NULL
);

CREATE TABLE "Cart_Product" (
  "cart_id" integer NOT NULL,
  "product_id" integer NOT NULL,
  "product_number" integer NOT NULL
);

CREATE TABLE "Cart" (
  "id" SERIAL PRIMARY KEY,
  "user_id" integer NOT NULL,
  "purchased" boolean NOT NULL,
  "purchase_date" timestamp NOT NULL,
  "on_table" boolean NOT NULL,
  "table_number" integer
);

ALTER TABLE "User" ADD FOREIGN KEY ("person_id") REFERENCES "Person" ("id");

ALTER TABLE "Person" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("id");

ALTER TABLE "Product" ADD FOREIGN KEY ("category_id") REFERENCES "Product_Category" ("id");

ALTER TABLE "Cart_Product" ADD FOREIGN KEY ("cart_id") REFERENCES "Cart" ("id");

ALTER TABLE "Cart_Product" ADD FOREIGN KEY ("product_id") REFERENCES "Product" ("id");

ALTER TABLE "Cart" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "Product" ADD FOREIGN KEY ("image_id") REFERENCES "Image" ("id");

ALTER TABLE "User" ADD FOREIGN KEY ("image_id") REFERENCES "Image" ("id");

ALTER TABLE "Product_Category" ADD FOREIGN KEY ("company_id") REFERENCES "Company" ("id");

ALTER TABLE "Product_Category" ADD FOREIGN KEY ("image_id") REFERENCES "Image" ("id");

ALTER TABLE "Company" ADD FOREIGN KEY ("admin_user_id") REFERENCES "User" ("id");

ALTER TABLE "Company" ADD FOREIGN KEY ("image_id") REFERENCES "Image" ("id");

ALTER TABLE "Company" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("id");

INSERT INTO "Address" ("city","postal_code","country","address_line1","address_line2")
VALUES ('İstanbul','34522','Türkiye','Esenyurt Göknar sok.','No:4-6 Kapı no:9');

INSERT INTO "Person" ("name","surname","birth_date","address_id","mobile") 
VALUES ('ŞÜKRÜ','ÇİRİŞ',TO_DATE('2000-02-01','YYYY-MM-DD'),1,5370519604);

INSERT INTO "User" ("person_id","created_at","deleted_at","email","password","low_admin","high_admin","deleted","image_id")
VALUES (1,CURRENT_TIMESTAMP,NULL,'sukruciris2000@gmail.com','123456',FALSE,TRUE,FALSE,NULL);