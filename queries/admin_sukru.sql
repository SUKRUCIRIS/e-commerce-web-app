INSERT INTO "Address" ("city","postal_code","country","address_line1","address_line2")
VALUES ('İstanbul','34522','Türkiye','Esenyurt Göknar sok.','No:4-6 Kapı no:9');

INSERT INTO "Person" ("name","surname","birth_date","address_id","mobile") 
VALUES ('ŞÜKRÜ','ÇİRİŞ',TO_DATE('2000-02-01','YYYY-MM-DD'),1,5370519604);

INSERT INTO "User" ("person_id","created_at","deleted_at","email","password","low_admin","high_admin","deleted","image_id")
VALUES (1,CURRENT_TIMESTAMP,NULL,'sukruciris2000@gmail.com','123456',FALSE,TRUE,FALSE,NULL);