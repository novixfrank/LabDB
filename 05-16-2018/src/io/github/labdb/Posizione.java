package io.github.labdb;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.HashMap;
import java.util.Map;

public class Posizione extends Entità implements Storable {
	private static final String TABLE_NAME = "pos_gp";
	
	private static int posID = 0;
	
	int numGP; // ID - numero_gp;
	int pos; // posizione;
	Pilota p;
	Time tempo;
	
	private static Map<Integer, Posizione> all = null;
	
	static {
		ottieniTutti();
	}
	
	private Posizione(int numGP, int pos, Pilota p, Time tempo) {
		this.numGP = numGP;
		this.pos = pos;
		this.p = p;
		this.tempo = tempo;
	}

	public static Entità inserisci(BufferedReader in) {
		int id; // ID - numero_gp;
		int pos; // posizione;
		Pilota p; // vettura;
		Time tempo;
		
		try {
			Pilota.visualizzaTutti();
			System.out.print("Indicare il pilota da selezionare: ");
			Pilota.ottieni(Integer.parseInt(in.readLine()));
		}
		catch (NumberFormatException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public static Map<Integer, Posizione> ottieniTutti() {
		Statement stmt = null;
		ResultSet res = null;
		
		Connection db = Entità.getDatabase();
		
		all = new HashMap<Integer, Posizione>();
		
		try {
			stmt = db.createStatement();
			
			res = stmt.executeQuery("SELECT * FROM " + TABLE_NAME);
			
			while (res.next()) {
				posID = res.getInt("numero_gp");
				
				all.put(posID, new Posizione(res.getInt("numero_gp"), res.getInt("posizione"), Pilota.ottieni(res.getInt("vettura")), res.getTime("tempo")));
			}
			
			stmt.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		posID++;
		return all;
	}

	public Scuderia ottieni(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Scuderia elimina() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void visualizza() {
		// TODO Auto-generated method stub
	}

	@Override
	public void visualizza(int tabs) {
		// TODO Auto-generated method stub
		
	}
	
	
}
