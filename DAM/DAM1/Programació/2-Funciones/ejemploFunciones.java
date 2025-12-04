import java.util.Scanner;

public class ejemploFunciones {

	public static void main(String[] args) {
		/*int numero1 = 4;
		int numero2 = 5;
		
		System.out.println("Resultado: " + sumar(numero1, numero2));*/
		Scanner scan = new Scanner(System.in);
		
		System.out.println("Dame tu nombre:");
		String nombre = scan.nextLine();
		
		hola(nombre);
		
		
	
	}
	
	/*estado static tipo nombre(parametros){
	   Codigo
	}*/
	
	/*
	public static void hola(String nombre) {
		for(int i = 0; i<5; i++) {
			System.out.println("Adios mundo! " + nombre);
		}
	}*/
	
	public static void hola(String nombre) {
		for(int i = 0; i<5; i++) {
			System.out.println("Adios mundo! " + nombre);
		}
	}
	
	public static int sumar(int primero, int segundo) {

		int res = primero+segundo;
		
		return res;
	}
}
