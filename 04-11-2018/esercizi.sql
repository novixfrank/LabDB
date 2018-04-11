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
