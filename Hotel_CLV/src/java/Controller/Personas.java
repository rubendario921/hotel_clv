/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.time.LocalDateTime;

/**
 *
 * @author Ruben Dario
 */
public class Personas {

    private Integer perId;
    private String perNombres;
    private String perApellidos;
    private Integer tipoDocumento;
    private String pernumDocumento;
    private Integer prefijosTelefono;
    private String perTelefono;
    private String perCorreo;
    private String perUsuario;
    private String perClave;
    private String perImagen;
    private LocalDateTime perFRegistro;
    private Integer perfilId;
    private Integer estaId;

    public Personas() {
    }

    public Personas(Integer perId, String perNombres, String perApellidos, Integer tipoDocumento, String pernumDocumento, Integer prefijosTelefono, String perTelefono, String perCorreo, String perUsuario, String perClave, String perImagen, LocalDateTime perFRegistro, Integer perfilId, Integer estaId) {
        this.perId = perId;
        this.perNombres = perNombres;
        this.perApellidos = perApellidos;
        this.tipoDocumento = tipoDocumento;
        this.pernumDocumento = pernumDocumento;
        this.prefijosTelefono = prefijosTelefono;
        this.perTelefono = perTelefono;
        this.perCorreo = perCorreo;
        this.perUsuario = perUsuario;
        this.perClave = perClave;
        this.perImagen = perImagen;
        this.perFRegistro = perFRegistro;
        this.perfilId = perfilId;
        this.estaId = estaId;
    }

    public Integer getPerId() {
        return perId;
    }

    public void setPerId(Integer perId) {
        this.perId = perId;
    }

    public String getPerNombres() {
        return perNombres;
    }

    public void setPerNombres(String perNombres) {
        this.perNombres = perNombres;
    }

    public String getPerApellidos() {
        return perApellidos;
    }

    public void setPerApellidos(String perApellidos) {
        this.perApellidos = perApellidos;
    }

    public Integer getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(Integer tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getPernumDocumento() {
        return pernumDocumento;
    }

    public void setPernumDocumento(String pernumDocumento) {
        this.pernumDocumento = pernumDocumento;
    }

    public Integer getPrefijosTelefono() {
        return prefijosTelefono;
    }

    public void setPrefijosTelefono(Integer prefijosTelefono) {
        this.prefijosTelefono = prefijosTelefono;
    }

    public String getPerTelefono() {
        return perTelefono;
    }

    public void setPerTelefono(String perTelefono) {
        this.perTelefono = perTelefono;
    }

    public String getPerCorreo() {
        return perCorreo;
    }

    public void setPerCorreo(String perCorreo) {
        this.perCorreo = perCorreo;
    }

    public String getPerUsuario() {
        return perUsuario;
    }

    public void setPerUsuario(String perUsuario) {
        this.perUsuario = perUsuario;
    }

    public String getPerClave() {
        return perClave;
    }

    public void setPerClave(String perClave) {
        this.perClave = perClave;
    }

    public String getPerImagen() {
        return perImagen;
    }

    public void setPerImagen(String perImagen) {
        this.perImagen = perImagen;
    }

    public LocalDateTime getPerFRegistro() {
        return perFRegistro;
    }

    public void setPerFRegistro(LocalDateTime perFRegistro) {
        this.perFRegistro = perFRegistro;
    }

    public Integer getPerfilId() {
        return perfilId;
    }

    public void setPerfilId(Integer perfilId) {
        this.perfilId = perfilId;
    }

    public Integer getEstaId() {
        return estaId;
    }

    public void setEstaId(Integer estaId) {
        this.estaId = estaId;
    }

}
