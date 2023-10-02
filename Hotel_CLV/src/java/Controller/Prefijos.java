/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

/**
 *
 * @author Ruben Dario
 */
public class Prefijos {

    private Integer prefiId;
    private String prefiCodigo;
    private String prefiPais;

    public Prefijos() {
    }

    public Prefijos(Integer prefiId, String prefiCodigo, String prefiPais) {
        this.prefiId = prefiId;
        this.prefiCodigo = prefiCodigo;
        this.prefiPais = prefiPais;
    }

    public Integer getPrefiId() {
        return prefiId;
    }

    public void setPrefiId(Integer prefiId) {
        this.prefiId = prefiId;
    }

    public String getPrefiCodigo() {
        return prefiCodigo;
    }

    public void setPrefiCodigo(String prefiCodigo) {
        this.prefiCodigo = prefiCodigo;
    }

    public String getPrefiPais() {
        return prefiPais;
    }

    public void setPrefiPais(String prefiPais) {
        this.prefiPais = prefiPais;
    }

}
