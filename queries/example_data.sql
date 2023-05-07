DO $$
DECLARE personid integer;
DECLARE adresid integer;
DECLARE userid integer;
DECLARE imageid integer;
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
VALUES ('EN İYİ KEBABÇI','Kebab ahmetten yenir.',imageid,userid,adresid,CURRENT_TIMESTAMP,NULL,FALSE,3); 
END $$;

DO $$
DECLARE personid integer;
DECLARE adresid integer;
DECLARE userid integer;
DECLARE imageid integer;
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
VALUES ('USTA PİZZA','Yiyen bir daha yemek istiyor.',imageid,userid,adresid,CURRENT_TIMESTAMP,NULL,FALSE,10); 
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