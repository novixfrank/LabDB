CREATE OR REPLACE PROCEDURE crea_report (
    quant OUT NUMBER
) AS
    testo VARCHAR2(4000) := 'Nome: :nome' || CHR(10) ||
        'Cognome: :cognome' || CHR(10) ||
        'Data di nascita: :data_n' || CHR(10) ||
        'Luogo di nascita: :luogo_n' || CHR(10) ||
        'Sesso: :sesso' || CHR(10) ||
        'Data di assunzione: :data_a';
    testo_composto VARCHAR2(4000) := NULL;
    CURSOR imp IS
        SELECT i.cod, i.nome, i.cognome, i.data_assunto, a.datan, a.luogon, a.sesso, a.provn
        FROM impiegato i INNER JOIN anagrafica a ON i.cod = a.cod
        WHERE
            (a.datan IS NOT NULL) AND
            (a.luogon IS NOT NULL) AND
            (a.sesso IS NOT NULL) AND
            (a.provn IS NOT NULL)
        ORDER BY i.cod;
BEGIN
    quant := 0;

    FOR i IN imp LOOP
        testo_composto := testo;

        testo_composto := REPLACE(testo_composto, ':nome', i.nome);
        testo_composto := REPLACE(testo_composto, ':cognome', i.cognome);
        testo_composto := REPLACE(testo_composto, ':data_n', i.datan);
        testo_composto := REPLACE(testo_composto, ':luogo_n', i.luogon);
        testo_composto := REPLACE(testo_composto, ':sesso', i.sesso);
        testo_composto := REPLACE(testo_composto, ':data_a', i.data_assunto);

        BEGIN
            INSERT INTO reportimpiegato(cod, report) VALUES(i.cod, testo_composto);
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                UPDATE reportimpiegato r SET r.report = testo_composto WHERE r.cod = i.cod;
        END;
        
        quant := imp%ROWCOUNT;
    END LOOP;
END;
