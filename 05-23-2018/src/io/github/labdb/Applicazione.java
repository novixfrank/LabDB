package io.github.labdb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;

public class Applicazione {
	private static Connection db = null;
	//private static Utente u = null;
	private static BufferedReader in = null;
	
	public static void main(String[] args) {
		//Console c = System.console();
		in = new BufferedReader(new InputStreamReader(System.in));
		
		String s = null;
		
		/*if (c == null) {
			System.err.println("Console non accessibile");
	        System.exit(1);
		}*/
		
		accedi();
		
		do {
			System.out.print("Si vuole inserire una nuova posizione? [S/N]: ");
			try {
				s = in.readLine();
			}
			catch (IOException e) {
				e.printStackTrace();
			}
			
			if (s.toLowerCase() == "s") {
				
			}
			else {
				break;
			}
		}
		while (true);
		
		System.out.println("Programma in chiusura...");
	}
	
	public static Connection getDatabase() {
		return db;
	}
	
	private static void accedi() {
		/*try {
			u = new Utente(in);
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		db = u.connetti();
		
		if (db == null) {
	        System.exit(1);
		}
		else {
			System.out.println("\tConnessione stabilita con successo!");
		}*/
	}
}
