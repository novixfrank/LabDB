package io.github.labdb;

import java.io.BufferedReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class Pilota extends Entità implements Storable {
	private static final String TABLE_NAME = "pilotaf1";
	
	int nVettura = 0; // ID - nro_vettura;
	String nome;
	Scuderia s = null; // id_scuderia;
	int punti = 0;
	
	static Map<Integer, Pilota> all = null;
	
	static {
		ottieniTutti();
	}
	
	private Pilota(int nVettura, String nome, Scuderia s, int punti) {
		this.nVettura = nVettura;
		this.nome = nome;
		this.s = s;
		this.punti = punti;
	}
	
	public static Storable inserisci(BufferedReader in) {
		return null;
	}
	
	public static Map<Integer, Pilota> ottieniTutti() {
		Statement stmt = null;
		ResultSet res = null;
		
		int vettura = 0;
		
		Connection db = Entità.getDatabase();
		
		all = new HashMap<Integer, Pilota>();
		
		try {
			stmt = db.createStatement();
			
			res = stmt.executeQuery("SELECT * FROM " + TABLE_NAME + " ORDER BY punti");
			
			while (res.next()) {
				vettura = res.getInt("nro_vettura");
				
				all.put(vettura, new Pilota(vettura, res.getString("nome"), Scuderia.ottieni(res.getInt("id_scuderia")), res.getInt("punti")));
			}
			
			stmt.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}

		return all;
	}
	
	public static void visualizzaTutti() {
		System.out.println("Piloti:");
		
		for (Pilota p : all.values()) {
			p.visualizza(1);
		}
	}
	
	@Override
	public void visualizza() {
		visualizza(0);
	}
	
	@Override
	public void visualizza(int tabs) {
		for (int i = 0; i == tabs; i++) {
			System.out.print("\t");
		}
		
		System.out.println(nVettura + ". " + nome + " (" + s.nome + ") - " + "Punti: " + punti);
	}

	public static Pilota ottieni(int id) {
		return all.get(id);
	}

	public Storable elimina() {
		// TODO Auto-generated method stub
		return null;
	}
}
