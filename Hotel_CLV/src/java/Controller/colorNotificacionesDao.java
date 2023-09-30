/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import java.sql.*;
import java.util.*;

/**
 *
 * @author User
 */
public class colorNotificacionesDao {

    conexion con = new conexion();

    public List<colorNotificaciones> mostrarListaColor() {
        List<colorNotificaciones> colornotificaciones = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.colornoti;";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int colorNId = rs.getInt("colorN_id");
                String colorNNombre = rs.getString("colorN_Nombre");
                String colorNcodigo = rs.getString("colorN_codigo");

                colorNotificaciones colorNoti = new colorNotificaciones(colorNId, colorNNombre, colorNcodigo);
                colornotificaciones.add(colorNoti);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en colorNotificacionesDao mostrarListaColor: " + e.getMessage());
        } finally {
        }
        return colornotificaciones;
    }

    public colorNotificaciones mostrarColorN(Integer id_color) {
        colorNotificaciones colorNoti = null;
        try {
            String sql_mostrar = "SELECT * FROM hotel_clv.colornoti WHERE colorN_id=?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_mostrar);
            pst.setInt(1, id_color);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int colorNId = rs.getInt("colorN_id");
                String colorNNombre = rs.getString("colorN_Nombre");
                String colorNcodigo = rs.getString("colorN_codigo");
                colorNoti = new colorNotificaciones(colorNId, colorNNombre, colorNcodigo);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en colorNotificacionesDao mostrarColorN: " + e.getMessage());
        }
        return colorNoti;
    }

    public int crearColorN(String colorNNombre, String colorNcodigo) {
        int resultado = 0;
        try {
            String sql_crear = "INSERT INTO hotel_clv.colornoti (colorN_Nombre, colorN_codigo) VALUES (?,? );";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_crear);
            pst.setString(1, colorNNombre);
            pst.setString(2, colorNcodigo);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 2;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en colorNotificacionesDao crearColorN: " + e.getMessage());
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
        }
        return resultado;
    }

    public int modificarColorN(Integer colorNId, String colorNNombre, String colorNcodigo) {
        int resultado = 0;
        try {
            String sql_modificar = "UPDATE hotel_clv.colornoti SET colorN_Nombre=?,colorN_codigo=? WHERE colorN_id=?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_modificar);
            pst.setString(1, colorNNombre);
            pst.setString(2, colorNcodigo);
            pst.setInt(3, colorNId);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en colorNotificacionesDao modificarColorN: " + e.getMessage());
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

    public int eliminarColorN(Integer colorNId) {
        int resultado = 0;
        try {
            String sql_eliminar = "DELETE FROM hotel_clv.colornoti WHERE colorN_id=? ";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_eliminar);
            pst.setInt(1, colorNId);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en colorNotificacionesDao eliminarColorN: " + e.getMessage());            
        }
        return resultado;
    }

}
