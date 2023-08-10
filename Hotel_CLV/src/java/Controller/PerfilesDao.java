/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import Controller.perfiles;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Ruben Dario
 */
public class PerfilesDao {

    conexion con = new conexion();

    public List<perfiles> mostrarLista() {
        List<perfiles> perfiles = new ArrayList<>();
        //String mostrar = null;
        try {
            String sql = "SELECT * FROM hotel_clv.perfiles;";
            Statement pst = con.getConexion().prepareCall(sql);
            ResultSet rs = pst.executeQuery(sql);
            while (rs.next()) {
                int perfilId = rs.getInt("perfil_id");
                String perfilLetra = rs.getString("perfil_letra");
                String perfilNombre = rs.getString("perfil_nombre");

                perfiles perfil = new perfiles(perfilId, perfilLetra, perfilNombre);
                perfiles.add(perfil);
            }
            rs.close();
            pst.close();
        } catch (Exception e) {
        }
        return perfiles;

    }

    public String crearPerfil(String letra, String nombre) {
        String nuevo = null;
        try {
            String sql = "INSERT INTO perfiles (perfil_letra,perfil_nombre) VALUES (?,?,?);";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(2, letra);
            pst.setString(3, nombre);

            int n = pst.executeUpdate();
            if (n > 0) {
                nuevo = "Registro Exitoso.";
            } else {
                nuevo = "Registro no Exitoso.";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return nuevo;
    }

}
