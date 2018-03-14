-- 2.1 Dichiarazione della funzione di generazione delle e-mail:
CREATE OR REPLACE FUNCTION genera_mail(
    nome VARCHAR2,
    cognome VARCHAR2
)
RETURN VARCHAR2
AS
BEGIN
    RETURN LOWER(SUBSTR(nome, 1, 1) ||  REGEXP_REPLACE(LOWER(cognome), '[a-z]') || '@lazienda.it');
END;



-- 2.2 Selezione dei dipendenti assunti da più di 50 mesi sottoposti di 'Bianchi':
SELECT i.* FROM impiegato i JOIN impiegato c ON i.capo = c.cod WHERE c.cognome = 'Bianchi' AND MONTHS_BETWEEN(CURRENT_DATE, i.data_assunto) >= 50;
