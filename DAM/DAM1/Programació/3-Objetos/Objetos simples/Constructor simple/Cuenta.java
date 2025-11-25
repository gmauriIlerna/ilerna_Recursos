
public class Cuenta {
	private String titular;
	private double cantidad;
	
	public Cuenta(String titular, double cantidad) {
		this.titular = titular;
		this.cantidad = cantidad;
	}

	public String getTitular() {
		return titular;
	}
	
	public void setTitular(String titular) {
		this.titular = titular;
	}
	
	public double getCantidad() {
		return cantidad;
	}
	
	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}
	
	public void mostar() {
		System.out.println("Titular: " + this.titular + " cantidad: " + this.cantidad);
	}
	
	public void ingresar(double dinero) {
		if(dinero > 0) {
			this.cantidad += dinero;
		} else {
			System.out.println("Cantidad incorrecta");
		}
	}
	
	public void retirar(double dinero) {
		if (this.cantidad > 0 && this.cantidad >= dinero) {
			this.cantidad -= dinero;
		} else {
			System.out.println("Cantidad incorrecta");
		}
	}
}
