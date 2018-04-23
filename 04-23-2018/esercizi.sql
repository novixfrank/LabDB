-- Vedi il file puntif1.sql

-- Es. 1. Creazione delle tabelle:
CREATE TABLE scuderia (
    id_s NUMBER(5) CONSTRAINT scuderia_pk PRIMARY KEY,
    nome VARCHAR2(32) NOT NULL,
    punti NUMBER(3) NOT NULL
);

CREATE SEQUENCE scuderia_autoinc;

CREATE OR REPLACE TRIGGER scuderia_gen_pk
    BEFORE INSERT ON scuderia
    FOR EACH ROW
    WHEN (NEW.id_s IS NULL)
BEGIN
    :NEW.id_s := scuderia_autoinc.NEXTVAL;
END;


CREATE TABLE pilotaf1 (
    nro_vettura NUMBER(3) CONSTRAINT pilota_pk PRIMARY KEY,
    nome VARCHAR2(32) NOT NULL,
    id_scuderia NUMBER(5),
    punti NUMBER(3) NOT NULL,
    CONSTRAINT pilotaf1_fk FOREIGN KEY (id_scuderia) REFERENCES scuderia(id_s)
);


CREATE TABLE pos_gp (
    numero_gp NUMBER(2) NOT NULL,
    vettura NUMBER (3) NOT NULL,
    posizione NUMBER(2) NOT NULL,
    CONSTRAINT pos_gp_pk PRIMARY KEY (numero_gp, vettura),
    CONSTRAINT pos_gp_fk FOREIGN KEY (vettura) REFERENCES pilotaf1(nro_vettura)
);

CREATE OR REPLACE TRIGGER aggiornamento_punti
    BEFORE INSERT ON pos_gp
    FOR EACH ROW
DECLARE
    punteggio NUMBER(2) := 0;
BEGIN
    -- Ottenimento del punteggio in base alla posizione:
    SELECT p.punteggio INTO punteggio FROM puntif1 p WHERE p.pos = :NEW.pos;

    --  Aggiornamento del pilota in una determinata posizione:
    UPDATE pilotaf1 p
    SET p.punti = p.punti + punteggio
    WHERE p.nro_vettura = :NEW.vettura;

    -- Aggiornamento del punteggio della scuderia del pilota appena aggiornato:
    UPDATE scuderia s
    SET s.punti = s.punti + punteggio
    WHERE s.id_s = (
        SELECT p.id_scuderia
        FROM pilotaf1 p
        WHERE p.nro_vettura = :NEW.vettura;
    );
END;
