package modelo;

import java.util.ArrayList;

public abstract class Casilla {
	protected int posicion;
	protected ArrayList<Jugador> jugadoresActuales;
	
	public Casilla(int posicion, ArrayList<Jugador> jugadoresActuales) {
		super();
		this.posicion = posicion;
		this.jugadoresActuales = jugadoresActuales;
	}

	public int getPosicion() {
		return posicion;
	}

	public void setPosicion(int posicion) {
		this.posicion = posicion;
	}

	public ArrayList<Jugador> getJugadoresActuales() {
		return jugadoresActuales;
	}

	public void setJugadoresActuales(ArrayList<Jugador> jugadoresActuales) {
		this.jugadoresActuales = jugadoresActuales;
	}
	
	public abstract void realizarAccion();
	
	public void añadirJugador(Jugador j) {
		this.jugadoresActuales.add(j);
	}
	
	public void quitarJugador(Jugador j) {
		this.jugadoresActuales.remove(j);
	}
}
