TRACCIA ESERCITAZIONE N° 1 DEL 07/08/2018
Si consideri la tabella IMPIEGATO(Cod,Nome,Cognome,Data_Assunto,Stipendio,Capo) in cui Cod è un codice univoco e Capo si riferisce al codice del diretto superiore dell’impiegato (se esistente).
1	Si crei una tale tabella;
2	Si popoli la tabella con i seguenti dati:
    Cod	 	Nome		Cognome	Data_Assunto		Stipendio	Capo
    1		 Alessandro	Rossi		01/03/2014		3000		2
    2		 Alberto 	Bianchi		01/02/2013		4000		3
    3	 	Andrea		Verdi		03/06/2011		5000		NULL
    4		 Tiziana	Viola		03/03/2013		1500		1
    5		 Umberto	Neri		12/09/2014		2500		2
    6		 Francesca	Russo		22/11/2013		2000		2
    7		 Luigi 		Marrone	    05/02/2012		2800		3;
3	Si determinino gli indirizzi email degli impiegati che hanno uno stipendio inferiore o uguale a 3000, supponendo che abbiano la forma adeluca@lazienda.it (iniziale nome + cognome);
4	Si trovi nome e cognome di tutti i sottoposti di Bianchi assunti da più di 50 mesi.


--crea tabella
CREATE TABLE Impiegato (
    Cod NUMBER(5),
    Nome VARCHAR2(32) NOT NULL,
    Cognome VARCHAR2(32) NOT NULL,
    Data_Assunto DATE NOT NULL,
    Stipendio NUMBER(6) NOT NULL,
    Capo NUMBER(5) NULL,
    CONSTRAINT impiegato_pk PRIMARY KEY (Cod),
    CONSTRAINT impiegato_fk FOREIGN KEY (Capo) REFERENCES Impiegato(Cod)
)

--inserisci impiegato
INSERT INTO Impiegato(Cod, Nome, Cognome, Data_Assunto, Stipendio, Capo) VALUES ( , ‘ ‘, ‘ ‘, TO_DATE( ‘ ‘, ‘DD/MM/YYYY’,  ,  )

--proiezione dati
SELECT * FROM Impiegato ORDER BY COD;

--generazione via interrogazione di email se stipendio<=3000
SELECT LOWER(SUBSTR(I.Nome, 1,1)||I.Cognome|| '@lazienda.it')
FROM Impiegato I
WHERE I.Stipendio<=3000

--funzione genera_mail
CREATE OR REPLACE FUNCTION genera_mail (id NUMBER) RETURN VARCHAR2
    AS
       nome impiegato.nome%TYPE := NULL;
       cognome impiegato.cognome%TYPE  := NULL;
    BEGIN
       SELECT nome, cognome INTO nome, cognome FROM Impiegato WHERE Cod = id;
       RETURN LOWER(SUBSTR(nome, 1, 1) || cognome || '@lazienda.it');
    END;

--cursore genera_mail
DECLARE
    CURSOR impiegati IS SELECT Cod FROM impiegato WHERE stipendio > 3000;

BEGIN
    FOR impiegato IN impiegati LOOP
        DBMS_OUTPUT.PUT_LINE(genera_mail(impiegato.Cod));
    END LOOP;
END;

--DA CONTROLLARE
SET SERVEROUTPUT ON;

DECLARE
    CURSOR impiegati IS SELECT Cod FROM impiegato WHERE stipendio > 3000;
    TYPE imp_mail IS RECORD (
        CodImpiegato NUMBER(5),
        Mail VARCHAR2(128)
    );

BEGIN
    FOR impiegato IN impiegati LOOP
        DBMS_OUTPUT.PUT_LINE(genera_mail(impiegato.Cod));
        --INSERT INTO imp_mail(CodImpiegato, Mail) VALUES (impiegato.Cod, genera_mail(impiegato.Cod));
    END LOOP;
    --SELECT * FROM imp_mail;
END;
