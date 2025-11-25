
public class Moto extends Vehiculo {
	private int centimetrosCubicos;
	
	public Moto(int ruedas, double velocidadMaxima, String color, int centimetrosCubicos) {
		super(ruedas, velocidadMaxima, color);
		this.centimetrosCubicos = centimetrosCubicos;
	}

	public int getCentimetrosCubicos() {
		return centimetrosCubicos;
	}

	public void setCentimetrosCubicos(int centimetrosCubicos) {
		this.centimetrosCubicos = centimetrosCubicos;
	}
	
	@Override
	public String mostrar() {
		return super.mostrar() + " centimetros cubicos: " + this.centimetrosCubicos;
	}
	
	public void hacerCaballito() {
		System.out.println("Haciendo caballito");
	}
}
