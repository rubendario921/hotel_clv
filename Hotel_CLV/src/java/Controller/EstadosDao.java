/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import Controller.Estados;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Ruben Dario 921
 */
public class EstadosDao {

    conexion con = new conexion();
// Metodo para Mostrar informacion

    public List<Estados> mostrarListaEstados() {
        List<Estados> estados = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.estados ORDER BY categorias_cat_id;";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int estaId = rs.getInt("esta_id");
                String estaLetra = rs.getString("esta_letra");
                String estaDescripcion = rs.getString("esta_descripcion");
                int catId = rs.getInt("categorias_cat_id");
                int colorNotiId = rs.getInt("colorNoti_colorN_id");

                Estados estado = new Estados(estaId, estaLetra, estaDescripcion, catId, colorNotiId);
                estados.add(estado);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en EstadoDao Lista mostrarEstado: " + e.getMessage());
        } finally {
        }
        return estados;
    }

    public Estados mostrarEstado(Integer id_estado) {
        Estados estado = null;
        try {
            String sql_mostrarE = "SELECT * FROM hotel_clv.estados WHERE esta_id=?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_mostrarE);
            pst.setInt(1, id_estado);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Integer estaId = rs.getInt("esta_id");
                String estaLetra = rs.getString("esta_letra");
                String estaDescri = rs.getString("esta_descripcion");
                Integer catId = rs.getInt("categorias_cat_id");
                int colorNotiId = rs.getInt("colorNoti_colorN_id");
                estado = new Estados(estaId, estaLetra, estaDescri, catId, colorNotiId);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en EstadoDao mostrarEstado: " + e.getMessage());
        } finally {
        }
        return estado;
    }

    public int crearEstado(String estaLetra, String estaDescripcion, Integer estaCateId, Integer estaColorNId) {
        int resultado = 0;
        try {
            String sql_crear = "INSERT INTO hotel_clv.estados (esta_letra, esta_descripcion,categorias_cat_id,colorNoti_colorN_id) VALUES (?,?, ?,?);";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_crear);
            pst.setString(1, estaLetra);
            pst.setString(2, estaDescripcion);
            pst.setInt(3, estaCateId);
            pst.setInt(4, estaColorNId);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en EstadoDao crearEstado: " + e.getMessage());
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

    public int modificarEstado(Integer estaId, String estaLetra, String estaDescripcion, Integer estaCateId, Integer estaColorNId) {
        int resultado = 0;
        try {
            String sql_modi = "UPDATE hotel_clv.estados SET esta_letra=?, esta_descripcion=?, categorias_cat_id=?,colorNoti_colorN_id=? WHERE esta_id=?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_modi);
            pst.setString(1, estaLetra);
            pst.setString(2, estaDescripcion);
            pst.setInt(3, estaCateId);
            pst.setInt(4, estaColorNId);
            pst.setInt(5, estaId);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en EstadoDao modificarEstado: " + e.getMessage());
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

    public int eliminarEstado(Integer id) {
        int resultado = 0;
        try {
            String sql_elim = "DELETE FROM hotel_clv.estados WHERE esta_id = ?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_elim);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }

        } catch (Exception e) {
            System.out.println("Error en EstadaDao eliminarEstado: " + e.getMessage());
        } finally {
        }
        return resultado;
    }
////////////////////////////////////////////////////////Procesos Adicionales

    public List<Estados> mostrarListaEstaPersonas() {
        List<Estados> estados = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.estados INNER JOIN hotel_clv.categorias ON estados.categorias_cat_id = categorias.cat_id WHERE cat_nombre  LIKE 'PERS%';";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int estaId = rs.getInt("esta_id");
                String estaLetra = rs.getString("esta_letra");
                String estaDescripcion = rs.getString("esta_descripcion");
                int catId = rs.getInt("categorias_cat_id");
                int estaColorNId = rs.getInt("estaColorNId");

                Estados estado = new Estados(estaId, estaLetra, estaDescripcion, catId, estaColorNId);
                estados.add(estado);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en EstadoDao Lista mostrarListaEstaPersonas: " + e.getMessage());
        } finally {
        }
        return estados;
    }

    public List<Estados> mostrarListaEstaHabitaciones() {
        List<Estados> estados = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.estados INNER JOIN hotel_clv.categorias ON estados.categorias_cat_id = categorias.cat_id WHERE cat_nombre  LIKE 'HABI%';";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int estaId = rs.getInt("esta_id");
                String estaLetra = rs.getString("esta_letra");
                String estaDescripcion = rs.getString("esta_descripcion");
                int catId = rs.getInt("categorias_cat_id");
                int estaColorNId = rs.getInt("estaColorNId");

                Estados estado = new Estados(estaId, estaLetra, estaDescripcion, catId, estaColorNId);
                estados.add(estado);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en EstadoDao Lista mostrarListaEstaHabitaciones: " + e.getMessage());
        } finally {
        }
        return estados;
    }

    public List<Estados> mostrarListaEstaProductos() {
        List<Estados> estados = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.estados INNER JOIN hotel_clv.categorias ON estados.categorias_cat_id = categorias.cat_id WHERE cat_nombre  LIKE 'PROD%';";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int estaId = rs.getInt("esta_id");
                String estaLetra = rs.getString("esta_letra");
                String estaDescripcion = rs.getString("esta_descripcion");
                int catId = rs.getInt("categorias_cat_id");
                int estaColorNId = rs.getInt("estaColorNId");

                Estados estado = new Estados(estaId, estaLetra, estaDescripcion, catId, estaColorNId);
                estados.add(estado);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en EstadoDao Lista mostrarListaEsta1: " + e.getMessage());
        } finally {
        }
        return estados;
    }

    public List<Estados> mostrarListaEstaFacturacion() {
        List<Estados> estados = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.estados INNER JOIN hotel_clv.categorias ON estados.categorias_cat_id = categorias.cat_id WHERE cat_nombre  LIKE 'FACTU%';";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int estaId = rs.getInt("esta_id");
                String estaLetra = rs.getString("esta_letra");
                String estaDescripcion = rs.getString("esta_descripcion");
                int catId = rs.getInt("categorias_cat_id");
                int estaColorNId = rs.getInt("estaColorNId");

                Estados estado = new Estados(estaId, estaLetra, estaDescripcion, catId, estaColorNId);
                estados.add(estado);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en EstadoDao Lista mostrarListaEsta1: " + e.getMessage());
        } finally {
        }
        return estados;
    }

    public List<Estados> mostrarListaEstaFormulario() {
        List<Estados> estados = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.estados INNER JOIN hotel_clv.categorias ON estados.categorias_cat_id = categorias.cat_id WHERE cat_nombre  LIKE 'FORM%';";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int estaId = rs.getInt("esta_id");
                String estaLetra = rs.getString("esta_letra");
                String estaDescripcion = rs.getString("esta_descripcion");
                int catId = rs.getInt("categorias_cat_id");
                int estaColorNId = rs.getInt("estaColorNId");               

                Estados estado = new Estados(estaId, estaLetra, estaDescripcion, catId, estaColorNId);
                estados.add(estado);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en EstadoDao Lista mostrarListaEsta1: " + e.getMessage());
        } finally {
        }
        return estados;
    }
}
