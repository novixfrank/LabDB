--------------------------------------------------------
--  File creato - giovedì-maggio-26-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TAB_ODD
--------------------------------------------------------

  CREATE TABLE "TAB_ODD" 
   (	"CARATTERE" CHAR(1), 
	"VALORE" NUMBER(2,0)
   ) ;
/   
   
REM INSERTING into TAB_ODD
SET DEFINE OFF;
Insert into TAB_ODD (CARATTERE,VALORE) values ('1','0');
Insert into TAB_ODD (CARATTERE,VALORE) values ('3','7');
Insert into TAB_ODD (CARATTERE,VALORE) values ('5','13');
Insert into TAB_ODD (CARATTERE,VALORE) values ('9','21');
Insert into TAB_ODD (CARATTERE,VALORE) values ('B','0');
Insert into TAB_ODD (CARATTERE,VALORE) values ('D','7');
Insert into TAB_ODD (CARATTERE,VALORE) values ('F','13');
Insert into TAB_ODD (CARATTERE,VALORE) values ('I','19');
Insert into TAB_ODD (CARATTERE,VALORE) values ('L','4');
Insert into TAB_ODD (CARATTERE,VALORE) values ('Q','6');
Insert into TAB_ODD (CARATTERE,VALORE) values ('V','10');
Insert into TAB_ODD (CARATTERE,VALORE) values ('Y','24');
Insert into TAB_ODD (CARATTERE,VALORE) values ('0','1');
Insert into TAB_ODD (CARATTERE,VALORE) values ('2','5');
Insert into TAB_ODD (CARATTERE,VALORE) values ('8','19');
Insert into TAB_ODD (CARATTERE,VALORE) values ('A','1');
Insert into TAB_ODD (CARATTERE,VALORE) values ('C','5');
Insert into TAB_ODD (CARATTERE,VALORE) values ('E','9');
Insert into TAB_ODD (CARATTERE,VALORE) values ('H','17');
Insert into TAB_ODD (CARATTERE,VALORE) values ('K','2');
Insert into TAB_ODD (CARATTERE,VALORE) values ('N','20');
Insert into TAB_ODD (CARATTERE,VALORE) values ('P','3');
Insert into TAB_ODD (CARATTERE,VALORE) values ('R','8');
Insert into TAB_ODD (CARATTERE,VALORE) values ('U','16');
Insert into TAB_ODD (CARATTERE,VALORE) values ('X','25');
Insert into TAB_ODD (CARATTERE,VALORE) values ('6','15');
Insert into TAB_ODD (CARATTERE,VALORE) values ('4','9');
Insert into TAB_ODD (CARATTERE,VALORE) values ('7','17');
Insert into TAB_ODD (CARATTERE,VALORE) values ('G','15');
Insert into TAB_ODD (CARATTERE,VALORE) values ('J','21');
Insert into TAB_ODD (CARATTERE,VALORE) values ('M','18');
Insert into TAB_ODD (CARATTERE,VALORE) values ('O','11');
Insert into TAB_ODD (CARATTERE,VALORE) values ('S','12');
Insert into TAB_ODD (CARATTERE,VALORE) values ('T','14');
Insert into TAB_ODD (CARATTERE,VALORE) values ('W','22');
Insert into TAB_ODD (CARATTERE,VALORE) values ('Z','23');
--------------------------------------------------------
--  Constraints for Table TAB_ODD
--------------------------------------------------------

  ALTER TABLE "TAB_ODD" MODIFY ("VALORE" NOT NULL ENABLE);
  ALTER TABLE "TAB_ODD" ADD PRIMARY KEY ("CARATTERE") ENABLE;
/

create or replace FUNCTION CtrCarCF(cf15 IN CHAR)
RETURN CHAR
-- Calcola il carattere di controllo in un CF dati gli altri 15
IS
  somma     NUMBER(5,0) := 0;
  val       NUMBER(2,0);
  pos       NUMBER(5,0);
  res       CHAR(1);
  curr      CHAR(1);
--  noLung15  EXCEPTION;
BEGIN
  IF LENGTH(cf15) <> 15 THEN
    RETURN NULL;
    --RAISE_APPLICATION_ERROR(-20015,'L''input deve avere lunghezza 15');
  END IF;
  FOR pos IN 1..15
  LOOP
  curr:=UPPER(SUBSTR(cf15,pos,1));
IF MOD(pos,2) = 0 THEN -- posizioni pari
  IF curr BETWEEN '0' AND '9' THEN
  val := ASCII(curr) - ASCII('0'); -- cifre
  ELSE
  val := ASCII(curr) - ASCII('A'); -- lettere
  END IF;
ELSE -- posizioni dispari
SELECT Valore INTO val FROM Tab_Odd WHERE Carattere = curr;
END IF;
    somma := somma + val;
  END LOOP;
  somma := MOD(somma,26);
  res := CHR(somma + ASCII('A'));
  RETURN res;
EXCEPTION
--    WHEN noLung15 THEN
--DBMS_OUTPUT.PUT_LINE('CtrCarCF: l''input deve avere lunghezza 15');
--RETURN NULL; -- la lunghezza di un CF deve essere 16
WHEN NO_DATA_FOUND THEN
--DBMS_OUTPUT.PUT_LINE('CtrCarCF: caratteri non validi');
RETURN NULL; -- ad es. in presenza di caratteri non alfanumerici
END;
/

create or replace FUNCTION ControllaCF(cf in varchar2) return char as
begin
if length(cf) <> 16 then return '0'; end if;
if upper(substr(cf,16,1)) = nvl(ctrcarcf(substr(cf,1,15)),'$') then
return '1';
end if;
return 0;
end;
