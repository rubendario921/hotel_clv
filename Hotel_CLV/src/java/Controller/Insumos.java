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
public class Insumos {

    private Integer insuId;
    private String insuNombre;
    private String insuDetalle;
    private Integer insuCantidad;
    private BigDecimal insuValor;
    private String insuImagen;
    private Integer estaId;

    public Insumos() {
    }

    public Insumos(Integer insuId, String insuNombre, String insuDetalle, Integer insuCantidad, BigDecimal insuValor, String insuImagen, Integer estaId) {
        this.insuId = insuId;
        this.insuNombre = insuNombre;
        this.insuDetalle = insuDetalle;
        this.insuCantidad = insuCantidad;
        this.insuValor = insuValor;
        this.insuImagen = insuImagen;
        this.estaId = estaId;
    }

    public Integer getInsuId() {
        return insuId;
    }

    public void setInsuId(Integer insuId) {
        this.insuId = insuId;
    }

    public String getInsuNombre() {
        return insuNombre;
    }

    public void setInsuNombre(String insuNombre) {
        this.insuNombre = insuNombre;
    }

    public String getInsuDetalle() {
        return insuDetalle;
    }

    public void setInsuDetalle(String insuDetalle) {
        this.insuDetalle = insuDetalle;
    }

    public Integer getInsuCantidad() {
        return insuCantidad;
    }

    public void setInsuCantidad(Integer insuCantidad) {
        this.insuCantidad = insuCantidad;
    }

    public BigDecimal getInsuValor() {
        return insuValor;
    }

    public void setInsuValor(BigDecimal insuValor) {
        this.insuValor = insuValor;
    }

    public String getInsuImagen() {
        return insuImagen;
    }

    public void setInsuImagen(String insuImagen) {
        this.insuImagen = insuImagen;
    }

    public Integer getEstaId() {
        return estaId;
    }

    public void setEstaId(Integer estaId) {
        this.estaId = estaId;
    }
    
}
