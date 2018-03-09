-- 1. Creazione della tabella
CREATE TABLE Impiegato 
    Cod NUMBER(5) CONSTRAINT impiegato_pk PRIMARY KEY,
    Nome VARCHAR2(32) NOT NULL,
    Cognome VARCHAR2(32) NOT NULL,
    Data_Assunto DATE NOT NULL,
    Stipendio NUMBER(6) NOT NULL,
    Capo NUMBER(5) NULL,
    CONSTRAINT impiegato_fk FOREIGN KEY (Capo) REFERENCES Impiegato(Cod)
);



-- 2. Inserimento
INSERT INTO Impiegato(Cod, Nome, Cognome, Data_Assunto, Stipendio, Capo) VALUES (1, 'Alessandro', 'Rossi', TO_DATE('01/03/2014','DD/MM/YYYY'), 3000, NULL); -- 2
INSERT INTO Impiegato(Cod, Nome, Cognome, Data_Assunto, Stipendio, Capo) VALUES (2, 'Alberto', 'Bianchi', TO_DATE('01/02/2013', 'DD/MM/YYYY'), 4000, NULL); -- 3
INSERT INTO Impiegato(Cod, Nome, Cognome, Data_Assunto, Stipendio, Capo) VALUES (3, 'Andrea', 'Verdi', TO_DATE('03/06/2011', 'DD/MM/YYYY'), 5000, NULL);
INSERT INTO Impiegato(Cod, Nome, Cognome, Data_Assunto, Stipendio, Capo) VALUES (4, 'Tiziana', 'Viola', TO_DATE('03/03/2013', 'DD/MM/YYYY'), 1500, 1);
INSERT INTO Impiegato(Cod, Nome, Cognome, Data_Assunto, Stipendio, Capo) VALUES (5, 'Umberto', 'Neri', TO_DATE('12/09/2014', 'DD/MM/YYYY'), 2500, 2);
INSERT INTO Impiegato(Cod, Nome, Cognome, Data_Assunto, Stipendio, Capo) VALUES (6, 'Francesca', 'Tari', TO_DATE('22/11/2013', 'DD/MM/YYYY'), 2000, 2);
INSERT INTO Impiegato(Cod, Nome, Cognome, Data_Assunto, Stipendio, Capo) VALUES (7, 'Luigi', 'Marrone', TO_DATE('05/02/2012', 'DD/MM/YYYY'), 2800, 3);

UPDATE impiegato SET Capo = 2 WHERE Cod = 1;
UPDATE impiegato SET Capo = 3 WHERE Cod = 2;



-- 3. Dichiarazione della funzione di generazione delle e-mail
CREATE OR REPLACE FUNCTION genera_mail(
    nome VARCHAR2,
    cognome VARCHAR2
)
RETURN VARCHAR2
AS
BEGIN
    RETURN LOWER(SUBSTR(nome, 1, 1) || cognome || '@lazienda.it');
END;

-- Selezione dei dati:
SELECT i.cod, genera_mail(i.nome, i.cognome) AS mail FROM impiegato i WHERE i.stipendio <= 3000



-- 4. Selezione dei dipendenti assunti da più di 50 mesi
-- TODO
