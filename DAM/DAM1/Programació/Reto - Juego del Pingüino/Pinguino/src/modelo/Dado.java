package modelo;

import java.util.Random;

public class Dado extends Item {

    private int max;
    private int min;

    public Dado(String nombre, int cantidad, int min, int max) {
        super(nombre, cantidad);
        this.min = min;
        this.max = max;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int tirar(Random r) {
        return r.nextInt((max - min) + 1) + min;
    }
}