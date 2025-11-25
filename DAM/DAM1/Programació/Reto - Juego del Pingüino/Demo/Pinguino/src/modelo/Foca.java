package modelo;

public class Foca extends Jugador {
	private boolean soborno;
	
	public Foca(int posicion, String nombre, String color, boolean soborno) {
		super(posicion, nombre, color);
		this.soborno = soborno;
	}

	public boolean isSoborno() {
		return soborno;
	}

	public void setSoborno(boolean soborno) {
		this.soborno = soborno;
	}
	
	public void aplastarJugador(Pinguino p) {
		
	}
	
	public void golpearJugador(Pinguino p) {
		
	}

	public void esSobornado() {
		
	}
}
