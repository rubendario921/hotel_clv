/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

/**
 *
 * @author Reyes
 */
public class Categorias {

    private Integer catId;
    private String catNombre;
    private String catDescripcion;

    public Categorias() {
    }

    public Categorias(Integer catId, String catNombre, String catDescripcion) {
        this.catId = catId;
        this.catNombre = catNombre;
        this.catDescripcion = catDescripcion;
    }

    public Integer getCatId() {
        return catId;
    }

    public void setCatId(Integer catId) {
        this.catId = catId;
    }

    public String getCatNombre() {
        return catNombre;
    }

    public void setCatNombre(String catNombre) {
        this.catNombre = catNombre;
    }

    public String getCatDescripcion() {
        return catDescripcion;
    }

    public void setCatDescripcion(String catDescripcion) {
        this.catDescripcion = catDescripcion;
    }

}
