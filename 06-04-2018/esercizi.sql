--Ex. 1.1. Create table ReportImpiegato

-- create table con constraints
CREATE TABLE reportimpiegato (
cod NUMBER(4,0),
report VARCHAR2(4000),

CONSTRAINT reportimpiegato_pk PRIMARY KEY (cod),
CONSTRAINT reportimpiegato_fk FOREIGN KEY (cod) REFERENCES impiegato (cod)

);
