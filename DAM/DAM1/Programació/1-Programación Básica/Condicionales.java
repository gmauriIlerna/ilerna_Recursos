import java.util.Scanner;

public class Condicionales {
    public static void main(String[] args) {
        Scanner scan_n = new Scanner(System.in);
        Scanner scan_l = new Scanner(System.in);
        int numero = 0;
        String palabra = "";

        System.out.println("Dame numero");
        numero = scan_n.nextInt();

        if(numero < 10){
            System.out.println("El numero es menor que 10");
        } else if (numero > 10 && numero < 20) {
            System.out.println("El numero es mayor que 10 pero menor que 20");
        } else {
            System.out.println("El numero es mayor que 20");
        }

        System.out.println("Dame hola o adios");
        palabra = scan_l.nextLine();

        if(palabra.equals("hola") || palabra.equals("adios")){
            System.out.println("Palabra valida");
        } else {
            System.out.println("Palabra invalida");
        }
    }
}
