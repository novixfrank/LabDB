package io.github.labdb;

public class Applicazione {
    public static void main(String[] args) {
    	NumeroComplesso z = null;
    	
    	if(args.length == 2) {
    		try {
    			z = new NumeroComplesso(Double.parseDouble(args[0]), Double.parseDouble(args[1]));
    		}
    		catch (NumberFormatException e) {
    			System.out.println("Errore: formato numerico non valido.\nErrore originario:");
    			e.printStackTrace();
    		}
            
            //stampare il numero complesso, il modulo, le coordinate polari
            System.out.println("\n Numero complesso: " + z.getNumero());
            System.out.println("\n Modulo numero: " + z.getModulo());
            System.out.println("\n Coordinare polari: " + z.coordinatePolari());
        }
        else {
            System.out.println("Errore: numero di argomenti non valido.");
        }
    }
}
