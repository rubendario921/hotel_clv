/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import java.math.BigDecimal;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Ruben Dario
 */
public class ConsumosDao {

    conexion con = new conexion();

    public List<Consumos> mostrarListaConsumos() {
        List<Consumos> consumos = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.consumos;";
            Statement pst = con.getConexion().prepareCall(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                Integer consuId = rs.getInt("consu_id");
                String consuNombre = rs.getString("consu_nombre");
                String consuDetalle = rs.getString("consu_detalle");
                Integer consuCantidad = rs.getInt("consu_cantidad");
                BigDecimal consuValor = rs.getBigDecimal("consu_valor");
                String consuImagen = rs.getString("consu_dimg");
                Integer estaId = rs.getInt("estados_esta_id");

                Consumos consumo = new Consumos(consuId, consuNombre, consuDetalle, consuCantidad, consuValor, consuImagen, estaId);
                consumos.add(consumo);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en ConsumosDao mostrarListaConsumos: " + e.getMessage());
        }
        return consumos;
    }

    public Consumos mostrarConsumo(Integer consu_id) {
        Consumos consumo = null;
        try {
            String sql_mostrar = "SELECT * FROM hotel_clv.consumos WHERE consu_id=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_mostrar);
            pst.setInt(1, consu_id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Integer consuId = rs.getInt("consu_id");
                String consuNombre = rs.getString("consu_nombre");
                String consuDetalle = rs.getString("consu_detalle");
                Integer consuCantidad = rs.getInt("consu_cantidad");
                BigDecimal consuValor = rs.getBigDecimal("consu_valor");
                String consuImagen = rs.getString("consu_dimg");
                Integer estaId = rs.getInt("estados_esta_id");

                consumo = new Consumos(consuId, consuNombre, consuDetalle, consuCantidad, consuValor, consuImagen, estaId);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en ConsumosDao mostrarConsumo: " + e.getMessage());
        } finally {
        }
        return consumo;
    }

    public int crearConsumo(String consuNombre, String consuDetalle, Integer consuCantidad, BigDecimal consuValor, String consuImagen, Integer estaId) {
        int resultado = 0;
        try {
            String sql_crear = "INSERT INTO hotel_clv.consumos (consu_nombre,consu_detalle,consu_cantidad,consu_valor,consu_dimg,estados_esta_id) VALUES (?,?,?,?,?,?); ";
            PreparedStatement pst = con.getConexion().prepareCall(sql_crear);
            pst.setString(1, consuNombre);
            pst.setString(2, consuDetalle);
            pst.setInt(3, consuCantidad);
            pst.setBigDecimal(4, consuValor);
            pst.setString(5, consuImagen);
            pst.setInt(6, estaId);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en ConsumosDao crearConsumo: " + e.getMessage());
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

    public int modiConsumo(Integer consuId, String consuNombre, String consuDetalle, Integer consuCantidad, BigDecimal consuValor, String consuImagen, Integer estaId) {
        int resultado = 0;
        try {
            String sql_crear = "UPDATE hotel_clv.consumos SET consu_nombre=?,consu_detalle=?,consu_cantidad=?,consu_valor=?,consu_dimg=?,estados_esta_id=? WHERE consu_id=?";
            PreparedStatement pst = con.getConexion().prepareCall(sql_crear);
            pst.setString(1, consuNombre);
            pst.setString(2, consuDetalle);
            pst.setInt(3, consuCantidad);
            pst.setBigDecimal(4, consuValor);
            pst.setString(5, consuImagen);
            pst.setInt(6, estaId);
            pst.setInt(7, consuId);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en ConsumosDao modiConsumo: " + e.getMessage());
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

    public int eliminarConsu(Integer consuId) {
        int resultado = 0;
        try {
            String sql_eliminar = "DELETE FROM hotel_clv.consumos WHERE consu_id=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_eliminar);
            pst.setInt(1, consuId);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en ConsumosDao eliminarConsu: " + e.getMessage());
        } finally {
        }
        return resultado;
    }

    //////////////////////////////////////////////////////////////////////////////////
    public BigDecimal mostrarValorConsumo(Integer consu_id) {
        BigDecimal consuValor = BigDecimal.ZERO;
        try {
            String sql_mostrar = "SELECT consu_valor FROM hotel_clv.consumos WHERE consu_id=?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_mostrar);
            pst.setInt(1, consu_id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                consuValor = rs.getBigDecimal("consu_valor");
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en ConsumosDao mostrarValorConsumo: " + e.getMessage());
        }
        return consuValor;
    }

}
