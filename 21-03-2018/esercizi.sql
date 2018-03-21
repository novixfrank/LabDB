-- 1.1 creazione vista e proiezione:
CREATE OR REPLACE VIEW stip_capo (
    cod_capo, stip_min, stip_max
) AS SELECT i.capo, MIN(i.stipendio), MAX(i.stipendio)
FROM impiegato i
WHERE i.capo IS NOT NULL
GROUP BY i.capo
ORDER BY i.capo;

-- SELECT * FROM stip_capo;
