import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;

public class LecturaBinaria {
    public static void main(String[] args) {
        String nombreArchivo = "datos.bin";

        try {
            FileInputStream fis = new FileInputStream(nombreArchivo);
            DataInputStream dis = new DataInputStream(fis);

            String texto1 = dis.readUTF();
            int numero1 = dis.readInt();
            String texto2 = dis.readUTF();
            int numero2 = dis.readInt();

            System.out.println("Texto 1: " + texto1);
            System.out.println("Número 1: " + numero1);
            System.out.println("Texto 2: " + texto2);
            System.out.println("Número 2: " + numero2);

            dis.close();
            fis.close();
        } catch (IOException e) {
            System.err.println("Error al leer el archivo binario: " + e.getMessage());
        }
    }
}
