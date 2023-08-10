/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

/**
 *
 * @author Ruben Dario
 */
public class perfiles {

    private Integer perfilId;
    private String perfilLetra;
    private String perfilNombre;

    public perfiles() {
    }

    public perfiles(Integer perfilId, String letra, String nombre) {
        this.perfilId = perfilId;
        this.perfilLetra = letra;
        this.perfilNombre = nombre;
    }

    public Integer getPerfilId() {
        return perfilId;
    }

    public void setPerfilId(Integer perfilId) {
        this.perfilId = perfilId;
    }

    public String getPerfilLetra() {
        return perfilLetra;
    }

    public void setPerfilLetra(String perfilLetra) {
        this.perfilLetra = perfilLetra;
    }

    public String getPerfilNombre() {
        return perfilNombre;
    }

    public void setPerfilNombre(String perfilNombre) {
        this.perfilNombre = perfilNombre;
    } 
}
