import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Scanner;

public class menu {
	public static Connection con;
	public static ArrayList<Actor> listaActor = new ArrayList<Actor>();
	public static int nactor;
	public static String nombre;
	public static String fechan;

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		con = BBDD.conectarBaseDatos(scan);
		/////////////////////////////////////////////////////////////////////////////////
		System.out.println("Select");
		ArrayList<String> cols = new ArrayList<>();
		cols.add("NACTOR");
		cols.add("NOMBRE");
		cols.add("FECHAN");
		procesamientoSelect(con, "SELECT * FROM ACTOR\n" + "WHERE \"NACTOR\" = 1", cols);
		/////////////////////////////////////////////////////////////////////////////////
		BBDD.cerrar(con);
		/////////////////////////////////////////////////////////////////////////////////
		System.out.println("Imprimendo todos los actores de la lista:");
		for (Actor actor : listaActor) {
			System.out.println(actor.toString());
		}
	}

	/**
	 * Función auxiliar para realizar un SELECT en la BBDD y transformar los
	 * resultados en objetos Actor.
	 * 
	 * IMPORTANTE: - BBDD.select() devuelve una lista de filas. - Cada fila es un
	 * LinkedHashMap donde: clave → nombre de columna (String) valor → valor de la
	 * columna (String)
	 * 
	 * Ejemplo de una fila devuelta: { "NACTOR"="1", "NOMBRE"="Brad Pitt",
	 * "FECHAN"="1963-12-18" }
	 * 
	 * Lo que hacemos aquí es: 1. Ejecutar el SELECT 2. Recorrer cada fila devuelta
	 * 3. Procesar cada columna de la fila 4. Construir un objeto Actor con esos
	 * datos 5. Guardarlo en la lista de actores
	 * 
	 * @param con      Conexión a la base de datos.
	 * @param sql      Consulta SQL a ejecutar.
	 * @param columnas Lista de columnas que queremos leer del SELECT.
	 */
	public static void procesamientoSelect(Connection con, String sql, ArrayList<String> columnas) {

		// Ejecuta el SELECT usando la plantilla BBDD.
		// Devuelve una lista de filas.
		ArrayList<LinkedHashMap<String, String>> filas = BBDD.select(con, sql);

		// Si no hay resultados, informamos al usuario.
		if (filas.isEmpty()) {
			System.out.println("No se ha encontrado nada");
		} else {

			// Recorremos cada fila del resultado del SELECT
			for (LinkedHashMap<String, String> fila : filas) {

				// Para cada fila recorremos las columnas que queremos leer
				for (String col : columnas) {

					// Obtenemos el valor de la columna actual
					String valor = fila.get(col);

					// Si no existe la columna o es null avisamos
					if (valor == null) {
						System.out.println("Aviso: la columna '" + col + "' no existe en el SELECT o no tiene valor.");
					} else {
						// Enviamos el valor a una función que decide qué hacer con él
						// (convertirlo a int, guardarlo en variable, etc.)
						procesarValor(col, valor);
					}
				}

				// Cuando ya hemos procesado todas las columnas de la fila,
				// las variables nactor, nombre y fechan ya tienen valores.
				// Con esos datos creamos un objeto Actor.
				listaActor.add(new Actor(nactor, nombre, fechan));
			}
		}
	}

	/**
	 * Esta función decide qué hacer con cada valor recuperado del SELECT.
	 * 
	 * La función recibe: - col → nombre de la columna ("NACTOR", "NOMBRE", etc.) -
	 * valor → valor de esa columna en formato String
	 * 
	 * Dependiendo de la columna: - Convertimos el tipo si es necesario - Guardamos
	 * el valor en una variable global
	 * 
	 * Estas variables se usan después para construir el objeto Actor.
	 * 
	 * IMPORTANTE: En un proyecto real usaríamos un objeto directamente en vez de
	 * variables globales, pero aquí lo hacemos así para simplificar el ejemplo.
	 */
	public static void procesarValor(String col, String valor) {

		// Si la columna es NACTOR → convertir a entero
		if (col.equals("NACTOR")) {
			nactor = Integer.parseInt(valor); // String → int
		}

		// Si la columna es NOMBRE → guardar directamente
		else if (col.equals("NOMBRE")) {
			nombre = valor;
		}

		// Si la columna es FECHAN → guardar directamente
		else if (col.equals("FECHAN")) {
			fechan = valor;
		}
	}

}