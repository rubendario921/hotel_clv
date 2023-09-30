/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import Controller.Perfiles;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Ruben Dario
 */
public class PerfilesDao {

    conexion con = new conexion();

    public List<Perfiles> mostrarListaPerfil() {
        List<Perfiles> perfiles = new ArrayList<>();
        try {
            String sql = "SELECT * FROM hotel_clv.perfiles;";
            Statement pst = con.getConexion().prepareStatement(sql);
            ResultSet rs = pst.executeQuery(sql);
            while (rs.next()) {
                int perfilId = rs.getInt("perfil_id");
                String perfilLetra = rs.getString("perfil_letra");
                String perfilNombre = rs.getString("perfil_nombre");
                int colorNotiId = rs.getInt("colorNoti_colorN_id");

                Perfiles perfil = new Perfiles(perfilId, perfilLetra, perfilNombre, colorNotiId);
                perfiles.add(perfil);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PerfilesDao mostrarLista: " + e.getMessage());
        } finally {
        }
        return perfiles;
    }

    public Perfiles mostrarPerfil(Integer id) {
        Perfiles perfil = null;
        try {
            String sql = "SELECT * FROM hotel_clv.perfiles WHERE perfil_id = ?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Integer perfilId = rs.getInt("perfil_id");
                String perfilLetra = rs.getString("perfil_letra");
                String perfilNombre = rs.getString("perfil_nombre");
                int colorNotiId = rs.getInt("colorNoti_colorN_id");
                perfil = new Perfiles(perfilId, perfilLetra, perfilNombre, colorNotiId);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en PerfilesDao mostrarPerfil: " + e.getMessage());
        } finally {
        }
        return perfil;
    }

    public int crearPerfil(String perfletra, String perfnombre, Integer perfcolorId) {
        int resultado = 0;
        try {
            String sql = "INSERT INTO hotel_clv.perfiles (perfil_letra, perfil_nombre,colorNoti_colorN_id) VALUES (?,?,?);";
            PreparedStatement pst = con.getConexion().prepareStatement(sql);
            pst.setString(1, perfletra);
            pst.setString(2, perfnombre);
            pst.setInt(3, perfcolorId);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PerfilesDao crearPerfil: " + e.getMessage());
            int SQLError = e.getErrorCode();
            switch (SQLError) {
                case 1062:
                    resultado = 1062;
                    break;
                case 1048:
                    resultado = 1048;
                    break;
                default:
                    resultado = SQLError;
                    break;
            }
        } finally {
        }
        return resultado;
    }

    public int modificarPerfil(Integer perfId, String perfletra, String perfnombre, Integer perfcolorId) {
        int resultado = 0;
        try {
            String sql = "UPDATE hotel_clv.perfiles SET perfil_letra=?,perfil_nombre=?, colorNoti_colorN_id=? WHERE perfil_id=? ;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql);
            pst.setString(1, perfletra);
            pst.setString(2, perfnombre);
            pst.setInt(3, perfcolorId);
            pst.setInt(4, perfId);

            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PerfilesDao modificarPerfil: " + e.getMessage());
            int SQLError = e.getErrorCode();
            switch (SQLError) {
                case 1062:
                    resultado = 1062;
                    break;
                case 1048:
                    resultado = 1048;
                    break;
                default:
                    resultado = SQLError;
                    break;
            }
        } finally {
        }
        return resultado;
    }

    public int eliminarPefil(Integer id) {
        int resultado = 0;
        try {
            String sql = "DELETE FROM hotel_clv.perfiles WHERE perfil_id=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PerfilesDao eliminarPerfil: " + e.getMessage());
        } finally {
        }
        return resultado;
    }
}
