package io.github.labdb;

class Articolo {
    private int id;

    public Articolo(int id) {
        this.id = id;
    }

    public int getID() {
        return id;
    }

    public void setID(int id) {
        this.id = id;
    }

    public String toString() {
        return "Articolo: " + id + ";";
    }
}
