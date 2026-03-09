package controlador;

import modelo.*;

public class GestorJugador {

    public void jugadorUsaItem(String nombreItem) {
        // TODO: implementar uso de item por el jugador
    }

    public void jugadorSeMueve(Jugador j, int pasos, Tablero t) {
    	int nuevaPos = j.getPosicion()+pasos;
    	
    	if(nuevaPos > 49) {
    		nuevaPos = 49;
    	}
    	
    	if (nuevaPos < 0 ) {
    		nuevaPos = 0;
    	}
    	
    	j.setPosicion(nuevaPos);
    }

    public void jugadorFinalizaTurno(Jugador j) {
        // TODO: implementar fin de turno del jugador
    }

    public void piguinoEvento(Pinguino p) {
        // TODO: implementar evento del pingüino
    }

    public void pingüinoGuerra(Pinguino p1, Pinguino p2) {
        // TODO: implementar guerra entre pingüinos
    }

    public void focaInteractua(Pinguino p, Foca f) {
        // TODO: implementar interacción con la foca
    }
}