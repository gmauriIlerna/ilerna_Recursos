import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class EscrituraFicheros {
    public static void main(String[] args) {
        String nombreArchivo = "ejemplo.txt";

        try {
            FileWriter fw = new FileWriter(nombreArchivo);
            BufferedWriter bw = new BufferedWriter(fw);

            bw.write("Hola, este es un ejemplo de escritura en un archivo.");
            bw.newLine();
            bw.write("Segunda línea del archivo.");
            bw.newLine();
            bw.write("Fin del archivo.");
            System.out.println("Archivo escrito correctamente.");

            bw.close();
            fw.close();
        } catch (IOException e) {
            System.err.println("Error al escribir en el archivo: " + e.getMessage());
        }
    }
}
