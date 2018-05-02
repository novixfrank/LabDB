package io.github.labdb;

class Videogame extends Articolo {
    private String titolo;

    public Videogame(int id, String titolo) {
        super(id);
        this.titolo = titolo;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String toString() {
        return "Videogame: Codice: " + id + "; Titolo: " + titolo + ";";
    }

}
