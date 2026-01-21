import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

public class ventasErrores {
	public static float TOTAL = 0;
	public static float MAYOR_VENTA = 0;
	public static String ITEM_MAYOR = "";

	public static void main(String[] args) {
		String[] ficheros = { "ventas09.txt", "ventas10.txt" };
		new File("reportes").mkdirs();

		listarFicheros("ventas");

		for (int i = 0; i < ficheros.length; i++) {
			leerFichero("ventas/" + ficheros[i]);
		}

		System.out.println("Total: " + TOTAL);
		System.out.println("Item mayor ventas: " + ITEM_MAYOR + " con valor: " + MAYOR_VENTA);
	}

	public static void listarFicheros(String path) {
		File directory = new File(path);
		File[] files = null;

		if (!directory.exists() || !directory.isDirectory()) {
			System.out.println("Directorio no valido.");
		} else {
			files = directory.listFiles();
			if (files == null || files.length == 0) {
				System.out.println("El directorio esta vacio");
			} else {
				for (int i = 0; i < files.length; i++) {
					File file = files[i];

					if (file.isFile()) {
						System.out.println("Fichero: " + file.getName());
					} else if (file.isDirectory()) {
						System.out.println("Directorio: " + file.getName());
					}
				}
			}
		}
	}

	public static void leerFichero(String fichero) {
	    try (BufferedReader br = new BufferedReader(new FileReader(fichero))) {
	        String linea;
	        int contador = 0;

	        while ((linea = br.readLine()) != null) {
	            contador++;
	            validar(linea, fichero, contador);
	        }
	    } catch (IOException e) {
	        System.out.println("Error al leer el fichero.");
	    }
	}


	public static boolean validar(String linea, String fichero, int nLinea) {
		String[] partes = linea.split("\\|");
		String error = "";
		boolean valido = true;
		int unidades = 0;
		float precio = 0;

		// Comprobamos que hay exactamente 5 parámetros
		if (partes.length != 5) {
			error += "Número incorrecto de campos, ";
			valido = false;
		} else {

			// 1. Validar fecha (yyyy-MM-dd)
			if (!validarFecha(partes[0])) {
				error += "Formato de fecha incorrecto (yyyy-MM-dd), ";
				valido = false;
			}

			// 2. Validar unidades (entero)
			if (!validarEntero(partes[3])) {
				error += "Las unidades no son un número entero, ";
				valido = false;
			} else {
				unidades = Integer.parseInt(partes[3]);
			}

			// 3. Validar precio (decimal)
			if (!validarDecimal(partes[4])) {
				error += "El precio no es un número decimal, ";
				valido = false;
			} else {
				precio = Float.parseFloat(partes[4]);
			}
		}
		if (!valido) {
			escribirError(fichero, nLinea, linea, error);
		} else {
			float venta = precio * unidades;
			TOTAL += venta;
			if (venta > MAYOR_VENTA) {
				ITEM_MAYOR = partes[1];
				MAYOR_VENTA = venta;
			}
		}

		return valido;
	}

	private static void escribirError(String fichero, int nLinea, String contenido, String error) {
		if (error.endsWith(", ")) {
		    error = error.substring(0, error.length() - 2);
		}


		try (BufferedWriter bw = new BufferedWriter(new FileWriter("reportes/error.txt", true))) {
			bw.write(fichero + " | " + nLinea + " | " + contenido + " | " + error);
			bw.newLine();
		} catch (IOException e) {
			System.err.println("Error escribiendo en el fichero de errores: " + e.getMessage());
		}
	}

	private static boolean validarFecha(String fecha) {
		try {
			LocalDate.parse(fecha); // ISO-8601 -> yyyy-MM-dd
			return true;
		} catch (DateTimeParseException e) {
			return false;
		}
	}

	private static boolean validarEntero(String texto) {
		try {
			Integer.parseInt(texto);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	private static boolean validarDecimal(String texto) {
		try {
			Double.parseDouble(texto);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
}