package modelo;

public class Foca extends Jugador{

    private boolean soborno;

    public Foca(String nombre, String color, int posicion) {
    	super(nombre, color, posicion);
        this.soborno = false;
    }

    public boolean isSoborno() {
        return soborno;
    }

    public void setSoborno(boolean soborno) {
        this.soborno = soborno;
    }

    public void aplastarJugador(Pinguino p) {
        // TODO: implementar aplastar jugador
    }

    public void golpearJugador(Pinguino p) {
        // TODO: implementar golpear jugador
    }

    public boolean esSobornado() {
        return soborno;
    }
}