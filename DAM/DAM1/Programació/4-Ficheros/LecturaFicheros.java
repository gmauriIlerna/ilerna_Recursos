import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class LecturaFicheros {
    public static void main(String[] args) {
        String nombreArchivo = "ejemplo.txt";

        try {
            FileReader fr = new FileReader(nombreArchivo);
            BufferedReader br = new BufferedReader(fr);

            String linea;
            while ((linea = br.readLine()) != null) {
                System.out.println(linea);
            }
            br.close();
            fr.close();
        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        }
    }
}
