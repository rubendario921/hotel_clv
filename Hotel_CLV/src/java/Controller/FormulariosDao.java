/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Ruben Dario 921
 */
public class FormulariosDao {

    conexion con = new conexion();

    public int registrarFormu(String nombre, String correo, String telefono, String asunto, String mensaje, String ciudad) {
        int resultado = 0;
        try {
            String sql = "insert into hotel_clv.formularios (formularios.formu_nombre,formularios.formu_correo,formularios.formu_telefono,formularios.formu_asunto,formularios.formu_mensaje,formularios.formu_ciudad, formularios.estados_esta_id) values (?,?,?,?,?,?,?);";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(1, nombre);
            pst.setString(2, correo);
            pst.setString(3, telefono);
            pst.setString(4, asunto);
            pst.setString(5, mensaje);
            pst.setString(6, ciudad);
            pst.setString(7, "7");

            resultado = pst.executeUpdate();
            if (resultado > 0) {
                resultado = 1;
            }
            pst.close();
        } catch (Exception e) {
            System.out.println("Error al ingresar al formulario: " + e.getMessage());
        } finally {
        }
        return resultado;
    }
}
