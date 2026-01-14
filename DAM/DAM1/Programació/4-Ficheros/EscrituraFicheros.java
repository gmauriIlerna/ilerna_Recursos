import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class EscrituraFicheros {
	public static void main(String[] args) {
		String nombreArchivo = "ejemplo.txt";
		File fichero = null;
		FileWriter fw = null;
		BufferedWriter bw = null;

		try {
			fichero = new File(nombreArchivo);
			fw = new FileWriter(fichero);
			bw = new BufferedWriter(fw);

			bw.write("Hola, este es un ejemplo de escritura en un archivo.");
			bw.newLine();
			bw.write("Segunda línea del archivo.");
			bw.newLine();
			bw.write("Fin del archivo.");
			System.out.println("Archivo escrito correctamente.");

		} catch (IOException e) {
			System.err.println("Error al escribir en el archivo: " + e.getMessage());
		} finally {
			try {
				if (null != fichero) {
					bw.close();
					fw.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
