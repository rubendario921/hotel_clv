/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.*;

/**
 *
 * @author User
 */
public class FacturasDao {

    conexion con = new conexion();

    public List<Facturas> mostrarListaFacturas() {
        List<Facturas> facturas = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.facturas;";
            Statement pst = con.getConexion().prepareStatement(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                int factId = rs.getInt("fact_id");
                LocalDateTime factFEmision = rs.getTimestamp("fact_femision").toLocalDateTime();
                BigDecimal factVTotal = rs.getBigDecimal("fact_v_total");
                int factNTransaccion = rs.getInt("factu_transaccion");
                int reservaId = rs.getInt("reservas_rese_id");
                int metodoPagoId = rs.getInt("metodo_pagos_pago_id");
                Integer personaId = rs.getInt("personas_per_id");
                int estadoId = rs.getInt("estados_esta_id");
                int fEncabezado = rs.getInt("f_encabezado_emp_id");

                Facturas factura = new Facturas(factId, factFEmision, factVTotal, factNTransaccion, reservaId, metodoPagoId, personaId, estadoId, fEncabezado);
                facturas.add(factura);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en FacturasDao mostrarListaFacturas: " + e.getMessage());
        } finally {
        }
        return facturas;
    }

    public Facturas mostrarFactura(int id) {
        Facturas factura = null;
        try {
            String sql_mostrarF = "SELECT * FROM hotel_clv.facturas WHERE fact_id=? ;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_mostrarF);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int factId = rs.getInt("fact_id");
                LocalDateTime factFEmision = rs.getTimestamp("fact_femision").toLocalDateTime();
                BigDecimal factVTotal = rs.getBigDecimal("fact_v_total");
                int factNTransaccion = rs.getInt("factu_transaccion");
                int reservaId = rs.getInt("reservas_rese_id");
                int metodoPagoId = rs.getInt("metodo_pagos_pago_id");
                Integer personaId = rs.getInt("personas_per_id");
                int estadoId = rs.getInt("estados_esta_id");
                int fEncabezado = rs.getInt("f_encabezado_emp_id");

                factura = new Facturas(factId, factFEmision, factVTotal, factNTransaccion, reservaId, metodoPagoId, personaId, estadoId, fEncabezado);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en FacturasDao mostrarFactura: " + e.getMessage());
        } finally {
        }

        return factura;
    }

    public int crearFactura(LocalDateTime factFEmision, BigDecimal factVTotal, int factNTransaccion, int reservaId, int metodoPagoId, int personaId) {
        int resultado = 0;
        try {
            int fEncabezado = 1;
            String sql_estado = "SELECT esta_id FROM hotel_clv.estados WHERE esta_descripcion LIKE 'APRO%';";
            PreparedStatement pstEstado = con.getConexion().prepareStatement(sql_estado);
            ResultSet rsEstado = pstEstado.executeQuery(sql_estado);
            while (rsEstado.next()) {
                int estadoId = rsEstado.getInt("esta_id");
                String sql_crearFactu = "INSERT INTO hotel_clv.facturas (fact_femision, fact_v_total, factu_transaccion, reservas_rese_id, metodo_pagos_pago_id, personas_per_id, estados_esta_id, f_encabezado_emp_id) VALUES (?,?,?,?,?,?,?,?);";
                PreparedStatement pst = con.getConexion().prepareStatement(sql_crearFactu);
                pst.setTimestamp(1, Timestamp.valueOf(factFEmision));
                pst.setBigDecimal(2, factVTotal);
                pst.setInt(3, factNTransaccion);
                pst.setInt(4, reservaId);
                pst.setInt(5, metodoPagoId);
                pst.setInt(6, personaId);
                pst.setInt(7, estadoId);
                pst.setInt(8, fEncabezado);

                pst.close();
            }
            pstEstado.close();
            rsEstado.close();

        } catch (SQLException e) {
            System.out.println("Error en FacturasDao crearFactura: " + e.getMessage());
        }
        return resultado;
    }

    public int modificarFactura(int factId, LocalDateTime factFEmision, BigDecimal factVTotal, int factNTransaccion, int reservaId, int metodoPagoId, int personaId, int estadoId) {
        int resultado = 0;
        try {
            int fEncabezado = 1;
            String modi_factu = "UPDATE hotel_clv.facturas SET fact_femision=?, fact_v_total=?, factu_transaccion=?, reservas_rese_id=?, metodo_pagos_pago_id=?, personas_per_id=?, estados_esta_id=?, f_encabezado_emp_id=? WHERE fact_id=?;";
            PreparedStatement pst = con.getConexion().prepareStatement(modi_factu);
            pst.setTimestamp(1, Timestamp.valueOf(factFEmision));
            pst.setBigDecimal(2, factVTotal);
            pst.setInt(3, factNTransaccion);
            pst.setInt(4, reservaId);
            pst.setInt(5, metodoPagoId);
            pst.setInt(6, personaId);
            pst.setInt(7, estadoId);
            pst.setInt(8, fEncabezado);
            pst.setInt(9, factId);

            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en FacturasDao modificarFactura: " + e.getMessage());
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

    public int eliminarFactura(int id) {
        int resultado = 0;
        try {
            String sql_eliminar = "DELETE FROM hotel_clv.facturas WHERE fact_id = ?;";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_eliminar);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
        } catch (SQLException e) {
            System.out.println("Error en FacturasDao eliminarFactura: " + e.getMessage());
        } finally {
        }
        return resultado;
    }
}
