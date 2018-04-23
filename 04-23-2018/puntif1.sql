--------------------------------------------------------
--  File creato - giovedì-aprile-16-2015
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PUNTIF1
--------------------------------------------------------

--instruzioni da eseguire separatamente

  CREATE TABLE "PUNTIF1"
   (	"POS" NUMBER(2,0),
	"PUNTEGGIO" NUMBER(2,0) DEFAULT 0
   )


   REM INSERTING into PUNTIF1
SET DEFINE OFF;
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('1','25');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('2','18');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('3','15');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('4','12');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('5','10');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('6','8');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('7','6');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('8','4');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('9','2');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('10','1');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('11','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('12','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('13','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('14','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('15','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('16','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('17','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('18','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('19','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('20','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('21','0');
Insert into PUNTIF1 (POS,PUNTEGGIO) values ('22','0');


  ALTER TABLE "PUNTIF1" ADD CONSTRAINT "PUNTIF1_PK" PRIMARY KEY ("POS") ENABLE;
  ALTER TABLE "PUNTIF1" MODIFY ("PUNTEGGIO" NOT NULL ENABLE);
