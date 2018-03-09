-- 1 crea tabella
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

-- 2 inserisci impiegato
INSERT INTO Impiegato(Cod, Nome, Cognome, Data_Assunto, Stipendio, Capo) VALUES ( , ‘ ‘, ‘ ‘, TO_DATE( ‘ ‘, ‘DD/MM/YYYY’,  ,  )

--proiezione dati
SELECT * FROM Impiegato ORDER BY COD;

-- 3.1 generazione via interrogazione di email se stipendio<=3000
SELECT LOWER(SUBSTR(I.Nome, 1,1)||I.Cognome|| '@lazienda.it')
FROM Impiegato I
WHERE I.Stipendio<=3000

-- 3.2 funzione genera_mail
CREATE OR REPLACE FUNCTION genera_mail (id NUMBER) RETURN VARCHAR2
    AS
       nome impiegato.nome%TYPE := NULL;
       cognome impiegato.cognome%TYPE  := NULL;
    BEGIN
       SELECT nome, cognome INTO nome, cognome FROM Impiegato WHERE Cod = id;
       RETURN LOWER(SUBSTR(nome, 1, 1) || cognome || '@lazienda.it');
    END;

-- 3.3 cursore genera_mail
DECLARE
    CURSOR impiegati IS SELECT Cod FROM impiegato WHERE stipendio > 3000;

BEGIN
    FOR impiegato IN impiegati LOOP
        DBMS_OUTPUT.PUT_LINE(genera_mail(impiegato.Cod));
    END LOOP;
END;

-- 3.4 DA CONTROLLARE
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
