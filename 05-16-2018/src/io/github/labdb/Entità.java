package io.github.labdb;

import java.sql.Connection;

public class Entità {
	private static Connection db = null;
	
	protected static Connection associaDB(Connection conn) {
		if (db == null) {
			db = conn;
		}
		
		return db;
	}
	
	protected static Connection getDatabase() {
		return db;
	}
}
