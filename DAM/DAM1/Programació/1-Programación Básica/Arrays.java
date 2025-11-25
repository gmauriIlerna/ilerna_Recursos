import java.util.Scanner;

public class Arrays {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int[] array = new int[5];
        int[] array2 = {1, 2, 3, 4, 5};

        System.out.println("Dame 5 numeros");

        for (int i = 0; i < array.length; i++) {
            array[i] = scan.nextInt();
        }

        System.out.println("Te los voy a imprimir: ");

        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i] + " ");
        }

        System.out.println("Cambio valores:");
        array[0] = 7;
        array[1] = 8;
        array[2] = 9;
        array[3] = 10;
        array[4] = 11;

        System.out.println("Te imprimo otra vez el array:");
        for (int i = 0; i < array.length; i++) {
            System.out.println(array[i] + " ");
        }
    }
}
