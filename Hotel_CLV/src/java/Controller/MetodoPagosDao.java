/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import Controller.MetodoPagos;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Usuario
 */
public class MetodoPagosDao {

    conexion con = new conexion();

    public List<MetodoPagos> mostrarListaMetodoPago() {
        List<MetodoPagos> metodoPagos = new ArrayList<>();
        try {
            String sql = "SELECT * FROM hotel_clv.metodo_pagos;";
            Statement pst = con.getConexion().prepareCall(sql);
            ResultSet rs = pst.executeQuery(sql);
            while (rs.next()) {
                int pagoId = rs.getInt("pago_id");
                String pagoLetra = rs.getString("pago_letra");
                String pagoNombre = rs.getString("pago_nombre");

                MetodoPagos metodoPago = new MetodoPagos(pagoId, pagoLetra, pagoNombre);
                metodoPagos. add(metodoPago);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en MetodoPagosDao mostrarLista: " + e.getMessage());
        } finally {
        }
        return metodoPagos;
    }

    public MetodoPagos mostrarMetodopagos(Integer id) {
        MetodoPagos metodoPago = null;
        try {
            String sql = "SELECT * FROM hotel_clv.metodo_pagos WHERE pago_id = ?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Integer pagoId = rs.getInt("pago_id");
                String pagoLetra = rs.getString("pago_letra");
                String pagoNombre = rs.getString("pago_nombre");
                metodoPago = new MetodoPagos(pagoId, pagoLetra, pagoNombre);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en MetodoPagosDao mostrarMetodoPago: " + e.getMessage());
        } finally {
        }
        return metodoPago;
    }

    public int crearMetodoPagos(String letra, String nombre) {
        int resultado = 0;
        try {
            String sql = "INSERT INTO hotel_clv.metodo_pagos (pago_letra, pago_nombre) VALUES (?,?);";
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
            System.out.println("Error en MetodoPagosDao crerMetodoPagos: " + e.getMessage());
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

    public int modificarMetodoPagos(Integer id, String letra, String nombre) {
        int resultado = 0;
        try {
            String sql = "UPDATE hotel_clv.metodo_pagos SET pago_letra=?,pago_nombre=? WHERE pago_id=? ;";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(1, letra);
            pst.setString(2, nombre);
            pst.setInt(3, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en MetodoPagosDao modificarMetodoPagos: " + e.getMessage());
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

    public int eliminarMetodoPagos(Integer id) {
        int resultado = 0;
        try {
            String sql = "DELETE FROM hotel_clv.metodo_pagos WHERE pago_id=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en MetodoPagosDao eliminarMetodoPagos: " + e.getMessage());
        } finally {
        }
        return resultado;
    }
}
