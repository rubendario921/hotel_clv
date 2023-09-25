/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import java.util.*;
import java.sql.*;

/**
 *
 * @author Ruben Dario
 */
public class FEncabezadosDao {

    conexion con = new conexion();

    public FEncabezados MostrarFEncabezado(int id_f) {
        FEncabezados mencabezado = null;
        try {
            String sql_mostrarEncabezado = "SELECT * FROM hotel_clv.f_encabezado WHERE emp_id = ?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_mostrarEncabezado);
            pst.setInt(1, id_f);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int emp_id = rs.getInt("emp_id");
                String emp_razon_social = rs.getString("emp_razon_social");
                String emp_ruc = rs.getString("emp_ruc");
                String emp_representante_legal = rs.getString("emp_representante_legal");
                String emp_correo = rs.getString("emp_correo");
                String emp_contacto = rs.getString("emp_contacto");
                String emp_direccion = rs.getString("emp_direccion");
                mencabezado = new FEncabezados(emp_id, emp_razon_social, emp_ruc, emp_representante_legal, emp_correo, emp_contacto, emp_direccion);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en FEncabezadosDao MostrarFEncabezado: " + e.getMessage());
        } finally {
        }
        return mencabezado;
    }

}
