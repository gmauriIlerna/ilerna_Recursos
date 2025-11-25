package modular;

import java.util.Scanner;

public class menu {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String opcion = "";
		
		System.out.println("Dame opcion");
		
		opcion = scan.nextLine();
		
		if(opcion.equals("sumar")) {
			System.out.println("Dame 2 numeros:");
			int primero = scan.nextInt();
			int segundo = scan.nextInt();
			int resultado = numeros.sumar(primero, segundo);
			System.out.println("La suma es: " + resultado);
		} else if(opcion.equals("restar")) {
			System.out.println("Dame 2 numeros:");
			int primero = scan.nextInt();
			int segundo = scan.nextInt();
			int resultado = numeros.restar(primero, segundo);
			System.out.println("La resta es: " + resultado);
		}
	}
}
