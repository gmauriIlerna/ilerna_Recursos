import java.util.Scanner;

public class Matrices {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int[][] matriz = new int[3][3];
        int[][] matriz2 = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

        System.out.println("Dame 9 numeros");

        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[i].length; j++) {
                matriz[i][j] = scan.nextInt();
            }
        }

        System.out.println("Te los voy a imprimir: ");

        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[i].length; j++) {
                System.out.print(matriz[i][j] + " ");
            }
        }

        System.out.println("Cambio valores:");
        matriz[0][0] = 7;
        matriz[0][1] = 8;
        matriz[0][2] = 9;
        matriz[1][0] = 10;
        matriz[1][1] = 11;
        matriz[1][2] = 12;
        matriz[2][0] = 13;
        matriz[2][1] = 14;
        matriz[2][2] = 15;

        System.out.println("Te imprimo otra vez la matriz:");
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[i].length; j++) {
                System.out.println(matriz[i][j] + " ");
            }
        }
    }
}
