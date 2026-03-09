package modelo;

import java.util.ArrayList;
import java.util.Random;

public class Partida {

    private Tablero tablero;
    private ArrayList<Jugador> jugadores;
    private int turnos;
    private int jugadorActual;
    private boolean finalizada;
    private Jugador ganador;

    public Partida() {
        this.jugadores = new ArrayList<Jugador>();
        this.turnos = 0;
        this.jugadorActual = 0;
        this.finalizada = false;
        this.ganador = null;
        
        ArrayList<Casilla> casillas = new ArrayList<Casilla>();

	    // Posición 0: siempre vacía
	    casillas.add(new Normal(0));

	    Random rand = new Random();

	    for (int i = 1; i < 49; i++) {
	        int tipo = rand.nextInt(6); // 0-5, for 6 types

	        Casilla c;
	        switch (tipo) {
            	case 0:
            		c = new Normal(i);
                	break;
	            case 1:
	                c = new Oso(i);
	                break;
	            case 2:
	                c = new Trineo(i);
	                break;
	            case 3:
	                c = new Agujero(i);
	                break;
	            case 4:
	                c = new Evento(i);
	                break;
	            case 5:
	                c = new SueloQuebradizo(i);
	                break;
	            default:
	                c = new Normal(i);
	        }

	        casillas.add(c);
	        System.out.println("Pos " + i + " → " + c.getClass().getSimpleName());
	    }

	    // Posición 49: siempre vacía
	    casillas.add(new Normal(49));
	    
	    this.tablero = new Tablero();
	    this.tablero.setCasillas(casillas);
    }

    public Tablero getTablero() {
        return tablero;
    }

    public void setTablero(Tablero tablero) {
        this.tablero = tablero;
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

    public int getJugadorActualIndice() {
        return jugadorActual;
    }

    public void setJugadorActualIndice(int jugadorActual) {
        this.jugadorActual = jugadorActual;
    }

    public boolean isFinalizada() {
        return finalizada;
    }

    public void setFinalizada(boolean finalizada) {
        this.finalizada = finalizada;
    }

    public Jugador getGanador() {
        return ganador;
    }

    public void setGanador(Jugador ganador) {
        this.ganador = ganador;
    }

    public Jugador getJugadorActual() {
        if (jugadores == null || jugadores.isEmpty()) {
            return null;
        }
        return jugadores.get(jugadorActual);
    }
}