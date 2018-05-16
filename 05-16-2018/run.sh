javac -d ./bin ./src/io/github/labdb/*.java

# Terminazione con errore: "Errore: numero di argomenti non valido."
java -cp ./bin io.github.labdb.Applicazione

# Terminazione con errore: "Errore: formato numerico non valido."
java -cp ./bin io.github.labdb.Applicazione 1a 1b

# Terminazione con successo:
java -cp ./bin io.github.labdb.Applicazione 1.6 2.3
