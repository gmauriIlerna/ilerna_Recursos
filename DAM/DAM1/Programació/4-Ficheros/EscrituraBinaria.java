import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class EscrituraBinaria {
    public static void main(String[] args) {
        String nombreArchivo = "datos.bin";

        try {
            FileOutputStream fos = new FileOutputStream(nombreArchivo);
            DataOutputStream dos = new DataOutputStream(fos);

            dos.writeUTF("Hola, mundo!");
            dos.writeInt(42);
            dos.writeUTF("Java es genial");
            dos.writeInt(2025);

            System.out.println("Archivo binario escrito correctamente.");
            dos.close();
            fos.close();
        } catch (IOException e) {
            System.err.println("Error al escribir el archivo binario: " + e.getMessage());
        }
    }
}
