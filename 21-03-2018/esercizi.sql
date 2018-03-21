-- 1.1. Creazione vista e proiezione:
CREATE OR REPLACE VIEW stip_capo (
    cod_capo, stip_min, stip_max
) AS SELECT i.capo, MIN(i.stipendio), MAX(i.stipendio)
FROM impiegato i
WHERE i.capo IS NOT NULL
GROUP BY i.capo
ORDER BY i.capo;

-- SELECT * FROM stip_capo;

-- 1.2. Calcolo stipendio medio dip. di Bianchi:
SELECT AVG(i.stipendio) AS stip_medio
FROM impiegato i
CONNECT BY i.capo = PRIOR i.cod
START WITH i.capo IN (SELECT cod FROM impiegato WHERE cognome = 'Bianchi');

-- Alternativa:
SELECT AVG(i.stipendio) AS stip_medio
FROM impiegato i
WHERE LEVEL > 1
CONNECT BY i.capo = PRIOR i.cod
START WITH i.cod IN (SELECT cod FROM impiegato WHERE cognome = 'Bianchi');

-- 2. Stampa a video degli impiegati con codice compreso 7 e 10:
DECLARE
    cognomi VARCHAR2(500) := NULL;
    cognome VARCHAR2(32) := NULL;
BEGIN
    FOR i IN 7..10 LOOP
        SELECT imp.cognome INTO cognome FROM impiegato imp WHERE imp.cod = i;
        cognomi := cognomi || ', ' || cognome;
    END LOOP;

    cognomi := LTRIM(cognomi, ', ');
    DBMS_OUTPUT.PUT_LINE(cognomi);
END;
