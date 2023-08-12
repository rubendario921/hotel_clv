/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.*;

/**
 *
 * @author Ruben Dario 921
 */
public class Validaciones {

    conexion con = new conexion();

    public int validarPersona(String correo, String usuario, String password) {
        int resultado = 0;
        try {

            String sql = "SELECT * FROM hotel_clv.personas WHERE (per_correo= ? or per_usuario=?) and per_clave = ?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql);
            pst.setString(1, correo);
            pst.setString(2, usuario);
            pst.setString(3, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                int perfil = rs.getInt("perfiles_perfil_id");
                switch (perfil) {
                    case 1:
                        resultado = 1;
                        break;
                    case 2:
                        resultado = 2;
                        break;
                    case 3:
                        resultado = 3;
                        break;
                    case 4:
                        resultado = 4;
                        break;
                }
            }
            rs.close();
            pst.close();

        } catch (Exception e) {
            System.out.println("Error al obtener la conexión: " + e.getMessage());
        } finally {
        }
        return resultado;
    }

    public String obtenerNombre(String correo, String usuario, String password) {
        String user = "";
        try {
            String sql = "SELECT * FROM hotel_clv.personas WHERE (per_correo= ? or per_usuario=?) and per_clave = ?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql);
            pst.setString(1, correo);
            pst.setString(2, usuario);
            pst.setString(3, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = rs.getString("per_nombres");
            }
            rs.close();
            pst.close();

        } catch (Exception e) {
            System.out.println("Error al obtener la conexión: " + e.getMessage());
        } finally {
        }
        return user;
    }
}
