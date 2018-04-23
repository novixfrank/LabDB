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


-- Popolamento delle prime due tabelle con dati dummy:
-- Popolamento di scuderia:
INSERT INTO scuderia(nome, punti) VALUES ('Ferrari', 0);
INSERT INTO scuderia(nome, punti) VALUES ('Red Bull', 0);
INSERT INTO scuderia(nome, punti) VALUES ('Alfa Romeo', 0);
INSERT INTO scuderia(nome, punti) VALUES ('Mercedes', 0);
INSERT INTO scuderia(nome, punti) VALUES ('McLaren', 0);
INSERT INTO scuderia(nome, punti) VALUES ('Aston Martin', 0);
INSERT INTO scuderia(nome, punti) VALUES ('Haas', 0);
INSERT INTO scuderia(nome, punti) VALUES ('Williams', 0);
INSERT INTO scuderia(nome, punti) VALUES ('Sahara Force', 0);
INSERT INTO scuderia(nome, punti) VALUES ('Renault', 0);

-- Popolamento di pilotaf1:
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (5, 'Sebastian Vettel', 1, 0);
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (7, 'Kimi Räikkönen', 1, 0);

INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (28, 'Brendon Hartley', 2, 0);
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (10, 'Pierre Gasly', 2, 0);

INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (9, 'Marcus Ericsson', 3, 0);
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (16, 'Charles Leclerc', 3, 0);

INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (44, 'Lewis Hamilton', 4, 0);
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (77, 'Valtteri Bottas', 4, 0);

INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (14, 'Fernando Alonso', 5, 0);
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (2, 'Stoffel Vandoorne', 5, 0);

INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (3, 'Daniel Ricciardo', 6, 0);
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (33, 'Max Verstappen', 6, 0);

INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (8, 'Romain Grosjean', 7, 0);
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (20, 'Kevin Magnussen', 7, 0);

INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (18, 'Lance Stroll', 8, 0);
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (35, 'Sergej Sirotkin', 8, 0);

INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (11, 'Sergio Pérez', 9, 0);
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (31, 'Esteban Ocon', 9, 0);

INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (27, 'Nico Hülkenberg', 10, 0);
INSERT INTO pilotaf1 (nro_vettura, nome, id_scuderia, punti) VALUES (55, 'Carlos Sainz Jr.', 10, 0);


CREATE OR REPLACE TRIGGER aggiornamento_punti
    AFTER INSERT ON pos_gp
    FOR EACH ROW
DECLARE
    punteggio NUMBER(2) := 0;

    msg VARCHAR2(250) := 'Pilota :pos: :nome (:num) della scuderia :scud';
    TYPE pilota IS RECORD (
        nome pilotaf1.nome%TYPE,
        num pilotaf1.nro_vettura%TYPE
    );
    tmp pilota;
    scud scuderia.nome%TYPE;
BEGIN
    -- Ottenimento del punteggio in base alla posizione:
    SELECT p.punteggio INTO punteggio FROM puntif1 p WHERE p.pos = :NEW.posizione;

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
        WHERE p.nro_vettura = :NEW.vettura
    );
END;

-- Popolamento di pos_gp con dati dummy:
-- Primo GP:
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 20, 1);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 8, 2);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 16, 3);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 14, 4);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 55, 5);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 28, 6);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 33, 7);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 44, 8);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 3, 9);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 9, 10);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 77, 11);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 27, 12);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 11, 13);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 31, 14);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 10, 15);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 7, 16);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 18, 17);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 5, 18);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 35, 19);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (1, 2, 20);

-- Secondo GP:
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 44, 1);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 27, 2);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 2, 3);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 8, 4);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 77, 5);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 14, 6);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 20, 7);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 33, 8);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 31, 9);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 11, 10);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 18, 11);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 28, 12);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 7, 13);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 5, 14);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 9, 15);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 35, 16);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 10, 17);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 55, 18);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 16, 19);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (2, 3, 20);

-- Terzo GP:
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 2, 1);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 11, 2);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 14, 3);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 33, 4);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 8, 5);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 55, 6);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 27, 7);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 20, 8);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 18, 9);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 44, 10);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 3, 11);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 7, 12);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 9, 13);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 35, 14);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 77, 15);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 5, 16);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 31, 17);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 10, 18);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 28, 19);
INSERT INTO pos_gp(numero_gp, vettura, posizione) VALUES (3, 16, 20);



-- 2.1. Aggiunta della colonna 'tempo' in 'pos_gp':
ALTER TABLE pos_gp ADD (
    tempo TIMESTAMP(3) CONSTRAINT pos_gp_tempo_uq UNIQUE
);
