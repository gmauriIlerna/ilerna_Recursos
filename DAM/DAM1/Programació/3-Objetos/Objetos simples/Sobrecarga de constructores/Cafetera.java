
public class Cafetera {
	private int capacidadActual;
	private int capacidadMaxima;
	
	public Cafetera() {
		this.capacidadActual = 0;
		this.capacidadMaxima = 1000;
	}
	
	public Cafetera(int capacidadMaxima) {
		this.capacidadMaxima = capacidadMaxima;
		this.capacidadActual = capacidadMaxima;
	}
	
	public Cafetera(int capacidadActual, int capacidadMaxima) {
		this.capacidadActual = capacidadActual;
		this.capacidadMaxima = capacidadMaxima;
	}

	public int getCapacidadActual() {
		return capacidadActual;
	}
	
	public void setCapacidadActual(int capacidadActual) {
		this.capacidadActual = capacidadActual;
	}
	
	public int getCapacidadMaxima() {
		return capacidadMaxima;
	}
	
	public void setCapacidadMaxima(int capacidadMaxima) {
		this.capacidadMaxima = capacidadMaxima;
	}
	
	public void llenarCafetera() {
		this.capacidadActual = this.capacidadMaxima;
	}
	
	public void llenarTaza(int cantidad) {
		if (cantidad > this.capacidadActual) {
			this.capacidadActual -= this.capacidadActual;
		}
		else {
			this.capacidadActual -= cantidad;
		}
	}
	
	public void vaciarCafetera() {
		this.capacidadActual = 0;
	}
	
	public void agregarCafe(int cantidad) {
		this.capacidadActual += cantidad;
	}
}