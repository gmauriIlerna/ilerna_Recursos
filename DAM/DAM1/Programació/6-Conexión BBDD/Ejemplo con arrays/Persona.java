
public class Persona {

	private String dni;
	private String nombre;
	private Direccion domicilio;
	
	public Persona(String dni, String nombre, Direccion domicilio) {
		super();
		this.dni = dni;
		this.nombre = nombre;
		this.domicilio = domicilio;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Direccion getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(Direccion domicilio) {
		this.domicilio = domicilio;
	}

	@Override
	public String toString() {
		return "Persona [dni=" + dni + ", nombre=" + nombre + ", domicilio=" + domicilio.toString() + "]";
	}

	
	
	
}
