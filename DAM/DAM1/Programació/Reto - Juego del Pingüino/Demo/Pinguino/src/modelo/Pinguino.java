package modelo;

public class Pinguino extends Jugador {
	private Inventario inv;

	public Pinguino(int posicion, String nombre, String color, Inventario inv) {
		super(posicion, nombre, color);
		this.inv = inv;
	}

	public Inventario getInv() {
		return inv;
	}

	public void setInv(Inventario inv) {
		this.inv = inv;
	}
	
	public void gestionarBatalla(Pinguino p) {
		
	}

	public void usarObjeto(Item i) {
		
	}
	
	public void añadirItem(Item i) {
		
	}
	
	public void quitarItem(Item i) {
		
	}
}
