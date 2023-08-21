/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

/**
 *
 * @author Usuario
 */
public class MetodoPagos {
    private Integer pagoId;
private String pagoLetra;
private String pagoNombre;

    public MetodoPagos() {
    }

    public MetodoPagos(Integer pagoId, String pagoLetra, String pagoNombre) {
        this.pagoId = pagoId;
        this.pagoLetra = pagoLetra;
        this.pagoNombre = pagoNombre;
    }

    public Integer getPagoId() {
        return pagoId;
    }

    public void setPagoId(Integer pagoId) {
        this.pagoId = pagoId;
    }

    public String getPagoLetra() {
        return pagoLetra;
    }

    public void setPagoLetra(String pagoLetra) {
        this.pagoLetra = pagoLetra;
    }

    public String getPagoNombre() {
        return pagoNombre;
    }

    public void setPagoNombre(String pagoNombre) {
        this.pagoNombre = pagoNombre;
    }


}
