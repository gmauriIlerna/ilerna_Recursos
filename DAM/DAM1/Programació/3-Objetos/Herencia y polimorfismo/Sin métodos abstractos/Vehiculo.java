
public abstract class Vehiculo {
	private int ruedas;
	private double velocidadMaxima;
	private String color;
	
	public Vehiculo(int ruedas, double velocidadMaxima, String color) {
		this.ruedas = ruedas;
		this.velocidadMaxima = velocidadMaxima;
		this.color = color;
	}

	public int getRuedas() {
		return ruedas;
	}

	public void setRuedas(int ruedas) {
		this.ruedas = ruedas;
	}

	public double getVelocidadMaxima() {
		return velocidadMaxima;
	}

	public void setVelocidadMaxima(double velocidadMaxima) {
		this.velocidadMaxima = velocidadMaxima;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	public String mostrar() {
		return "Ruedas: " + this.ruedas + " velocidad maxima: " + this.velocidadMaxima +
				" color: " + this.color;
	}
}
