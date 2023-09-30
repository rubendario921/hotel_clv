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
public class Estados {

    private Integer estaId;
    private String estaLetra;
    private String estaDescripcion;
    private Integer catId;
    private Integer colorNotiId;

    public Estados() {
    }

    public Estados(Integer estaId, String estaLetra, String estaDescripcion, Integer catId, Integer colorNotiId) {
        this.estaId = estaId;
        this.estaLetra = estaLetra;
        this.estaDescripcion = estaDescripcion;
        this.catId = catId;
        this.colorNotiId = colorNotiId;
    }

    public Integer getEstaId() {
        return estaId;
    }

    public void setEstaId(Integer estaId) {
        this.estaId = estaId;
    }

    public String getEstaLetra() {
        return estaLetra;
    }

    public void setEstaLetra(String estaLetra) {
        this.estaLetra = estaLetra;
    }

    public String getEstaDescripcion() {
        return estaDescripcion;
    }

    public void setEstaDescripcion(String estaDescripcion) {
        this.estaDescripcion = estaDescripcion;
    }

    public Integer getCatId() {
        return catId;
    }

    public void setCatId(Integer catId) {
        this.catId = catId;
    }

    public Integer getColorNotiId() {
        return colorNotiId;
    }

    public void setColorNotiId(Integer colorNotiId) {
        this.colorNotiId = colorNotiId;
    }

}
