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
        
        return factura;
    }

    public int crearFactura(int factId, LocalDateTime factFEmision, BigDecimal factVTotal, int factNTransaccion, int reservaId, int metodoPagoId, int personaId, int estadoId, int fEncabezado) {
        int resultado = 0;
        return resultado;
    }

}
