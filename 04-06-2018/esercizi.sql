-- Es. 1.1. Create table ReportImpiegato
CREATE TABLE reportimpiegato (
    cod NUMBER(4),
    report VARCHAR2(4000),
    CONSTRAINT reportimpiegato_pk PRIMARY KEY (cod),
    CONSTRAINT reportimpiegato_fk FOREIGN KEY (cod) REFERENCES impiegato(cod)
);

-- Es. 1.2. Definizione della procedura
CREATE OR REPLACE PROCEDURE crea_report (
    quant OUT NUMBER
) AS
    testo VARCHAR2(4000) := 'Nome: :nome' || CHR(10) ||
        'Cognome: :cognome' || CHR(10) ||
        'Data di nascita: :data_n' || CHR(10) ||
        'Luogo di nascita: :luogo_n (:prov_n)' || CHR(10) ||
        'Sesso: :sesso' || CHR(10) ||
        'Data di assunzione: :data_a';
    testo_composto VARCHAR2(4000) := NULL;
    CURSOR imp IS
        SELECT i.cod, i.nome, i.cognome, i.data_assunto, a.datan, a.luogon, a.sesso, a.provn
        FROM impiegato i INNER JOIN anagrafica a ON i.cod = a.cod
        ORDER BY i.cod;
BEGIN
    quant := 0;

    FOR i IN imp LOOP
        IF
            (i.datan IS NOT NULL) AND
            (i.luogon IS NOT NULL) AND
            (i.sesso IS NOT NULL) AND
            (i.provn IS NOT NULL)
        THEN
            testo_composto := testo;

            testo_composto := REPLACE(testo_composto, ':nome', i.nome);
            testo_composto := REPLACE(testo_composto, ':cognome', i.cognome);
            testo_composto := REPLACE(testo_composto, ':data_n', i.datan);
            testo_composto := REPLACE(testo_composto, ':luogo_n', i.luogon);
            testo_composto := REPLACE(testo_composto, ':prov_n', i.provn);
            testo_composto := REPLACE(testo_composto, ':sesso', i.sesso);
            testo_composto := REPLACE(testo_composto, ':data_a', i.data_assunto);

            -- DBMS_OUTPUT.PUT_LINE(testo_composto);

            BEGIN
                INSERT INTO reportimpiegato(cod, report) VALUES(i.cod, testo_composto);
            EXCEPTION
                WHEN DUP_VAL_ON_INDEX THEN
                    UPDATE reportimpiegato r SET r.report = testo_composto WHERE r.cod = i.cod;
            END;

            quant := quant + 1;
            /* imp%ROWCOUNT non può essere utilizzato perchè conta tutte i record presenti anagrafica 
             * e non solo quelli interessati dall'inserimento o dall'aggiornamento.
             *
             * Per la versione utilizzante il %ROWCOUNT, guardare il file 'alternativa.sql'. */
        END IF;
    END LOOP;
END;

-- Esecuzione (da essere eseguita da sola)
DECLARE
    q NUMBER;
BEGIN
    crea_report(q);
    DBMS_OUTPUT.PUT_LINE(q);
END;



-- Es. 2. Effetto della procedura ricreato con MERGE
MERGE INTO reportimpiegato r
USING
    (SELECT i.cod, i.nome, i.cognome, i.data_assunto, a.datan, a.luogon, a.sesso, a.provn
    FROM impiegato i INNER JOIN anagrafica a ON i.cod = a.cod) i
ON (r.cod = i.cod)
WHEN MATCHED THEN
    UPDATE SET r.report = ('Nome: ' || i.nome || CHR(10) ||
        'Cognome: ' || i.cognome || CHR(10) ||
        'Data di nascita: ' || i.datan || CHR(10) ||
        'Luogo di nascita: ' || i.luogon || CHR(10) ||
        'Sesso: ' || i.sesso || CHR(10) ||
        'Data di assunzione: ' || i.data_assunto)
    WHERE
        (i.datan IS NOT NULL) AND
        (i.luogon IS NOT NULL) AND
        (i.sesso IS NOT NULL) AND
        (i.provn IS NOT NULL)
WHEN NOT MATCHED THEN
    INSERT (cod, report)
    VALUES (i.cod,
        ('Nome: ' || i.nome || CHR(10) ||
        'Cognome: ' || i.cognome || CHR(10) ||
        'Data di nascita: ' || i.datan || CHR(10) ||
        'Luogo di nascita: ' || i.luogon || CHR(10) ||
        'Sesso: ' || i.sesso || CHR(10) ||
        'Data di assunzione: ' || i.data_assunto)
    )
    WHERE
        (i.datan IS NOT NULL) AND
        (i.luogon IS NOT NULL) AND
        (i.sesso IS NOT NULL) AND
        (i.provn IS NOT NULL);
