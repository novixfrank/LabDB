package io.github.labdb;

import java.io.Console;

public class Applicazione {
	public static void main(String[] args) {
		Console c = System.console();
		
		boolean s = false;
		
		if (c == null) {
			System.err.println("Console non accessibile");
	        System.exit(1);
		}
		
		Utente u = new Utente(c.readLine("Inserisci nome utente: "), c.readPassword("Inserisci password: "));
		//u.getDettagli();
		
		do {
			if (c.readLine("Inserisci nome utente: ").toLowerCase() == "s") {
				
			}
			else {
				s = true;
			}
		}
		while (!s);
		
		System.out.println("Programma in chiusura...");
	}
}
