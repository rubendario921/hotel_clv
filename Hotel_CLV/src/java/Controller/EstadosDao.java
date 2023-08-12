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
 * @author Ruben Dario 921
 */
public class EstadosDao {

    conexion con = new conexion();
// Metodo para Mostrar informacion

    public List<Estados> mostrarEstados() {
        List<Estados> estados = new ArrayList<>();
        try {
            String sql = "SELECT * FROM hotel_clv.estados;";
            Statement pst = con.getConexion().prepareCall(sql);
            ResultSet rs = pst.executeQuery(sql);
            while (rs.next()) {
                int estaId = rs.getInt("esta_id");
                String estaLetra = rs.getString("esta_letra");
                String estaDescripcion = rs.getString("esta_descripcion");

                Estados estado = new Estados(estaId, estaLetra, estaDescripcion);
                estados.add(estado);
            }
            rs.close();
            pst.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return estados;
    }

    //Metodo para agregar informacion
    public void agregarEstado(Estados estado) {
        try {
            String sql = "INSERT INTO hotel_clv.estados (esta_letra, esta_descripcion) VALUES (?, ?);";
            PreparedStatement pst = con.getConexion().prepareStatement(sql);
            pst.setString(1, estado.getEstaLetra());
            pst.setString(2, estado.getEstaDescripcion());
            pst.executeUpdate();
            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
    }
}
