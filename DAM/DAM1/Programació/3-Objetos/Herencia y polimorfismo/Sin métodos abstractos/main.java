import java.util.ArrayList;

public class main {
    public static void main(String[] args) {
        Coche c = new Coche(4, 200, "Rojo", 600);
        Moto m = new Moto(2, 180, "Amarillo", 125);

		/*ArrayList<Coche> coches = new ArrayList<Coche>();
		ArrayList<Moto> motos = new ArrayList<Moto>();*/

        ArrayList<Vehiculo> vehiculos = new ArrayList<Vehiculo>();

        vehiculos.add(c);
        vehiculos.add(m);

        for (Vehiculo v: vehiculos) {
            if(v instanceof Coche) {
                Coche c1 = (Coche) v;
                c1.cerrarPuertas();
            } else if (v instanceof Moto) {
                Moto m1 = (Moto) v;
                m1.hacerCaballito();
            }
        }

		/*for (int i = 0; i < vehiculos.size(); i++) {
			if(vehiculos.get(i) instanceof Coche) {
				Coche c1 = (Coche) vehiculos.get(i);

				c1.cerrarPuertas();
			} else if (vehiculos.get(i) instanceof Moto) {
				Moto m1 = (Moto) vehiculos.get(i);

				m1.hacerCaballito();
			}
		}*/

        //vehiculos.get(0).cerrarPuertas();
        //c.cerrarPuertas();
        //m.hacerCaballito();
        //pruebaC(vehiculos.get(0));
        //pruebaM(m);
    }

    public static void prueba(Vehiculo v) {
        System.out.println(v.mostrar());
    }

    public static void pruebaC(Coche c) {
        System.out.println(c.mostrar());
    }

    public static void pruebaM(Moto m) {
        System.out.println(m.mostrar());
    }
}
