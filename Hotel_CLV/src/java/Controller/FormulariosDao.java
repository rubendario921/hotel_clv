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
            String sql = "SELECT * FROM hotel_clv.formularios;";
            Statement pst = con.getConexion().prepareCall(sql);
            ResultSet rs = pst.executeQuery(sql);
            while (rs.next()) {
                Integer formuId = rs.getInt("formu_id");
                String formuNombre = rs.getString("formu_nombre");
                String formuCorreo = rs.getString("formu_correo");
                String formuTelefono = rs.getString("formu_telefono");
                String formuAsunto = rs.getString("formu_asunto");
                String formuMensaje = rs.getString("formu_mensaje");
                String formuCiudad = rs.getString("formu_ciudad");
                Integer estadosestaId = rs.getInt("estados_esta_id");

                Formularios formulario = new Formularios(formuId, formuNombre, formuCorreo, formuTelefono, formuAsunto, formuMensaje, formuCiudad, formuId);
                formularios.add(formulario);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PerfilesDao mostrarLista: " + e.getMessage());
        } finally {
        }
        return formularios;
    }

    public Formularios mostrarFormu(Integer id) {
        Formularios formulario = null;
        try {
            String sql = "SELECT * FROM hotel_clv.formulario WHERE formu_id = ?;";
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
            System.out.println("Error en MetodoPagosDao mostrarMetodoPago: " + e.getMessage());
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
}
