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
 * @author Reyes
 */
public class CategoriasDao {

    conexion con = new conexion();

    public List<Categorias> mostrarListaCategorias() {
        List<Categorias> categorias = new ArrayList<>();
        try {
            String sql = "SELECT * FROM hotel_clv.categorias;";
            Statement pst = con.getConexion().prepareStatement(sql);
            ResultSet rs = pst.executeQuery(sql);
            while (rs.next()) {
                int catId = rs.getInt("cat_id");
                String catNombre = rs.getString("cat_nombre");
                String catDescripcion = rs.getString("cat_descripcion");

                Categorias categoria = new Categorias(catId, catNombre, catDescripcion);
                categorias.add(categoria);
            }
            rs.close();
            pst.close();
        } catch (Exception e) {
            System.out.println("Error en CategoriaDao mostrarListaCategorias: " + e.getMessage());
        } finally {
        }
        return categorias;
    }

}
