/**
 * Modelo sencillo para representar un Actor de la tabla ACTOR.
 * 
 * Nota didáctica:
 * - FECHAN se guarda como String porque BBDD.select() usa ResultSet#getString().
 *   Según la configuración (NLS) de Oracle, el formato puede variar.
 *   Si queréis, podéis convertirlo a LocalDate cuando tengáis un formato fijo.
 */
public class Actor {
    private final int nactor;
    private final String nombre;
    private final String fechan; // formato tal cual viene de la BD

    public Actor(int nactor, String nombre, String fechan) {
        this.nactor = nactor;
        this.nombre = nombre;
        this.fechan = fechan;
    }

    public int getNactor() {
        return nactor;
    }

    public String getNombre() {
        return nombre;
    }

    public String getFechan() {
        return fechan;
    }

    @Override
    public String toString() {
        return "Actor{nactor=" + nactor + ", nombre='" + nombre + "', fechan='" + fechan + "'}";
    }
}
