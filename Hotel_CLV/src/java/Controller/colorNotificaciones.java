/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

/**
 *
 * @author User
 */
public class colorNotificaciones {

    private Integer colorNId;
    private String colorNNombre;
    private String colorNcodigo;

    public colorNotificaciones() {
    }

    public colorNotificaciones(Integer colorNId, String colorNNombre, String colorNcodigo) {
        this.colorNId = colorNId;
        this.colorNNombre = colorNNombre;
        this.colorNcodigo = colorNcodigo;
    }

    public Integer getColorNId() {
        return colorNId;
    }

    public void setColorNId(Integer colorNId) {
        this.colorNId = colorNId;
    }

    public String getColorNNombre() {
        return colorNNombre;
    }

    public void setColorNNombre(String colorNNombre) {
        this.colorNNombre = colorNNombre;
    }

    public String getColorNcodigo() {
        return colorNcodigo;
    }

    public void setColorNcodigo(String colorNcodigo) {
        this.colorNcodigo = colorNcodigo;
    }

}
