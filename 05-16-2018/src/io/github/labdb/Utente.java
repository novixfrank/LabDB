package io.github.labdb;

public class Utente {
	private String username;
	private char[] password;
	
	public Utente(String username, char[] password) {
		this.username = username;
		this.password = password;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void getDettagli() {
		System.out.println("Username: " + username + "\nPassword: " + new String(password));
	}
}
