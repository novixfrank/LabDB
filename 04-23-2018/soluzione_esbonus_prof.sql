CREATE OR REPLACE VIEW Classif_Piloti AS
	SELECT Nome, SUM(D.Punteggio) AS Punteggio
		FROM PilotaF1 P
			JOIN Pos_GP G ON P.Nro_vettura = G.Vettura
			JOIN Lab18.PuntiF1 D ON G.Posizione = D.Pos
		GROUP BY P.Nro_vettura, P.Nome;
