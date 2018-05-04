package io.github.labdb;

public class Applicazione {
    public static void main(String[] args) {
        Articolo a = null;

        if (args.length > 0) {
            if (args[0].equals("Articolo") && args.length == 2) {
                a = new Articolo(Integer.parseInt(args[1]));
            }
            else if (args[0].equals("Videogame") && args.length == 3) {
                a = new Videogame(Integer.parseInt(args[1]), args[2]);
            }
            else {
                System.out.println("Errore: il numero di argomenti indicati non corrisponde a quelli richiesti.");
                return;
            }
            
            System.out.println(a.toString());
        }
        else {
            System.out.println("Errore: nessun elemento specificato.");
        }
    }
}
