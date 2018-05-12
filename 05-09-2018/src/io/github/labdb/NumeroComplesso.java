package io.github.labdb;

import java.lang.Math;

public class NumeroComplesso extends Number {
    private double real = 0.0d;
    private double imaginary = 0.0d;

    public NumeroComplesso(double rp, double ip) {
        real = rp;
        imaginary = ip;
    }

    public void setNumero(double rp, double ip) {
        real = rp;
        imaginary = ip;
    }

    public String getNumero() {
        return real + " + " + imaginary + " * i";
    }

    public double getModulo() {
        double x = 0.0d;
        x = (Math.pow(real, 2)) + (Math.pow(imaginary, 2));

        return Math.sqrt(x);
    }

    public double args() {
        return Math.atan2(imaginary, real);
    }

    public String coordinatePolari() {
        return "(" + getModulo() + ", " + args() + ")";
    }

    public int intValue() {
        return (int) getModulo();
    }

    public long longValue() {
        return (long) getModulo();
    }

    public float floatValue() {
        return (float) getModulo();
    }

    public double doubleValue() {
        return (double) getModulo();
    }

}
