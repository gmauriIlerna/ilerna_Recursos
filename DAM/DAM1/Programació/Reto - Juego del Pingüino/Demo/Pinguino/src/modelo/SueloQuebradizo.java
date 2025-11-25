package modelo;

import java.util.ArrayList;

public class SueloQuebradizo extends Casilla {

	public SueloQuebradizo(int posicion, ArrayList<Jugador> jugadoresActuales) {
		super(posicion, jugadoresActuales);
	}

	@Override
	public void realizarAccion() {
		for(Jugador j : jugadoresActuales) {
			if(j instanceof Pinguino) {
				if(((Pinguino) j).getInv().getLista().size() == 0) {
					
				} else if(((Pinguino) j).getInv().getLista().size() > 0 && ((Pinguino) j).getInv().getLista().size() < 5 ) {
					
				} else if(((Pinguino) j).getInv().getLista().size() > 5) {
					
				}
			}
		}
	}

}
