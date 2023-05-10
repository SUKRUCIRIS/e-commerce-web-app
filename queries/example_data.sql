DO $$
DECLARE personid integer;
DECLARE adresid integer;
DECLARE userid integer;
DECLARE imageid integer;
DECLARE companyid integer;
DECLARE categoryid integer;
BEGIN
INSERT INTO "Address" ("city","postal_code","country","address_line1","address_line2")
VALUES ('İstanbul','236223','Türkiye','ASDASDAS ASDAS sok.','ASDASDASD') RETURNING "id" INTO adresid;

INSERT INTO "Person" ("name","surname","birth_date","address_id","mobile") 
VALUES ('AHMET','KEMAL',TO_DATE('1989-10-01','YYYY-MM-DD'),adresid,65415616365) RETURNING "id" INTO personid;

INSERT INTO "User" ("person_id","created_at","deleted_at","email","password","low_admin","high_admin","deleted","image_id")
VALUES (personid,CURRENT_TIMESTAMP,NULL,'akemal@gmail.com','123456',TRUE,FALSE,FALSE,NULL) RETURNING "id" INTO userid;

INSERT INTO "Image" ("image_path")
VALUES ('example/kebabci_ahmet.jpg') RETURNING "id" INTO imageid;

INSERT INTO "Company" ("name","desc","image_id","admin_user_id","address_id","created_at","deleted_at","deleted","cut_percentage")
VALUES ('EN İYİ KEBABÇI','Kebab ahmetten yenir.',imageid,userid,adresid,CURRENT_TIMESTAMP,NULL,FALSE,3) RETURNING "id" INTO companyid;

INSERT INTO "Image" ("image_path")
VALUES ('example/kebabci_icecek.jpg') RETURNING "id" INTO imageid;

INSERT INTO "Product_Category" ("name","desc","image_id","company_id")
VALUES ('İçecek','İçmelik sıvı',imageid,companyid) RETURNING "id" INTO categoryid;

INSERT INTO "Image" ("image_path")
VALUES ('example/kebabci_salgam.jpg') RETURNING "id" INTO imageid;

INSERT INTO "Product" ("category_id","name","desc","price","stock","discount" ,"discount_percent","image_id")
VALUES (categoryid,'Şalgam','Acılı şalgam',20,100,FALSE,0,imageid);

INSERT INTO "Image" ("image_path")
VALUES ('example/kebabci_kebablar.jpg') RETURNING "id" INTO imageid;

INSERT INTO "Product_Category" ("name","desc","image_id","company_id")
VALUES ('Kebablar','Aklı olan yer',imageid,companyid) RETURNING "id" INTO categoryid;

INSERT INTO "Image" ("image_path")
VALUES ('example/kebabci_adana.jpg') RETURNING "id" INTO imageid;

INSERT INTO "Product" ("category_id","name","desc","price","stock","discount" ,"discount_percent","image_id")
VALUES (categoryid,'Adana Kebab','Adana usulü kebab',100,50,FALSE,0,imageid);
END $$;

DO $$
DECLARE personid integer;
DECLARE adresid integer;
DECLARE userid integer;
DECLARE imageid integer;
DECLARE companyid integer;
DECLARE categoryid integer;
BEGIN
INSERT INTO "Address" ("city","postal_code","country","address_line1","address_line2")
VALUES ('İstanbul','514656','Türkiye','ASDASDAS ASDAS sok.','ASDASDASD') RETURNING "id" INTO adresid;

INSERT INTO "Person" ("name","surname","birth_date","address_id","mobile") 
VALUES ('MUSTAFA','YILMAZ',TO_DATE('1900-10-01','YYYY-MM-DD'),adresid,55555555555) RETURNING "id" INTO personid;

INSERT INTO "User" ("person_id","created_at","deleted_at","email","password","low_admin","high_admin","deleted","image_id")
VALUES (personid,CURRENT_TIMESTAMP,NULL,'myilmaz@gmail.com','123456',TRUE,FALSE,FALSE,NULL) RETURNING "id" INTO userid;

INSERT INTO "Image" ("image_path")
VALUES ('example/pizzaci_mustafa.jpg') RETURNING "id" INTO imageid;

INSERT INTO "Company" ("name","desc","image_id","admin_user_id","address_id","created_at","deleted_at","deleted","cut_percentage")
VALUES ('USTA PİZZA','Yiyen bir daha yemek istiyor.',imageid,userid,adresid,CURRENT_TIMESTAMP,NULL,FALSE,10) RETURNING "id" INTO companyid;

INSERT INTO "Image" ("image_path")
VALUES ('example/pizzaci_icecek.jpg') RETURNING "id" INTO imageid;

INSERT INTO "Product_Category" ("name","desc","image_id","company_id")
VALUES ('İçecek','Pizzacı içeceği',imageid,companyid) RETURNING "id" INTO categoryid;

INSERT INTO "Image" ("image_path")
VALUES ('example/pizzaci_su.jpg') RETURNING "id" INTO imageid;

INSERT INTO "Product" ("category_id","name","desc","price","stock","discount" ,"discount_percent","image_id")
VALUES (categoryid,'Su','Erikli Su',5,20,FALSE,0,imageid);

INSERT INTO "Image" ("image_path")
VALUES ('example/pizzaci_pizzalar.jpg') RETURNING "id" INTO imageid;

INSERT INTO "Product_Category" ("name","desc","image_id","company_id")
VALUES ('Pizzalar','İtalyadan gelme',imageid,companyid) RETURNING "id" INTO categoryid;

INSERT INTO "Image" ("image_path")
VALUES ('example/pizzaci_mozarella.jpg') RETURNING "id" INTO imageid;

INSERT INTO "Product" ("category_id","name","desc","price","stock","discount" ,"discount_percent","image_id")
VALUES (categoryid,'Mozarella Pizza','Mozarellalı sucuklu pizza',200,500,FALSE,0,imageid);
END $$;

DO $$
DECLARE personid integer;
DECLARE adresid integer;
BEGIN
INSERT INTO "Address" ("city","postal_code","country","address_line1","address_line2")
VALUES ('Ankara','88888','Türkiye','ASDASDAS ASDAS sok.','ASDASDASD') RETURNING "id" INTO adresid;

INSERT INTO "Person" ("name","surname","birth_date","address_id","mobile") 
VALUES ('HASAN','ŞİŞ',TO_DATE('1453-10-01','YYYY-MM-DD'),adresid,5416565656) RETURNING "id" INTO personid;

INSERT INTO "User" ("person_id","created_at","deleted_at","email","password","low_admin","high_admin","deleted","image_id")
VALUES (personid,CURRENT_TIMESTAMP,NULL,'hsis@gmail.com','123456',FALSE,FALSE,FALSE,NULL);
END $$;