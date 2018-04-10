-- Es. 1.1. Creazione della tabella reportimpiegato;
CREATE TABLE reportimpiegato (
    cod NUMBER(4),
    report VARCHAR2(4000),
    CONSTRAINT reportimpiegato_pk PRIMARY KEY (cod),
    CONSTRAINT reportimpiegato_fk FOREIGN KEY (cod) REFERENCES impiegato(cod)
);

-- Es. 1.2. Definizione della procedura:
CREATE OR REPLACE PROCEDURE crea_report (
    quant OUT NUMBER
) AS
    testo_composto VARCHAR2(4000) := NULL;
    CURSOR imp IS
        SELECT i.cod, i.nome, i.cognome, i.data_assunto, a.datan, a.luogon, a.sesso, a.provn
        FROM impiegato i INNER JOIN anagrafica a ON i.cod = a.cod
        ORDER BY i.cod;
BEGIN
    quant := 0;

    FOR i IN imp LOOP
        testo_composto := 'Nome: ' || i.nome || CHR(10);
        testo_composto := testo_composto || 'Cognome: ' || i.cognome || CHR(10);

        -- Dati non neccessariamente inseribili:
        CASE 
            WHEN i.datan IS NOT NULL THEN
                testo_composto := testo_composto || 'Data di nascita: ' || TO_CHAR(i.datan, 'DD/MM/YYYY') || CHR(10);
            WHEN i.luogon IS NOT NULL THEN
                testo_composto := testo_composto || 'Luogo di nascita: ' || i.luogon;
                
                IF i.provn IS NOT NULL THEN
                     testo_composto := testo_composto || ' (' || i.provn || ')';
                END IF;
                
                testo_composto := testo_composto || CHR(10);
            WHEN i.sesso IS NOT NULL THEN
                testo_composto := testo_composto || 'Sesso: ' || i.sesso || CHR(10);
        END CASE;
        
        -- Ultimo dato assoluto:
        testo_composto := testo_composto || 'Data di assunzione: ' || TO_CHAR(i.data_assunto, 'DD/MM/YYYY');

        -- DBMS_OUTPUT.PUT_LINE(testo_composto);

        BEGIN
            INSERT INTO reportimpiegato(cod, report) VALUES(i.cod, testo_composto);
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                UPDATE reportimpiegato r SET r.report = testo_composto WHERE r.cod = i.cod;
        END;

        quant := imp%ROWCOUNT; -- Non può essere eseguito dopo il LOOP in quanto al di fuori di esso, il cursore è chiuso;
    END LOOP;
END;

-- Esecuzione (da essere eseguita da sola):
DECLARE
    q NUMBER;
BEGIN
    crea_report(q);
    DBMS_OUTPUT.PUT_LINE(q);
END;



-- Es. 2. Effetto della procedura ricreato con MERGE:
MERGE INTO reportimpiegato r
USING
    (SELECT i.cod, i.nome, i.cognome, i.data_assunto, a.datan, a.luogon, a.sesso, a.provn
    FROM impiegato i INNER JOIN anagrafica a ON i.cod = a.cod) i
ON (r.cod = i.cod)
WHEN MATCHED THEN
    UPDATE SET r.report = (
        'Nome: ' || i.nome || CHR(10) ||
        'Cognome: ' || i.cognome || CHR(10) ||
        NVL2(i.datan, 'Data di nascita: ' || i.datan || CHR(10), '') ||
        NVL2(i.luogon, 'Luogo di nascita: ' || i.luogon || NVL2(i.provn, ' (' || i.provn || ')', '') || CHR(10), '') ||
        NVL2(i.sesso, 'Sesso: ' || i.sesso || CHR(10), '') ||
        'Data di assunzione: ' || i.data_assunto
    )
WHEN NOT MATCHED THEN
    INSERT (cod, report)
    VALUES (i.cod, (
        'Nome: ' || i.nome || CHR(10) ||
        'Cognome: ' || i.cognome || CHR(10) ||
        NVL2(i.datan, 'Data di nascita: ' || i.datan || CHR(10), '') ||
        NVL2(i.luogon, 'Luogo di nascita: ' || i.luogon || NVL2(i.provn, ' (' || i.provn || ')', '') || CHR(10), '') ||
        NVL2(i.sesso, 'Sesso: ' || i.sesso || CHR(10), '') ||
        'Data di assunzione: ' || i.data_assunto
    ));
-- Ho preferito duplicare il codice piuttosto che unificarlo in quanto più elegante e coerente con lo standard della community (Gennaro Landolfi).
