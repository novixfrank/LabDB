package io.github.labdb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class Scuderia extends Entità implements Storable {
	private static final String TABLE_NAME = "scuderia";
	private static int scuderiaID = 0;
	
	int id; // ID - id_s;
	String nome;
	int punti = 0;
	
	static Map<Integer, Scuderia> all = null;
	
	private Scuderia(int id, String nome, int punti) {
		this.id = id;
		this.nome = nome;
		this.punti = punti;
	}
	
	public static Map<Integer, Scuderia> ottieniTutti() {
		Statement stmt = null;
		ResultSet res = null;
		
		Connection db = Entità.getDatabase();
		
		all = new HashMap<Integer, Scuderia>();
		
		try {
			stmt = db.createStatement();
			
			res = stmt.executeQuery("SELECT * FROM " + TABLE_NAME);
			
			while (res.next()) {
				scuderiaID = res.getInt("id_s");
				
				all.put(scuderiaID, new Scuderia(scuderiaID, res.getString("nome"), res.getInt("punti")));
			}
			
			stmt.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		scuderiaID++;
		return all;
	}

	public static Scuderia ottieni(int id) {
		return all.get(id);
	}

	public Scuderia elimina() {
		return null;
	}

	@Override
	public void visualizza() {
	}

	@Override
	public void visualizza(int tabs) {
		// TODO Auto-generated method stub
		
	}
}
