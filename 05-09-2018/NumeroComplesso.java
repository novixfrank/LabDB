package io.github.labd;

import java.lang.Math;

public class NumeroComplesso extends Number {

    private double real = 0.0d;
    private double imaginary = 0.0d;

    public NumeroComplesso(double rp, double ip) {
        real = rp;
        imaginary = ip;
    }

    public setNumero(double rp, double ip) {
        real = rp;
        imaginary = ip;
    }

    public string getNumero() {
        return real + " + " + imaginary + " * i";
    }

    public double getModulo() {
        double x = 0.0d;
        x = (Math.pow(real, 2)) + (Math.pow(imaginary, 2));

        return Math.sqrt(x);
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

    public double args() {
        return Math.atan2(imaginary, real);
    }

    public string polarCoordinate() {
        return "(" + getModulo + "," + args() + ")";
    }
}
