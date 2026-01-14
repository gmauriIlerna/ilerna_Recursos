import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class LecturaFicheros {
    public static void main(String[] args) {
        String nombreArchivo = "ejemplo.txt";
		File fichero = null;
		FileReader fr = null;
		BufferedReader br = null;

        try {
        	fichero = new File(nombreArchivo);
            fr = new FileReader(fichero);
            br = new BufferedReader(fr);

            String linea;
            while ((linea = br.readLine()) != null) {
                System.out.println(linea);
            }
        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        }  finally {
			try {
				if (null != fichero) {
					br.close();
					fr.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
    }
}
