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
public class FEncabezados {

    private Integer emp_id;
    private String emp_razon_social;
    private String emp_ruc;
    private String emp_representante_legal;
    private String emp_correo;
    private String emp_contacto;
    private String emp_direccion;

    public FEncabezados() {
    }

    public FEncabezados(Integer emp_id, String emp_razon_social, String emp_ruc, String emp_representante_legal, String emp_correo, String emp_contacto, String emp_direccion) {
        this.emp_id = emp_id;
        this.emp_razon_social = emp_razon_social;
        this.emp_ruc = emp_ruc;
        this.emp_representante_legal = emp_representante_legal;
        this.emp_correo = emp_correo;
        this.emp_contacto = emp_contacto;
        this.emp_direccion = emp_direccion;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public String getEmp_razon_social() {
        return emp_razon_social;
    }

    public void setEmp_razon_social(String emp_razon_social) {
        this.emp_razon_social = emp_razon_social;
    }

    public String getEmp_ruc() {
        return emp_ruc;
    }

    public void setEmp_ruc(String emp_ruc) {
        this.emp_ruc = emp_ruc;
    }

    public String getEmp_representante_legal() {
        return emp_representante_legal;
    }

    public void setEmp_representante_legal(String emp_representante_legal) {
        this.emp_representante_legal = emp_representante_legal;
    }

    public String getEmp_correo() {
        return emp_correo;
    }

    public void setEmp_correo(String emp_correo) {
        this.emp_correo = emp_correo;
    }

    public String getEmp_contacto() {
        return emp_contacto;
    }

    public void setEmp_contacto(String emp_contacto) {
        this.emp_contacto = emp_contacto;
    }

    public String getEmp_direccion() {
        return emp_direccion;
    }

    public void setEmp_direccion(String emp_direccion) {
        this.emp_direccion = emp_direccion;
    }
    
}
