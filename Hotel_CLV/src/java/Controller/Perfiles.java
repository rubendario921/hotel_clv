/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

/**
 *
 * @author Ruben Dario 921
 */
public class Perfiles {

    private Integer perfilId;
    private String perfilLetra;
    private String perfilNombre;

    public Perfiles() {
    }

    public Perfiles(Integer perfilId, String perfilLetra, String perfilNombre) {
        this.perfilId = perfilId;
        this.perfilLetra = perfilLetra;
        this.perfilNombre = perfilNombre;
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
