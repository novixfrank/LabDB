--Aggiunta colonna Tempo:
	ALTER TABLE Pos_GP
	ADD Tempo NUMBER(8,3)
	/* oppure INTERVAL DAY(0) TO SECOND(3)...
	* DISABLE ALL TRIGGERS; per un trigger unico */

--Rinomina tabella:
	RENAME Pos_GP TO Pos_GP_Base;

--Creazione vista con il vecchio nome della tabella:
	CREATE OR REPLACE VIEW Pos_GP AS
	SELECT * FROM Pos_GP_Base;

--Soluzione 
	CREATE OR REPLACE TRIGGER PosGP_InstIns
	/* per l'inserimento di dati in Pos_GP, verificando tempo
	* e posizione (ed eventualmente aggiornando i punti) */
	INSTEAD OF INSERT ON Pos_GP
	FOR EACH ROW
	DECLARE
		team Scuderia.id_S%TYPE;
		ptiGara Lab18.PuntiF1.Punteggio%TYPE; --punti nel GP
		CURSOR contraddiz IS --incongruenze
			SELECT * FROM Pos_GP_Base
			WHERE Numero_GP = :NEW.Numero_GP AND
				((Posizione < :NEW.Posizione AND Tempo > :NEW.Tempo)
				OR (Posizione>:NEW.Posizione AND Tempo<:NEW.Tempo));
		riga contraddiz%ROWTYPE; --record
	BEGIN
		OPEN contraddiz;
		FETCH contraddiz INTO riga;
		IF contraddiz%FOUND THEN -- c’è almeno un’incongruenza
			RAISE_APPLICATION_ERROR(-20003,
				'Tempo o posizione errati');
		ELSE -- OK: inserimento in tabella
			INSERT INTO Pos_GP_Base
				(Numero_GP, Vettura, Posizione, Tempo)
			VALUES (:NEW.Numero_GP, :NEW.Vettura, :NEW.Posizione,
				:NEW.Tempo);
		END IF;
		-- aggiungere eventuale aggiornamento punti
	END;
