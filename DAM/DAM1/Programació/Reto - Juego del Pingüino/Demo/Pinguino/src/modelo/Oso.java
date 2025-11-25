package modelo;

import java.util.ArrayList;

public class Oso extends Casilla {

	public Oso(int posicion, ArrayList<Jugador> jugadoresActuales) {
		super(posicion, jugadoresActuales);
	}

	@Override
	public void realizarAccion() {
		for (Jugador j : this.jugadoresActuales) {
			if (j instanceof Pinguino) {
				j.moverPosicion(0);
			}
		}
	}

}
