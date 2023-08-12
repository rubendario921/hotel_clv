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
public class Formularios {

    private Integer formuId;
    private String formuNombre;
    private String formuCorreo;
    private String formuTelefono;
    private String formuAsunto;
    private String formuMensaje;
    private String formuCiudad;
    private Integer estaId;

    public Formularios() {
    }

    public Formularios(Integer formuId, String formuNombre, String formuCorreo, String formuTelefono, String formuAsunto, String formuMensaje, String formuCiudad, Integer estaId) {
        this.formuId = formuId;
        this.formuNombre = formuNombre;
        this.formuCorreo = formuCorreo;
        this.formuTelefono = formuTelefono;
        this.formuAsunto = formuAsunto;
        this.formuMensaje = formuMensaje;
        this.formuCiudad = formuCiudad;
        this.estaId = estaId;
    }

    public Integer getFormuId() {
        return formuId;
    }

    public void setFormuId(Integer formuId) {
        this.formuId = formuId;
    }

    public String getFormuNombre() {
        return formuNombre;
    }

    public void setFormuNombre(String formuNombre) {
        this.formuNombre = formuNombre;
    }

    public String getFormuCorreo() {
        return formuCorreo;
    }

    public void setFormuCorreo(String formuCorreo) {
        this.formuCorreo = formuCorreo;
    }

    public String getFormuTelefono() {
        return formuTelefono;
    }

    public void setFormuTelefono(String formuTelefono) {
        this.formuTelefono = formuTelefono;
    }

    public String getFormuAsunto() {
        return formuAsunto;
    }

    public void setFormuAsunto(String formuAsunto) {
        this.formuAsunto = formuAsunto;
    }

    public String getFormuMensaje() {
        return formuMensaje;
    }

    public void setFormuMensaje(String formuMensaje) {
        this.formuMensaje = formuMensaje;
    }

    public String getFormuCiudad() {
        return formuCiudad;
    }

    public void setFormuCiudad(String formuCiudad) {
        this.formuCiudad = formuCiudad;
    }

    public Integer getEstaId() {
        return estaId;
    }

    public void setEstaId(Integer estaId) {
        this.estaId = estaId;
    }

}
