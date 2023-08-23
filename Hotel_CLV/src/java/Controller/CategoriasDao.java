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
            String sql_lista = "SELECT * FROM hotel_clv.categorias;";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int catId = rs.getInt("cat_id");
                String catNombre = rs.getString("cat_nombre");
                String catDescripcion = rs.getString("cat_descripcion");

                Categorias categoria = new Categorias(catId, catNombre, catDescripcion);
                categorias.add(categoria);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en CategoriasDao mostrarListaCategorias: " + e.getMessage());
        } finally {
        }
        return categorias;
    }

    public Categorias mostrarCategoria(Integer id) {
        Categorias categoria = null;
        try {
            String sql_mostrar = "SELECT * FROM hotel_clv.categorias WHERE cat_id=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_mostrar);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Integer catId = rs.getInt("cat_id");
                String catNombre = rs.getString("cat_nombre");
                String catDescripcion = rs.getString("cat_descripcion");
                categoria = new Categorias(catId, catNombre, catDescripcion);
            }
            rs.close();
            pst.close();

        } catch (Exception e) {
            System.out.println("Error en CategoriasDao mostrarListaCategorias: " + e.getMessage());
        } finally {
        }
        return categoria;
    }

    public int crearCategoria(String catNombre, String catDescripcion) {
        int resultado = 0;
        try {
            String sql_crear = "INSERT INTO hotel_clv.categorias (cat_nombre,cat_descripcion) VALUES(?,?);";
            PreparedStatement pst = con.getConexion().prepareCall(sql_crear);
            pst.setString(1, catNombre);
            pst.setString(2, catDescripcion);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en CategoriasDao crearCategoria: " + e.getMessage());
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

    int modificarCategoria(Integer catId, String catNombre, String catDescripcion) {
        int resultado = 0;
        try {
            String sql_modificar = "UPDATE hotel_clv.categorias SET cat_nombre=?,cat_descripcion=? WHERE cat_nombre=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_modificar);
            pst.setString(1, catNombre);
            pst.setString(2, catDescripcion);
            pst.setInt(3, catId);

            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en CategoriasDao modificarCategoria: " + e.getMessage());
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

    public int eliminarCategoria(Integer catId) {
        int resultado = 0;
        try {
            String sql_eliminar = "DELETE FROM hotel_clv.categorias WHERE cat_nombre=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_eliminar);
            pst.setInt(1, catId);
        } catch (SQLException e) {
            System.out.println("Error en CategoriasDao eliminarCategoria: " + e.getMessage());
        } finally {
        }
        return resultado;
    }

}
