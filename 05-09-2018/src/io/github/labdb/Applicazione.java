package io.github.labdb;

public class Applicazione {
    public static void main(String[] args) {
        try {
            //creazione con costruttore e argomenti null
            NumeroComplesso z = new NumeroComplesso(null,null);

            if(args.length == 2) {
                //settare il numero
                z = setNumero(args[0], args[1]);
                //stampare il numero complesso, il modulo, le coordinate polari
                System.out.println("\n Numero complesso:" + getNumero);
                System.out.println("\n Modulo numero:" + getModulo);
                System.out.println("\n Coordinare polari:" + CoordinatePolari);
            }
        }
        catch (NumberFormatException) {
            System.out.println("Errore: formato numero non valido.");
        }
    }
}
