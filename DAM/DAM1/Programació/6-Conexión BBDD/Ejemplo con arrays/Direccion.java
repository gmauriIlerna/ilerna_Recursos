
public class Direccion {

	private String calle;
	private String ciudad;
	private String pais;
	
	public Direccion(String calle, String ciudad, String pais) {
		super();
		this.calle = calle;
		this.ciudad = ciudad;
		this.pais = pais;
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	@Override
	public String toString() {
		return "Direccion [calle=" + calle + ", ciudad=" + ciudad + ", pais=" + pais + "]";
	}
	
	

		
}
