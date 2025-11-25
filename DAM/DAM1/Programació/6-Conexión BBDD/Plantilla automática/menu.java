import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class menu {
	public static Connection con;

	public static void main(String[] args) {

		// Ejemplo de uso con la tabla ACTOR y las columnas NACTOR NOMBRE FECHAN
		// Si veis escrito el simbolo \ se usa para poder escribir como String ciertos
		// caracteres reservados como "" o /
		con = bbdd.conectarBaseDatos();
		System.out.println("Print");
		String[] a = { "NACTOR", "NOMBRE", "FECHAN" };
		bbdd.print(con, "SELECT * FROM ACTOR", a);
		////////////////////////////////////////////////////////////////////////////////////
		System.out.println("Insert");
		bbdd.insert(con, "INSERT INTO ACTOR (\"NACTOR\", \"NOMBRE\", \"FECHAN\")\n"
				+ "VALUES (2, 'John Doe', TO_DATE('2024-01-18', 'YYYY-MM-DD'))");
		bbdd.print(con, "SELECT * FROM ACTOR", a);
		////////////////////////////////////////////////////////////////////////////////////
		System.out.println("Update");
		bbdd.update(con, "UPDATE ACTOR\n" + "SET \"NOMBRE\" = 'New Name'\n" + "WHERE \"NACTOR\" = 2 ");
		bbdd.print(con, "SELECT * FROM ACTOR", a);
		////////////////////////////////////////////////////////////////////////////////////
		System.out.println("Delete");
		bbdd.delete(con, "DELETE FROM ACTOR\n" + "WHERE \"NACTOR\" = 2");
		bbdd.print(con, "SELECT * FROM ACTOR", a);
		////////////////////////////////////////////////////////////////////////////////////
		System.out.println("Select");
		procesamientoSelect(con, "SELECT FROM ACTOR\n" + "WHERE \"NACTOR\" = 1");
	}

	/**
	 * Funcion auxiliar para realizar select en bbdd
	 * ¡¡AVISO!! TENDREIS QUE MODIFICAR ESTA FUNCION PARA QUE SE ADAPTE A VUESTRAS COLUMNAS
	 * @param con Objeto Connection que representa la conexión a la base de datos.
	 * @param sql Sentencia SQL de consulta.
	 */
	public static void procesamientoSelect(Connection con, String sql) {
		//ResultSet contiene todas las columnas encontradas con vuestra query
		//Cada fila contendra sus columnas
		ResultSet rs = bbdd.select(con, sql);

		try {
			if (rs.isBeforeFirst()) {
				//Bucle para iterar por todos los resultados que haya encontrado en la query que habeis hecho
				//El bucle itera fila por fila, NO COLUMNA POR COLUMNA
				//Las columnas las tendreis que poner vosotros
				//El bucle finalizara solo cuando ya no hayan mas resultados
				while (rs.next()) {
					//Aqui es donde tendreis que escribir que columnas quereis seleccionar y que quereis hacer con ellas
					//En el siguiente ejemplo vamos a seleccionar las columnas NACTOR | NOMBRE | FECHAN
					//Y simplemente las guardamos en unas variables, descomenta el codigo para que funcione
					
					/*
                    int nactor = rs.getInt("NACTOR");
                    String nombre = rs.getString("NOMBRE");
                    String fechan = rs.getString("FECHAN");
                    */
				}
			} else {
				System.out.println("No se ha encontrado nada");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
