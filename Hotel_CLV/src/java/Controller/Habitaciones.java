/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.math.BigDecimal;

/**
 *
 * @author Ruben Dario 921
 */
public class Habitaciones {
    
    private Integer habiId;
    private String habiNombre;
    private String habiTipo;
    private String habiPiso;
    private String habiDepar;
    private String habiDescripcion;
    private BigDecimal habiValorD;
    private String habiImg;
    private Integer insuId;
    private Integer estaId;

    public Habitaciones() {
    }

    public Habitaciones(Integer habiId, String habiNombre, String habiTipo, String habiPiso, String habiDepar, String habiDescripcion, BigDecimal habiValorD, String habiImg, Integer insuId, Integer estaId) {
        this.habiId = habiId;
        this.habiNombre = habiNombre;
        this.habiTipo = habiTipo;
        this.habiPiso = habiPiso;
        this.habiDepar = habiDepar;
        this.habiDescripcion = habiDescripcion;
        this.habiValorD = habiValorD;
        this.habiImg = habiImg;
        this.insuId = insuId;
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

    public String getHabiDepar() {
        return habiDepar;
    }

    public void setHabiDepar(String habiDepar) {
        this.habiDepar = habiDepar;
    }

    public String getHabiDescripcion() {
        return habiDescripcion;
    }

    public void setHabiDescripcion(String habiDescripcion) {
        this.habiDescripcion = habiDescripcion;
    }

    public BigDecimal getHabiValorD() {
        return habiValorD;
    }

    public void setHabiValorD(BigDecimal habiValorD) {
        this.habiValorD = habiValorD;
    }

    public String getHabiImg() {
        return habiImg;
    }

    public void setHabiImg(String habiImg) {
        this.habiImg = habiImg;
    }

    public Integer getInsuId() {
        return insuId;
    }

    public void setInsuId(Integer insuId) {
        this.insuId = insuId;
    }

    public Integer getEstaId() {
        return estaId;
    }

    public void setEstaId(Integer estaId) {
        this.estaId = estaId;
    }
    
    
}
