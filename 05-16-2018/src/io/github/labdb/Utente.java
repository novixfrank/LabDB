package io.github.labdb;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Utente {
	private String username;
	private char[] password;
	
	private static Connection db = null;
	
	public Utente(String username, char[] password) {
		this.username = username;
		this.password = password;
	}
	
	public Utente(BufferedReader in) throws IOException {
		System.out.print("Inserisci un nome utente: ");
		setUsername(in.readLine());
		
		System.out.print("Inserisci password: ");
		setPassword(in.readLine());
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setPassword(String password) {
		this.password = password.toCharArray();
	}
	
	private String getPassword() {
		return new String(password);
	}
	
	public void getDettagli() {
		System.out.println("Username: " + username + "\nPassword: " + getPassword());
	}

	public Connection connetti() {
		try {
		    db = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", getUsername(), getPassword());
		}
		catch (SQLException e) {

		    System.err.println("Connessione fallita.");
		    e.printStackTrace();

		}
		
		Entità.associaDB(db);
		return db;
	}
}
