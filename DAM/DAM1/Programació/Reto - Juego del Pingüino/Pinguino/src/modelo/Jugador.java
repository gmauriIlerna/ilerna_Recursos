package modelo;

public abstract class Jugador {

    private int posicion;
    private String nombre;
    private String color;

    public Jugador(String nombre, String color, int posicion) {
        this.posicion = posicion;
        this.nombre = nombre;
        this.color = color;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void moverPosicion(int p) {
        // TODO: implementar movimiento
        this.posicion += p;
    }
}