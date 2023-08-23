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
public class Consumos {

    private Integer consuId;
    private String consuNombre;
    private String consuDetalle;
    private Integer consuCantidad;
    private BigDecimal consuValor;
    private String consuImagen;
    private Integer estaId;

    public Consumos() {
    }

    public Consumos(Integer consuId, String consuNombre, String consuDetalle, Integer consuCantidad, BigDecimal consuValor, String consuImagen, Integer estaId) {
        this.consuId = consuId;
        this.consuNombre = consuNombre;
        this.consuDetalle = consuDetalle;
        this.consuCantidad = consuCantidad;
        this.consuValor = consuValor;
        this.consuImagen = consuImagen;
        this.estaId = estaId;
    }

    public Integer getConsuId() {
        return consuId;
    }

    public void setConsuId(Integer consuId) {
        this.consuId = consuId;
    }

    public String getConsuNombre() {
        return consuNombre;
    }

    public void setConsuNombre(String consuNombre) {
        this.consuNombre = consuNombre;
    }

    public String getConsuDetalle() {
        return consuDetalle;
    }

    public void setConsuDetalle(String consuDetalle) {
        this.consuDetalle = consuDetalle;
    }

    public Integer getConsuCantidad() {
        return consuCantidad;
    }

    public void setConsuCantidad(Integer consuCantidad) {
        this.consuCantidad = consuCantidad;
    }

    public BigDecimal getConsuValor() {
        return consuValor;
    }

    public void setConsuValor(BigDecimal consuValor) {
        this.consuValor = consuValor;
    }

    public String getConsuImagen() {
        return consuImagen;
    }

    public void setConsuImagen(String consuImagen) {
        this.consuImagen = consuImagen;
    }

    public Integer getEstaId() {
        return estaId;
    }

    public void setEstaId(Integer estaId) {
        this.estaId = estaId;
    }
}
