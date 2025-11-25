package modelo;

import java.util.ArrayList;
import java.util.Random;

public class Evento extends Casilla {
	private String[] eventos = { "pez", "bolas", "rapido", "lento", "pierdeTurno", "pierdeItem", "motos" };

	public Evento(int posicion, ArrayList<Jugador> jugadoresActuales, String tipoEvento) {
		super(posicion, jugadoresActuales);
	}

	@Override
	public void realizarAccion() {
		for (Jugador j : jugadoresActuales) {
			if (j instanceof Pinguino) {
				Random ran = new Random();
				int pos = ran.nextInt(6);

				if (eventos[pos].equals("pez")) {

				} else if (eventos[pos].equals("bolas")) {

				} else if (eventos[pos].equals("rapido")) {

				} else if (eventos[pos].equals("lento")) {

				} else if (eventos[pos].equals("pierdeTurno")) {

				} else if (eventos[pos].equals("pierdeItem")) {

				} else if (eventos[pos].equals("motos")) {

				}
			}
		}
	}

}
