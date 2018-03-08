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
        SELECT SUBSTR(nome, 1,1), cognome INTO nome,cognome FROM Impiegato WHERE Cod=id;
        RETURN nome||cognome||'@lazienda.it';
    END;
