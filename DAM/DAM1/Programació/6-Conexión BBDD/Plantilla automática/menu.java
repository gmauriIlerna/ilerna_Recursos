import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Scanner;

public class menu {
	public static Connection con;

	public static void main(String[] args) {

		// Ejemplo de uso con la tabla ACTOR y las columnas NACTOR, NOMBRE y FECHAN
		// Si veis escrito el símbolo \ se usa para poder escribir como String ciertos
		// caracteres reservados como "" o /
		Scanner scan = new Scanner(System.in);
		con = BBDD.conectarBaseDatos(scan);
		System.out.println("Print");
		String[] a = { "NACTOR", "NOMBRE", "FECHAN" };
		BBDD.print(con, "SELECT * FROM ACTOR", a);
		////////////////////////////////////////////////////////////////////////////////////
		System.out.println("Insert");
		BBDD.insert(con, "INSERT INTO ACTOR (\"NACTOR\", \"NOMBRE\", \"FECHAN\")\n"
				+ "VALUES (2, 'John Doe', TO_DATE('2024-01-18', 'YYYY-MM-DD'))");
		BBDD.print(con, "SELECT * FROM ACTOR", a);
		////////////////////////////////////////////////////////////////////////////////////
		System.out.println("Update");
		BBDD.update(con, "UPDATE ACTOR\n" + "SET \"NOMBRE\" = 'New Name'\n" + "WHERE \"NACTOR\" = 2 ");
		BBDD.print(con, "SELECT * FROM ACTOR", a);
		////////////////////////////////////////////////////////////////////////////////////
		System.out.println("Delete");
		BBDD.delete(con, "DELETE FROM ACTOR\n" + "WHERE \"NACTOR\" = 2");
		BBDD.print(con, "SELECT * FROM ACTOR", a);
		////////////////////////////////////////////////////////////////////////////////////
		System.out.println("Select");
		ArrayList<String> cols = new ArrayList<>();
		cols.add("NACTOR");
		cols.add("NOMBRE");
		cols.add("FECHAN");
		procesamientoSelect(con, "SELECT * FROM ACTOR\n" + "WHERE \"NACTOR\" = 1", cols);
		////////////////////////////////////////////////////////////////////////////////////
		BBDD.cerrar(con);
	}

	/**
	 * Función auxiliar para realizar SELECT en la BBDD. ¡¡AVISO!! TENDRÉIS QUE
	 * MODIFICAR ESTA FUNCIÓN PARA QUE SE ADAPTE A VUESTRAS COLUMNAS
	 * 
	 * @param con      Objeto Connection que representa la conexión a la base de
	 *                 datos.
	 * @param sql      Sentencia SQL de consulta.
	 * @param columnas Todas las columnas que quieras seleccionar
	 */
	public static void procesamientoSelect(Connection con, String sql, ArrayList<String> columnas) {

		// Aquí hacemos el SELECT a la base de datos.
		// Lo que nos devuelve es una lista de filas.
		// Cada fila funciona como un objeto JSON:
		// columna -> valor
		ArrayList<LinkedHashMap<String, String>> filas = BBDD.select(con, sql);

		// Si la lista está vacía, significa que el SELECT no ha devuelto nada
		if (filas.isEmpty()) {
			System.out.println("No se ha encontrado nada");
		} else {

			// Recorremos los resultados fila por fila
			// (cada vuelta del bucle es UNA fila de la base de datos)
			for (LinkedHashMap<String, String> fila : filas) {

				// Recorremos solo las columnas que TÚ has decidido recuperar
				// (las columnas se pasan en el ArrayList 'columnas')
				for (String col : columnas) {

					// Obtenemos el valor de esa columna en esta fila
					// Siempre llega como String
					// MODIFICAR SI LO NECESITÁIS EJ. AGRUPAR TODOS LOS VALORES EN UN ARRAYLIST
					// VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
					String valor = fila.get(col);

					// Si esto pasa, normalmente significa que:
					// - el nombre de la columna está mal escrito
					// - o no estaba en el SELECT
					if (valor == null) {
						System.out.println("Aviso: la columna '" + col + "' no existe en el SELECT o no tiene valor.");
					} else {
						//!Función a modificar!
						//VVVVVVVVVVVVVVVVVVVVV
		                procesarValor(col, valor);
					}
				}

				// Separador visual entre filas (solo para que se vea más claro al imprimir)
				// System.out.println("----");
			}
		}
	}
	
	/**
	 * ESTA FUNCIÓN ES LA QUE TENÉIS QUE MODIFICAR VOSOTROS.
	 * Aquí decidís qué hacer con cada valor recuperado del SELECT.
	 * Puede ser del tipo que necesitéis y los parámetros de entrada que necesitéis
	 */
	public static void procesarValor(String col, String valor) {

		// ------------------------------------------------------------------
		// AQUÍ ES DONDE TIENES QUE TRABAJAR TÚ
		//
		// En este punto ya tienes, si no lo habéis modificado:
		// - el nombre de la columna (col)
		// - el valor de la columna (valor)
		//
		// Ahora puedes hacer lo que quieras con los datos:
		// - guardarlos en variables
		// - convertirlos a int, double, etc.
		// - crear objetos con ellos
		// - mostrarlos por pantalla
		// ------------------------------------------------------------------

		// Ejemplo para comprobar que funciona:
		// System.out.println(col + ": " + valor);

		// Ejemplo de conversión a número:
		// if (col.equals("NACTOR")) {
		// int nactor = Integer.parseInt(valor);
		// }

	    // Aquí poned vuestro código.
	}
}