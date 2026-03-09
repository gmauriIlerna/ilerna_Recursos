package controlador;

import modelo.*;

public class GestorBBDD {

    private String urlBBDD;
    private String username;
    private String password;

    public String getUrlBBDD() {
        return urlBBDD;
    }

    public void setUrlBBDD(String urlBBDD) {
        this.urlBBDD = urlBBDD;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void guardarBBDD(Partida p) {
        // TODO: implementar guardado en base de datos
    }

    public Partida cargarBBDD(int id) {
        // TODO: implementar carga desde base de datos
        return null;
    }
}