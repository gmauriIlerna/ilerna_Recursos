import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Struct;
import java.util.ArrayList;
import java.util.Scanner;

public class TestMain {

	private static final String USER = "vuestroUsuario";
	private static final String PWD = "vuestraContrase�a";
	// Si est�is desde casa, la url ser� oracle.ilerna.com y no 192.168.3.26
	private static final String URL = "jdbc:oracle:thin:@192.168.3.26:1521:xe";

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = conectarBaseDatos();

		if (con != null) {
			insertarPersona(con);
			select(con);
			con.close();
		}

	}

	private static Connection conectarBaseDatos() {
		Connection con = null;

		System.out.println("Intentando conectarse a la base de datos");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PWD);
		} catch (ClassNotFoundException e) {
			System.out.println("No se ha encontrado el driver " + e);
		} catch (SQLException e) {
			System.out.println("Error en las credenciales o en la URL " + e);
		}

		System.out.println("Conectados a la base de datos");

		return con;
	}

	private static ArrayList<Persona> select(Connection con) {
		String sql = "SELECT p.* FROM PERSONA p";
		ArrayList<Persona> p = new ArrayList<Persona>();

		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			if (rs.isBeforeFirst()) {
				while (rs.next()) {
					String dni = rs.getString("DNI");
					String nombre = rs.getString("NOMBRE");

					Struct domicilio = (Struct) rs.getObject("DOMICILIO");
					Object[] valoresDireccion = domicilio.getAttributes();
					String calle = (String) valoresDireccion[0];
					String ciudad = (String) valoresDireccion[1];
					String pais = (String) valoresDireccion[2];

					Direccion direccion = new Direccion(calle, ciudad, pais);
					Persona persona = new Persona(dni, nombre, direccion);

					System.out.println(persona.toString());
					p.add(persona);				}
			} else {
				System.out.println("No he encontrado nada");
			}
			
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return p;
	}
	
	private static void insertarPersona(Connection con) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Introduce tu DNI");
		String dni = scanner.nextLine();
		
		System.out.println("Introduce tu nombre");
		String nombre = scanner.nextLine();
		
		System.out.println("Introduce tu calle");
		String calle = scanner.nextLine();
		
		System.out.println("Introduce tu ciudad");
		String ciudad = scanner.nextLine();
		
		System.out.println("Introduce tu pais");
		String pais = scanner.nextLine();
	
		String sql = "INSERT INTO PERSONA VALUES('" + dni + "', '" + nombre +
				"', DIRECCION('" + calle + "', '" + ciudad + "', '" + pais + "'))";
		
		try {
			Statement st = con.createStatement();
			st.execute(sql);
			
			System.out.println("Persona registrada correctamente");
		} catch (SQLException e) {
			System.out.println("Ha habido un error en el Insert " + e);
		}
		
		scanner.close();
		

	}

}
