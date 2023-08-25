/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import Controller.Formularios;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Ruben Dario 921
 */
public class FormulariosDao {

    conexion con = new conexion();

    public List<Formularios> mostrarListaFormu() {
        List<Formularios> formularios = new ArrayList<>();
        try {
            String sql_listaF = "SELECT * FROM hotel_clv.formularios ;";
            Statement pst = con.getConexion().prepareCall(sql_listaF);
            ResultSet rs = pst.executeQuery(sql_listaF);
            while (rs.next()) {
                Integer formuId = rs.getInt("formu_id");
                String formuNombre = rs.getString("formu_nombre");
                String formuCorreo = rs.getString("formu_correo");
                String formuTelefono = rs.getString("formu_telefono");
                String formuAsunto = rs.getString("formu_asunto");
                String formuMensaje = rs.getString("formu_mensaje");
                String formuCiudad = rs.getString("formu_ciudad");
                Integer estadosestaId = rs.getInt("estados_esta_id");

                Formularios formulario = new Formularios(formuId, formuNombre, formuCorreo, formuTelefono, formuAsunto, formuMensaje, formuCiudad, estadosestaId);
                formularios.add(formulario);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en FormulariosDao mostrarFormularios: " + e.getMessage());
        } finally {
        }
        return formularios;
    }

    public Formularios mostrarFormu(Integer id) {
        Formularios formulario = null;
        try {
            String sql = "SELECT * FROM hotel_clv.formularios WHERE formu_id = ?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Integer formuId = rs.getInt("formu_id");
                String formuNombre = rs.getString("formu_nombre");
                String formuCorreo = rs.getString("formu_correo");
                String formuTelefono = rs.getString("formu_telefono");
                String formuAsunto = rs.getString("formu_asunto");
                String formuMensaje = rs.getString("formu_mensaje");
                String formuCiudad = rs.getString("formu_ciudad");
                Integer estadosestaId = rs.getInt("estados_esta_id");
                formulario = new Formularios(formuId, formuNombre, formuCorreo, formuTelefono, formuAsunto, formuMensaje, formuCiudad, id);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en FormulariosDao mostrarFormu: " + e.getMessage());
        } finally {
        }
        return formulario;
    }

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
     public int modificarFormu(Integer formu_id, String formu_nombre, String formu_correo, String formu_telefono, String formu_asunto, String formu_mensaje, String formu_ciudad, Integer estados_esta_id) {
        int resultado = 0;
        try {
            String sql = "UPDATE hotel_clv.formularios SET formu_nombre=?, formu_correo=?,formu_telefono=?,formu_asunto=?,formu_mensaje=?,formu_ciudad=?, estados_esta_id=? WHERE formu_id=? ;";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(1, formu_nombre);
            pst.setString(2, formu_correo);
            pst.setString(3, formu_telefono);
            pst.setString(4, formu_asunto);
            pst.setString(5, formu_mensaje);
            pst.setString(6, formu_ciudad);
            pst.setInt(7, estados_esta_id);
            pst.setInt(8, formu_id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error al modificar Buzón de Sugerencias: " + e.getMessage());
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
    
    
    
     public int eliminarFormularioBS(Integer id) {
        int resultado = 0;
        try {
            String sql_eliminar = "DELETE FROM hotel_clv.formularios WHERE formu_id = ?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_eliminar);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en formulariosDao eliminarFormulariosBS: " + e.getMessage());
        } finally {
        }
        return resultado;
    }
}
