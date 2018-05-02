javac ./src/io/github/labdb/*.java -d ./bin

# Terminazione con errore: "Errore: nessun elemento specificato."
java io.github.labdb.Applicazione

# Terminazione con errore: "Errore: il numero di argomenti indicati non corrisponde a quelli richiesti.
java io.github.labdb.Applicazione Articolo 1 Test

# Terminazione con errore: "Errore: il numero di argomenti indicati non corrisponde a quelli richiesti.
java io.github.labdb.Applicazione Videogame 1

# Terminazione con successo: "Articolo: 1;"
java io.github.labdb.Applicazione Articolo 1

# Terminazione con successo: "Videogame: Codice: 1; Titolo: Test;"
java io.github.labdb.Applicazione Videogame 1 Test
