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
public class TipoDocumentos {

    private Integer docI_id;
    private String docI_letra;
    private String docI_nombre;

    public TipoDocumentos() {
    }

    public TipoDocumentos(Integer docI_id, String docI_letra, String docI_nombre) {
        this.docI_id = docI_id;
        this.docI_letra = docI_letra;
        this.docI_nombre = docI_nombre;
    }

    public Integer getDocI_id() {
        return docI_id;
    }

    public void setDocI_id(Integer docI_id) {
        this.docI_id = docI_id;
    }

    public String getDocI_letra() {
        return docI_letra;
    }

    public void setDocI_letra(String docI_letra) {
        this.docI_letra = docI_letra;
    }

    public String getDocI_nombre() {
        return docI_nombre;
    }

    public void setDocI_nombre(String docI_nombre) {
        this.docI_nombre = docI_nombre;
    }

}
