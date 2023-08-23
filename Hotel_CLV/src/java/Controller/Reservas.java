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
 * @author Ruben Dario 921
 */
public class Reservas {

    private Integer reseId;
    private Integer numDias;
    private LocalDateTime reseFReserva;
    private LocalDateTime reseFInicio;
    private LocalDateTime reseFSalida;
    private BigDecimal reseVTotal;
    private Integer habiId;
    private Integer estaId;
    private Integer perId;
    private Integer consuId;

    public Reservas() {
    }

    public Reservas(Integer reseId, Integer numDias, LocalDateTime reseFReserva, LocalDateTime reseFInicio, LocalDateTime reseFSalida, BigDecimal reseVTotal, Integer habiId, Integer estaId, Integer perId, Integer consuId) {
        this.reseId = reseId;
        this.numDias = numDias;
        this.reseFReserva = reseFReserva;
        this.reseFInicio = reseFInicio;
        this.reseFSalida = reseFSalida;
        this.reseVTotal = reseVTotal;
        this.habiId = habiId;
        this.estaId = estaId;
        this.perId = perId;
        this.consuId = consuId;
    }

    public Integer getReseId() {
        return reseId;
    }

    public void setReseId(Integer reseId) {
        this.reseId = reseId;
    }

    public Integer getNumDias() {
        return numDias;
    }

    public void setNumDias(Integer numDias) {
        this.numDias = numDias;
    }

    public LocalDateTime getReseFReserva() {
        return reseFReserva;
    }

    public void setReseFReserva(LocalDateTime reseFReserva) {
        this.reseFReserva = reseFReserva;
    }

    public LocalDateTime getReseFInicio() {
        return reseFInicio;
    }

    public void setReseFInicio(LocalDateTime reseFInicio) {
        this.reseFInicio = reseFInicio;
    }

    public LocalDateTime getReseFSalida() {
        return reseFSalida;
    }

    public void setReseFSalida(LocalDateTime reseFSalida) {
        this.reseFSalida = reseFSalida;
    }

    public BigDecimal getReseVTotal() {
        return reseVTotal;
    }

    public void setReseVTotal(BigDecimal reseVTotal) {
        this.reseVTotal = reseVTotal;
    }

    public Integer getHabiId() {
        return habiId;
    }

    public void setHabiId(Integer habiId) {
        this.habiId = habiId;
    }

    public Integer getEstaId() {
        return estaId;
    }

    public void setEstaId(Integer estaId) {
        this.estaId = estaId;
    }

    public Integer getPerId() {
        return perId;
    }

    public void setPerId(Integer perId) {
        this.perId = perId;
    }

    public Integer getConsuId() {
        return consuId;
    }

    public void setConsuId(Integer consuId) {
        this.consuId = consuId;
    }
    
    
    
}
