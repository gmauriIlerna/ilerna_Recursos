import java.util.Scanner;

public class Bucles {
    public static void main(String[] args) {
        Scanner scan  = new Scanner(System.in);
        int numero = 0;
        int numero2 = 0;
        int total = 0;

        System.out.println("Dame un 10 y no voy a parar hasta que me des un 10");
        numero = scan.nextInt();

        while (numero != 10) {
            System.out.println("No es 10!");
            numero = scan.nextInt();
        }

        System.out.println("Porfin es 10");

        System.out.println();
        System.out.println("Dame un numero y te lo voy a sumar 10 veces");
        numero2 = scan.nextInt();

        for(int i = 0; i < 10; i++){
            total = total+numero2;
        }

        System.out.println("Total: " + total);
    }
}
