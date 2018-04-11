-- Es. 1.
CREATE OR REPLACE FUNCTION cmassima(
    tabella VARCHAR2 -- Nella forma 'SCHEMA.TABELLA';
)
RETURN VARCHAR2
AS
    colonna VARCHAR2(30);
    res VARCHAR2(255);
    q VARCHAR2(500) := 'SELECT MAX(t.:col) FROM :tab t';
BEGIN
    colonna := 'cod';

    q := REPLACE(q, ':col', colonna);
    q := REPLACE(q, ':tab', tabella);

    --DBMS_OUTPUT.PUT_LINE(q);
    EXECUTE IMMEDIATE q INTO res;

    RETURN res;
END;

/* SELECT COLUMN_NAME
FROM ALL_CONS_COLUMNS 
WHERE CONSTRAINT_NAME = (
    SELECT CONSTRAINT_NAME
    FROM ALL_CONSTRAINTS
    WHERE
        OWNER = 'ADMIN'
        AND TABLE_NAME = 'IMPIEGATO'
        AND CONSTRAINT_TYPE = 'P'
);*/
