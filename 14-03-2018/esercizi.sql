-- 1.1. Creazione della vista
CREATE OR REPLACE VIEW stip_proposto (
    cod, nome, attuale, proposto, capo
) AS SELECT i.cod, i.nome || ' ' || i.cognome, i.stipendio, CASE
    WHEN EXTRACT(YEAR FROM i.data_assunto) <= '2012' THEN i.stipendio * 1.15
    WHEN EXTRACT(YEAR FROM i.data_assunto) = '2013' THEN i.stipendio * 1.10
ELSE i.stipendio
END, NVL2(c.cognome, c.cognome, 'Nessuno')
FROM impiegato i LEFT OUTER JOIN impiegato c ON i.capo = c.cod
ORDER BY i.cod;

-- 1.2. Aggiornamento stipendio e cancellazione vista
UPDATE impiegato i
SET i.stipendio = (
    SELECT s.proposto
    FROM stip_proposto s
    WHERE s.cod = i.cod
);

DROP VIEW stip_proposto;

-- Creazione tabella 'personale' per esercizio 2 (Vedi file personale.sql)

-- 2.1. Inserimento "nuovi" impiegati da personale
INSERT INTO impiegato i (
    SELECT p.cod_i AS cod, p.nome, p.cognome, p.data_assunto, p.stipendio, p.capo
    FROM personale p
);

-- 2.2 Eliminazione impiegati assunti da meno di 3 anni
DELETE FROM impiegato i WHERE ADD_MONTHS(i.data_assunto, 12 * 3) >= CURRENT_DATE;
