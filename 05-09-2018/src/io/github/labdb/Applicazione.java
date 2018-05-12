package io.github.labdb;

public class Applicazione {
    public static void main(String[] args) {
        try {
            if(args.length == 2) {
                NumeroComplesso z = new NumeroComplesso(args[0], args[1]);
                
                //stampare il numero complesso, il modulo, le coordinate polari
                System.out.println("\n Numero complesso: " + z.getNumero());
                System.out.println("\n Modulo numero: " + z.modulo());
                System.out.println("\n Coordinare polari: " + z.coordinatePolari());
            }
            else {
                System.out.println("Errore: numero di argomenti non valido.");
            }
        }
        catch (NumberFormatException) {
            System.out.println("Errore: formato numerico non valido.");
        }
    }
}
