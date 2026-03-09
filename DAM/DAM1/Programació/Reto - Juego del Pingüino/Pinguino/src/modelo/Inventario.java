package modelo;

import java.util.ArrayList;

public class Inventario {

    private ArrayList<Item> lista;

    public Inventario() {
        this.lista = new ArrayList<Item>();
    }

    public ArrayList<Item> getLista() {
        return lista;
    }

    public void setLista(ArrayList<Item> lista) {
        this.lista = lista;
    }
}