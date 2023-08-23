/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import java.math.BigDecimal; //Valor decimal que esta ingresado
import java.sql.*;
import java.util.*;

/**
 *
 * @author Ruben Dario 921
 */
public class HabitacionesDao {

    conexion con = new conexion();

    public List<Habitaciones> mostrarMenuHabi() {
        List<Habitaciones> habitaciones = new ArrayList<>();
        try {
            String sql_menu = "SELECT * FROM hotel_clv.habitaciones GROUP BY habi_nombre ;";//Agrupor por habitaciones (Revisar)
            Statement pst = con.getConexion().prepareCall(sql_menu);
            ResultSet rs = pst.executeQuery(sql_menu);
            while (rs.next()) {
                Integer habiId = rs.getInt("habi_id");
                String habiNombre = rs.getString("habi_nombre");
                String habiTipo = rs.getString("habi_tipo");
                String habiPiso = rs.getString("habi_piso");
                String habiDepar = rs.getString("habi_depar");
                String habiDescripcion = rs.getString("habi_descripcion");
                BigDecimal habiValorD = rs.getBigDecimal("habi_valor_diario");
                String habiImg = rs.getString("habi_dimg");
                Integer insuId = rs.getInt("insumos_insu_id");
                Integer estaId = rs.getInt("estados_esta_id");

                Habitaciones habitacion = new Habitaciones(habiId, habiNombre, habiTipo, habiPiso, habiDepar, habiDescripcion, habiValorD, habiImg, insuId, estaId);
                habitaciones.add(habitacion);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en HabitacionesDao mostrarMenuHabi: " + e.getMessage());
        }
        return habitaciones;
    }

    public List<Habitaciones> mostrarListaHabi() {
        List<Habitaciones> habitaciones = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.habitaciones; ";
            Statement pst = con.getConexion().prepareCall(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int habiId = rs.getInt("habi_id");
                String habiNombre = rs.getString("habi_nombre");
                String habiTipo = rs.getString("habi_tipo");
                String habiPiso = rs.getString("habi_piso");
                String habiDepar = rs.getString("habi_depar");
                String habiDescripcion = rs.getString("habi_descripcion");
                BigDecimal habiValorD = rs.getBigDecimal("habi_valor_diario");
                String habiImg = rs.getString("habi_dimg");
                int insuId = rs.getInt("insumos_insu_id");
                int estaId = rs.getInt("estados_esta_id");

                Habitaciones habitacion = new Habitaciones(habiId, habiNombre, habiTipo, habiPiso, habiDepar, habiDescripcion, habiValorD, habiImg, insuId, estaId);
                habitaciones.add(habitacion);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en HabitacionesDao mostrarListaHabi: " + e.getMessage());
        }
        return habitaciones;
    }

    public List<Habitaciones> mostrarListaHabiDisponible() {
        List<Habitaciones> habitaciones = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.habitaciones INNER JOIN hotel_clv.estados ON habitaciones.estados_esta_id = estados.esta_id WHERE esta_descripcion = 'DISPONIBLE';";
            Statement pst = con.getConexion().prepareCall(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int habiId = rs.getInt("habi_id");
                String habiNombre = rs.getString("habi_nombre");
                String habiTipo = rs.getString("habi_tipo");
                String habiPiso = rs.getString("habi_piso");
                String habiDepar = rs.getString("habi_depar");
                String habiDescripcion = rs.getString("habi_descripcion");
                BigDecimal habiValorD = rs.getBigDecimal("habi_valor_diario");
                String habiImg = rs.getString("habi_dimg");
                int insuId = rs.getInt("insumos_insu_id");
                int estaId = rs.getInt("estados_esta_id");

                Habitaciones habitacion = new Habitaciones(habiId, habiNombre, habiTipo, habiPiso, habiDepar, habiDescripcion, habiValorD, habiImg, insuId, estaId);
                habitaciones.add(habitacion);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en HabitacionesDao mostrarListaHabi: " + e.getMessage());
        }
        return habitaciones;
    }
    
    public Habitaciones mostrarHabi(Integer id) {
        Habitaciones habitacion = null;
        try {
            String sql_habi = "SELECT * FROM hotel_clv.habitaciones WHERE habi_id=? ;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_habi);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Integer habiId = rs.getInt("habi_id");
                String habiNombre = rs.getString("habi_nombre");
                String habiTipo = rs.getString("habi_tipo");
                String habiPiso = rs.getString("habi_piso");
                String habiDepar = rs.getString("habi_depar");
                String habiDescripcion = rs.getString("habi_descripcion");
                BigDecimal habiValorD = rs.getBigDecimal("habi_valor_diario");
                String habiImg = rs.getString("habi_dimg");
                Integer insuId = rs.getInt("insumos_insu_id");
                Integer estaId = rs.getInt("estados_esta_id");
                habitacion = new Habitaciones(habiId, habiNombre, habiTipo, habiPiso, habiDepar, habiDescripcion, habiValorD, habiImg, insuId, estaId);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en HabitacionesDao mostrarHabi: " + e.getMessage());
        } finally {
        }
        return habitacion;
    }

    public int crearHabi(String nombre, String tipo, String piso, String depar, String descripcion, BigDecimal valor, String imagen, Integer insumo, Integer estado) {
        int resultado = 0;
        try {
            String sql_crear = "INSERT INTO hotel_clv.habitaciones (habi_nombre, habi_tipo, habi_piso, habi_depar, habi_descripcion,habi_valor_diario,habi_dimg,insumos_insu_id,estados_esta_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement pst = con.getConexion().prepareCall(sql_crear);
            pst.setString(1, nombre);
            pst.setString(2, tipo);
            pst.setString(3, piso);
            pst.setString(4, depar);
            pst.setString(5, descripcion);
            pst.setBigDecimal(6, valor);
            pst.setString(7, imagen);
            pst.setInt(8, insumo);
            pst.setInt(9, estado);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en HabitacionesDao crearHabi: " + e.getMessage());
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

    public int modiHabi(Integer id, String nombre, String tipo, String piso, String depar, String descripcion, BigDecimal valor, String imagen, Integer insumo, Integer estado) {
        int resultado = 0;
        try {
            String sql_modi = "UPDATE hotel_clv.habitaciones SET habi_nombre = ?, habi_tipo =?, habi_piso = ?, habi_depar =?, habi_descripcion = ?, habi_valor_diario = ?, habi_dimg=?,insumos_insu_id=?,estados_esta_id=? WHERE habi_id = ?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_modi);
            pst.setString(1, nombre);
            pst.setString(2, tipo);
            pst.setString(3, piso);
            pst.setString(4, depar);
            pst.setString(5, descripcion);
            pst.setBigDecimal(6, valor);
            pst.setString(7, imagen);
            pst.setInt(8, insumo);
            pst.setInt(9, estado);
            pst.setInt(10, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en HabitacionesDao modiHabi: " + e.getMessage());
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

    public int eliminarHabi(Integer id) {
        int resultado = 0;
        try {
            String sql_eliminar = "DELETE FROM hotel_clv.habitaciones WHERE habi_id = ?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_eliminar);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en HabitacionesDao eliminarHabi: " + e.getMessage());
        } finally {
        }
        return resultado;
    }
}
