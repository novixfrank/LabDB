--Preamble to solve Exercises

-- create table ANAGRAFICA
CREATE TABLE anagrafica (
cod NUMBER(4,0),
datan DATE,
sesso CHAR(1),
luogon VARCHAR2(80),
provn CHAR(2)
) ;

-- insert into table ANAGRAFICA
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('3', TO_DATE('19/02/1971','DD/MM/YYYY'),'M','Napoli','NA');
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('4', TO_DATE ('04/06/1989','DD/MM/YYYY'),'F','Paesi Bassi','EE');
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('2', TO_DATE ('05/08/1978','DD/MM/YYYY'),'M','Torre del Greco','NA');
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('5', NULL,'M','Roma', NULL);
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('6', TO_DATE ('08/01/1984','DD/MM/YYYY'),'F','Sorrento','NA');
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('7', TO_DATE ('13/06/1980','DD/MM/YYYY'),'M', NULL, NULL);
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('1', TO_DATE ('23/12/1973','DD/MM/YYYY'),'M','Napoli','NA');
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('8', TO_DATE ('21/07/1988','DD/MM/YYYY'),'M','Torino','TO');
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('9', TO_DATE ('16/09/1983','DD/MM/YYYY'),'M','Napoli','NA');
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('10', NULL,'F', NULL, NULL);
INSERT INTO anagrafica (cod,datan,sesso,luogon,provn) VALUES ('12', TO_DATE ('20/07/1989','DD/MM/YYYY'),'F','Agropoli','SA');

--  Constraints for Table ANAGRAFICA
ALTER TABLE anagrafica ADD CONSTRAINT anagrafica_ckl CHECK (luogon IS NOT NULL OR provn IS NULL) ENABLE;
ALTER TABLE anagrafica ADD CONSTRAINT anagrafica_cks CHECK (upper(sesso) in ('M', 'F')) ENABLE;
ALTER TABLE anagrafica ADD CONSTRAINT anagrafica_pk PRIMARY KEY (cod) ENABLE;

--  References Constraints for Table ANAGRAFICA
ALTER TABLE anagrafica ADD CONSTRAINT anagrafica_fk FOREIGN KEY (cod) REFERENCES impiegato (cod) ENABLE;
