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

    public List<Perfiles> mostrarLista() {
        List<Perfiles> perfiles = new ArrayList<>();
        try {
            String sql = "SELECT * FROM hotel_clv.perfiles;";
            Statement pst = con.getConexion().prepareCall(sql);
            ResultSet rs = pst.executeQuery(sql);
            while (rs.next()) {
                int perfilId = rs.getInt("perfil_id");
                String perfilLetra = rs.getString("perfil_letra");
                String perfilNombre = rs.getString("perfil_nombre");

                Perfiles perfil = new Perfiles(perfilId, perfilLetra, perfilNombre);
                perfiles.add(perfil);
            }
            rs.close();
            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return perfiles;
    }

    public int crearPerfil(String letra, String nombre) {
        int resultado = 0;
        try {
            String sql = "INSERT INTO hotel_clv.perfiles (perfil_letra,perfil_nombre) VALUES (?,?);";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(1, letra);
            pst.setString(2, nombre);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            int SQLError = e.getErrorCode();
            switch (SQLError) {
                case 1062:
                    resultado = 1062;
                    break;
                case 1048:
                    resultado = 1048;
                    break;
            }
        } finally {
        }
        return resultado;
    }

    public int modificarPerfil(String letra, String nombre) {
        int resultado = 0;
        try {
            String sql = "UPDATE hotel_clv.perfiles (perfil_letra,perfil_nombre) VALUES (?,?);";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(1, letra);
            pst.setString(2, nombre);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
        } catch (Exception e) {
            System.out.println("Error al ingresar al formulario: " + e.getMessage());
        } finally {
        }
        return resultado;
    }
}
