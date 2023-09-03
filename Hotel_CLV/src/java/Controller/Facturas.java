/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 *
 * @author User
 */
public class Facturas {

    private Integer factId;
    private LocalDateTime factFEmision;
    private BigDecimal factVTotal;
    private Integer factNTransaccion;
    private Integer reservaId;
    private Integer metodoPagoId;
    private Integer personaId;
    private Integer estadoId;
    private Integer fEncabezado;

    public Facturas() {
    }

    public Facturas(Integer factId, LocalDateTime factFEmision, BigDecimal factVTotal, Integer factNTransaccion, Integer reservaId, Integer metodoPagoId, Integer personaId, Integer estadoId, Integer fEncabezado) {
        this.factId = factId;
        this.factFEmision = factFEmision;
        this.factVTotal = factVTotal;
        this.factNTransaccion = factNTransaccion;
        this.reservaId = reservaId;
        this.metodoPagoId = metodoPagoId;
        this.personaId = personaId;
        this.estadoId = estadoId;
        this.fEncabezado = fEncabezado;
    }

    public Integer getFactId() {
        return factId;
    }

    public void setFactId(Integer factId) {
        this.factId = factId;
    }

    public LocalDateTime getFactFEmision() {
        return factFEmision;
    }

    public void setFactFEmision(LocalDateTime factFEmision) {
        this.factFEmision = factFEmision;
    }

    public BigDecimal getFactVTotal() {
        return factVTotal;
    }

    public void setFactVTotal(BigDecimal factVTotal) {
        this.factVTotal = factVTotal;
    }

    public Integer getFactNTransaccion() {
        return factNTransaccion;
    }

    public void setFactNTransaccion(Integer factNTransaccion) {
        this.factNTransaccion = factNTransaccion;
    }

    public Integer getReservaId() {
        return reservaId;
    }

    public void setReservaId(Integer reservaId) {
        this.reservaId = reservaId;
    }

    public Integer getMetodoPagoId() {
        return metodoPagoId;
    }

    public void setMetodoPagoId(Integer metodoPagoId) {
        this.metodoPagoId = metodoPagoId;
    }

    public Integer getPersonaId() {
        return personaId;
    }

    public void setPersonaId(Integer personaId) {
        this.personaId = personaId;
    }

    public Integer getEstadoId() {
        return estadoId;
    }

    public void setEstadoId(Integer estadoId) {
        this.estadoId = estadoId;
    }

    public Integer getfEncabezado() {
        return fEncabezado;
    }

    public void setfEncabezado(Integer fEncabezado) {
        this.fEncabezado = fEncabezado;
    }

}
