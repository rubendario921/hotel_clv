/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.math.BigDecimal;

/**
 *
 * @author Ruben Dario
 */
public class Habitaciones {

    private Integer habiId;
    private String habiNombre;
    private String habiTipo;
    private String habiPiso;
    private String habidepar;
    private String habidescri;
    private BigDecimal habiValorD;
    private Integer insuId;
    private Integer imgId;
    private Integer estaId;

    public Habitaciones() {
    }

    public Habitaciones(Integer habiId, String habiNombre, String habiTipo, String habiPiso, String habidepar, String habidescri, BigDecimal habiValorD, Integer insuId, Integer imgId, Integer estaId) {
        this.habiId = habiId;
        this.habiNombre = habiNombre;
        this.habiTipo = habiTipo;
        this.habiPiso = habiPiso;
        this.habidepar = habidepar;
        this.habidescri = habidescri;
        this.habiValorD = habiValorD;
        this.insuId = insuId;
        this.imgId = imgId;
        this.estaId = estaId;
    }

    public Integer getHabiId() {
        return habiId;
    }

    public void setHabiId(Integer habiId) {
        this.habiId = habiId;
    }

    public String getHabiNombre() {
        return habiNombre;
    }

    public void setHabiNombre(String habiNombre) {
        this.habiNombre = habiNombre;
    }

    public String getHabiTipo() {
        return habiTipo;
    }

    public void setHabiTipo(String habiTipo) {
        this.habiTipo = habiTipo;
    }

    public String getHabiPiso() {
        return habiPiso;
    }

    public void setHabiPiso(String habiPiso) {
        this.habiPiso = habiPiso;
    }

    public String getHabidepar() {
        return habidepar;
    }

    public void setHabidepar(String habidepar) {
        this.habidepar = habidepar;
    }

    public String getHabidescri() {
        return habidescri;
    }

    public void setHabidescri(String habidescri) {
        this.habidescri = habidescri;
    }

    public BigDecimal getHabiValorD() {
        return habiValorD;
    }

    public void setHabiValorD(BigDecimal habiValorD) {
        this.habiValorD = habiValorD;
    }

    public Integer getInsuId() {
        return insuId;
    }

    public void setInsuId(Integer insuId) {
        this.insuId = insuId;
    }

    public Integer getImgId() {
        return imgId;
    }

    public void setImgId(Integer imgId) {
        this.imgId = imgId;
    }

    public Integer getEstaId() {
        return estaId;
    }

    public void setEstaId(Integer estaId) {
        this.estaId = estaId;
    }

}
