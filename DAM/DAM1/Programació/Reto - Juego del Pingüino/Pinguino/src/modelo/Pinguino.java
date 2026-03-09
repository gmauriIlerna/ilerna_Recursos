package modelo;

public class Pinguino extends Jugador {

    private Inventario inv;

    public Pinguino(String nombre, String color, int posicion, Inventario inventario) {
        super(nombre, color, posicion);
        this.inv = inventario;
    }

    public Inventario getInv() {
        return inv;
    }

    public void setInv(Inventario inv) {
        this.inv = inv;
    }

    public void gestionarBatalla(Pinguino p) {
        // TODO: implementar lógica de batalla
    }

    public void usarItem(Item i) {
        // TODO: implementar uso de item
    }

    public void añadirItem(Item i) {
        // TODO: implementar añadir item al inventario
    }

    public void quitarItem(Item i) {
        // TODO: implementar quitar item del inventario
    }
}