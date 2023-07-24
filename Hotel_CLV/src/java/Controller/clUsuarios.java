/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.sql.*;
import Model.conexion;

/**
 *
 * @author Ruben Dario 921
 */
public class clUsuarios {

    ResultSet rs;
    conexion con = new conexion();

    public ResultSet listarU() {
        try {
            String sql = "SELECT * FROM personas WHERE estado 'A'";
            Statement st = con.getConexion().createStatement();
            rs = st.executeQuery(sql);
        } catch (Exception e) {
        }
        return rs;
    }

    public ResultSet listarUxID(int id) {
        try {
            String sql = "SELECT * FROM usuario WHERE id_usu=" + id;
            Statement st = con.getConexion().createStatement();
            rs = st.executeQuery(sql);
        } catch (Exception e) {
        }
        return rs;
    }

}
