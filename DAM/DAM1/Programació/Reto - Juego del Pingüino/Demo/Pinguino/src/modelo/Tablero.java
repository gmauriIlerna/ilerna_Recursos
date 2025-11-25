package modelo;

import java.util.ArrayList;

public class Tablero {
	private ArrayList<Casilla> casillas;
	private ArrayList<Jugador> jugadores;
	private int turnos;
	private Jugador jugadorActual;
	
	public Tablero(ArrayList<Casilla> casillas, ArrayList<Jugador> jugadores, int turnos, Jugador jugadorActual) {
		super();
		this.casillas = casillas;
		this.jugadores = jugadores;
		this.turnos = turnos;
		this.jugadorActual = jugadorActual;
	}

	public ArrayList<Casilla> getCasillas() {
		return casillas;
	}
	public void setCasillas(ArrayList<Casilla> casillas) {
		this.casillas = casillas;
	}
	public ArrayList<Jugador> getJugadores() {
		return jugadores;
	}
	public void setJugadores(ArrayList<Jugador> jugadores) {
		this.jugadores = jugadores;
	}
	public int getTurnos() {
		return turnos;
	}
	public void setTurnos(int turnos) {
		this.turnos = turnos;
	}
	public Jugador getJugadorActual() {
		return jugadorActual;
	}
	public void setJugadorActual(Jugador jugadorActual) {
		this.jugadorActual = jugadorActual;
	}
	
	public void actualizarTablero() {
		
	}
	
	public void actualizarJugador(Jugador j) {
	
	}
}
