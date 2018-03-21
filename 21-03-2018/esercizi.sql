-- 1.1. Creazione vista e proiezione:
CREATE OR REPLACE VIEW stip_capo (
    cod_capo, stip_min, stip_max
) AS SELECT i.capo, MIN(i.stipendio), MAX(i.stipendio)
FROM impiegato i
WHERE i.capo IS NOT NULL
GROUP BY i.capo
ORDER BY i.capo;

-- SELECT * FROM stip_capo;

-- 1.2. Calcolo stipendio medio dip. di Bianchi
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
