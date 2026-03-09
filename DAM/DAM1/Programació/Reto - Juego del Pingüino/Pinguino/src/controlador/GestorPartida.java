package controlador;

import java.util.Random;

import modelo.*;

public class GestorPartida {

    private Partida partida;
    private GestorTablero gestorTablero;
    private GestorJugador gestorJugador;
    private GestorBBDD gestorBBDD;
    private Random random;

    public GestorPartida() {
        this.partida = null;
        this.gestorTablero = new GestorTablero();
        this.gestorJugador = new GestorJugador();
        this.gestorBBDD = new GestorBBDD();
        this.random = new Random();
    }

    public void nuevaPartida() {
    	this.partida = new Partida();
    }

    public int tirarDado(Jugador j, Dado dadoOpcional) {
    	int resultado = dadoOpcional.tirar(random);
    	gestorJugador.jugadorSeMueve(j, resultado, this.partida.getTablero());
    	
    	return resultado;
    }

    public void ejecutarTurnoCompleto() {
        // TODO: ejecutar la lógica completa del turno
    }

    public void procesarTurnoJugador(Jugador j) {
        // TODO: procesar turno de un jugador
    }

    public void actualizarEstadoTablero() {
        // TODO: actualizar estado del tablero
    }

    public void siguienteTurno() {
        // TODO: pasar al siguiente turno
    }

    public Partida getPartida() {
        return this.partida;
    }

    public void guardarPartida() {
        // TODO: guardar la partida usando GestorBBDD
    }

    public void cargarPartida(int id) {
        // TODO: cargar partida desde BBDD
    }
}