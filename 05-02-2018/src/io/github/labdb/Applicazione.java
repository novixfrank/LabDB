package io.github.labdb;

public class Applicazione {
    public static void main(String[] args) {
        Articolo a = null;
        Videogame v = null;

        if (args.length > 0) {
            if (args[0].equals("Articolo") && args.length == 2) {
                a = new Articolo(Integer.parseInt(args[1]));
                System.out.println(a.toString());
            }
            else if (args[0].equals("Videogame") && args.length == 3) {
                v = new Videogame(Integer.parseInt(args[1]), args[2]);
                System.out.println(v.toString());
            }
            else {
                System.out.println("Errore: il numero di argomenti indicati non corrisponde a quelli richiesti.");
            }
        }
        else {
            System.out.println("Errore: nessun elemento specificato.");
        }
    }
}
