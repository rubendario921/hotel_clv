/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.*;
import java.util.*;

/**
 *
 * @author Ruben Dario 921
 */
public class Validaciones {

    conexion con = new conexion();

    public int validarPersona(String correo, String usuario, String password) {
        int resultado = 0;
        try {
            String sql = "SELECT * FROM hotel_clv.personas WHERE (per_correo= ? or per_usuario=?) and per_clave =?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(1, correo);
            pst.setString(2, usuario);
            pst.setString(3, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String clave_almacenada = rs.getString("per_clave");
                if (clave_almacenada.equals(password)) {
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
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error al Validar al conexión: " + e.getMessage());
        } finally {
        }
        return resultado;
    }

    public String obtenerNombre(String correo, String usuario, String password) {
        String user = "";
        try {
            String sql = "SELECT * FROM hotel_clv.personas WHERE (per_correo= ? or per_usuario=?) and per_clave = ?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(1, correo);
            pst.setString(2, usuario);
            pst.setString(3, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = rs.getString("per_nombres");
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error al obtener el nombre: " + e.getMessage());
        } finally {
        }
        return user;
    }

    public Map<String, String> obtenerNombrePerfil(String correo, String usuario, String password) {
        Map<String, String> userData = new HashMap<>();
        try {
            String sql_consulta = "SELECT * FROM hotel_clv.personas INNER JOIN hotel_clv.perfiles ON personas.perfiles_perfil_id = perfiles.perfil_id WHERE  (per_correo= ? or per_usuario=?) and per_clave = ?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_consulta);
            pst.setString(1, correo);
            pst.setString(2, usuario);
            pst.setString(3, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                String nombre = rs.getString("personas.per_nombres");
                String perfil = rs.getString("perfiles.perfil_nombre");

                userData.put("nombre", nombre);
                userData.put("perfil", perfil);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error al obtener el nombre y perfil: " + e.getMessage());
        } finally {
        }

        return userData;
    }

}
