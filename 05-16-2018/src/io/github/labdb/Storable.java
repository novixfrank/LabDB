package io.github.labdb;

import java.io.BufferedReader;
import java.util.Map;

public interface Storable {
	public static Storable inserisci(BufferedReader in) {
		return null;
	}
	
	public static Map<Integer, Storable> ottieniTutti() {
		return null;
	}
	
	public static Storable ottieni(int id) {
		return null;
	}
	
	public static void visualizzaTutti() {}
	
	public abstract void visualizza();
	
	public abstract void visualizza(int tabs);
	
	public abstract Storable elimina();
}
