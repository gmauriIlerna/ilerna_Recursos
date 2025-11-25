
public class Coche extends Vehiculo{
	private int caballos;
	
	public Coche(int ruedas, double velocidadMaxima, String color, int caballos) {
		super(ruedas, velocidadMaxima, color);
		this.caballos = caballos;
	}

	public int getcaballos() {
		return caballos;
	}

	public void setcaballos(int caballos) {
		this.caballos = caballos;
	}
	
	@Override
	public String mostrar() {
		return super.mostrar() + " caballos: " + this.caballos;
	}
	
	public void cerrarPuertas() {
		System.out.println("Cerrado las puertas");
	}
}
