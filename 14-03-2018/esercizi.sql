-- 1. Creazione della vista
CREATE OR REPLACE VIEW stip_proposto (
    cod, nome, attuale, proposto, capo
) AS SELECT i.cod, i.nome || ' ' || i.cognome, i.stipendio, CASE
    WHEN EXTRACT(YEAR FROM i.data_assunto) <= '2012' THEN i.stipendio * 1.15
    WHEN EXTRACT(YEAR FROM i.data_assunto) = '2013' THEN i.stipendio * 1.10
ELSE i.stipendio
END, NVL2(c.cognome, c.cognome, 'Nessuno')
FROM impiegato i LEFT OUTER JOIN impiegato c ON i.capo = c.cod
ORDER BY i.cod;
