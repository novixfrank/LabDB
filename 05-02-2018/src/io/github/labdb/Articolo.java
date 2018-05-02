package io.github.labdb;

class Articolo {
    protected int id;

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
