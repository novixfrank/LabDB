-- Esegui il codice del file 'test.sql' per le tabelle di verifica;

-- Es. 1. Definizione della funzione:
CREATE OR REPLACE FUNCTION cmassima(
    tabella VARCHAR2 -- Nella forma 'SCHEMA.TABELLA';
)
RETURN VARCHAR2
AS
    colonna VARCHAR2(30);
    res VARCHAR2(255);
    q1 VARCHAR2(500) := 'SELECT a.column_name
        FROM all_cons_columns a
        WHERE a.constraint_name = (
            SELECT c.constraint_name
            FROM all_constraints c
            WHERE
                c.owner = '':schema''
                AND TABLE_NAME = '':tab''
                AND CONSTRAINT_TYPE = ''P''
        )';
    q2 VARCHAR2(500) := 'SELECT MAX(t.:col) FROM :tab t';
BEGIN
    q1 := REPLACE(q1, ':schema', UPPER(SUBSTR(tabella, 1, INSTR(tabella, '.') - 1)));
    q1 := REPLACE(q1, ':tab', UPPER(SUBSTR(tabella, INSTR(tabella, '.') + 1)));
    
    --DBMS_OUTPUT.PUT_LINE(q1);
    
    EXECUTE IMMEDIATE q1 INTO colonna;

    q2 := REPLACE(q2, ':col', colonna);
    q2 := REPLACE(q2, ':tab', tabella);

    --DBMS_OUTPUT.PUT_LINE(q2);
    EXECUTE IMMEDIATE q2 INTO res;

    RETURN res;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'La tabella indicata non ha chiave primaria.'); -- Il range per gli errori definiti dall'utente è -20000, -20999.
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20001, 'La tabella indicata ha più chiavi primarie.');
END;

-- Esecuzioni (da essere eseguite in sede separata dalla definizione della funzione):
SELECT cmassima('admin.impiegato') AS max_tab FROM dual;
SELECT cmassima('admin.test_no_pk') AS max_tab FROM dual;
SELECT cmassima('admin.test_mul_pk') AS max_tab FROM dual;

-- Oppure, per chi dovesse preferire un blocco di PL/SQL:
BEGIN
    DBMS_OUTPUT.PUT_LINE(cmassima('admin.impiegato'));
    DBMS_OUTPUT.PUT_LINE(cmassima('admin.test_no_pk'));
    DBMS_OUTPUT.PUT_LINE(cmassima('admin.test_mul_pk'));
END;

/* ATTENZIONE! Lo schema (quello che nelle nostre query è definito come 'admin') sarebbe il nome della workspace.
 * Per ottenere il nome del proprio schema, è necessario eseguire la seguente query:
 * SELECT UPPER(SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')) FROM dual;
*/
