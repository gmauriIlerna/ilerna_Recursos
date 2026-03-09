package modelo;

import java.util.Random;

public class Evento extends Casilla {
	private String[] eventos = { "pez", "bolas", "rapido", "lento", "pierdeTurno", "pierdeItem", "motos" };

	public Evento(int posicion) {
		super(posicion);
	}

	@Override
	public void realizarAccion() {
		Random ran = new Random();
		String evento = eventos[ran.nextInt(6)];

		if (evento.equals("pez")) {

		} else if (evento.equals("bolas")) {

		} else if (evento.equals("rapido")) {

		} else if (evento.equals("lento")) {

		} else if (evento.equals("pierdeTurno")) {

		} else if (evento.equals("pierdeItem")) {

		} else if (evento.equals("motos")) {

		}
	}
}
