-- Si consiglia la visione del file 'miglioramenti.sql'.

-- 1.1 Creazione della tabella
CREATE TABLE impiegato (
    cod NUMBER(5) CONSTRAINT impiegato_pk PRIMARY KEY,
    nome VARCHAR2(32) NOT NULL,
    cognome VARCHAR2(32) NOT NULL,
    data_assunto DATE NOT NULL,
    stipendio NUMBER(6) NOT NULL,
    capo NUMBER(5) NULL,
    CONSTRAINT impiegato_fk FOREIGN KEY (capo) REFERENCES impiegato(cod)
);

-- 1.2. Inserimento
INSERT INTO impiegato(cod, nome, cognome, data_assunto, stipendio, capo) VALUES (1, 'Alessandro', 'Rossi', TO_DATE('01/03/2014','DD/MM/YYYY'), 3000, NULL);
INSERT INTO impiegato(cod, nome, cognome, data_assunto, stipendio, capo) VALUES (2, 'Alberto', 'Bianchi', TO_DATE('01/02/2013', 'DD/MM/YYYY'), 4000, NULL);
INSERT INTO impiegato(cod, nome, cognome, data_assunto, stipendio, capo) VALUES (3, 'Andrea', 'Verdi', TO_DATE('03/06/2011', 'DD/MM/YYYY'), 5000, NULL);
INSERT INTO impiegato(cod, nome, cognome, data_assunto, stipendio, capo) VALUES (4, 'Tiziana', 'Viola', TO_DATE('03/03/2013', 'DD/MM/YYYY'), 1500, 1);
INSERT INTO impiegato(cod, nome, cognome, data_assunto, stipendio, capo) VALUES (5, 'Umberto', 'Neri', TO_DATE('12/09/2014', 'DD/MM/YYYY'), 2500, 2);
INSERT INTO impiegato(cod, nome, cognome, data_assunto, stipendio, capo) VALUES (6, 'Francesca', 'Russo', TO_DATE('22/11/2013', 'DD/MM/YYYY'), 2000, 2);
INSERT INTO impiegato(cod, nome, cognome, data_assunto, stipendio, capo) VALUES (7, 'Luigi', 'Marrone', TO_DATE('05/02/2012', 'DD/MM/YYYY'), 2800, 3);

UPDATE impiegato SET capo = 2 WHERE cod = 1;
UPDATE impiegato SET capo = 3 WHERE cod = 2;



-- 2.1. Dichiarazione della funzione di generazione delle e-mail:
CREATE OR REPLACE FUNCTION genera_mail(
    nome VARCHAR2,
    cognome VARCHAR2
)
RETURN VARCHAR2
AS
BEGIN
    RETURN LOWER(SUBSTR(nome, 1, 1) ||  TRANSLATE(cognome, ' ''', '') || '@lazienda.it');
END;

-- Selezione dei dati:
SELECT i.cod, genera_mail(i.nome, i.cognome) AS mail FROM impiegato i WHERE i.stipendio <= 3000;

-- 2.2. Selezione dei dipendenti assunti da più di 50 mesi sottoposti di 'Bianchi':
SELECT * FROM impiegato i WHERE i.capo IN (SELECT cod FROM impiegato WHERE cognome = 'Bianchi') AND i.data_assunto <= ADD_MONTHS(CURRENT_DATE, -50);
