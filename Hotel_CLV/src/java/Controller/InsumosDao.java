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
public class InsumosDao {

    conexion con = new conexion();

    public List<Insumos> mostrarListaInsumos() {
        List<Insumos> insumos = new ArrayList<>();
        try {
            String sql_listaI = "SELECT * FROM hotel_clv.insumos ;";
            Statement pst = con.getConexion().prepareCall(sql_listaI);
            ResultSet rs = pst.executeQuery(sql_listaI);
            while (rs.next()) {
                Integer insuId = rs.getInt("insu_id");
                String insuNombre = rs.getString("insu_nombre");
                String insuDetalle = rs.getString("insu_detalle");
                Integer insuCantidad = rs.getInt("insu_cantidad");
                BigDecimal insuValor = rs.getBigDecimal("insu_valor");
                String insuImagen = rs.getString("insu_dimg");
                Integer estaId = rs.getInt("estados_esta_id");

                Insumos insumo = new Insumos(insuId, insuNombre, insuDetalle, insuCantidad, insuValor, insuImagen, estaId);
                insumos.add(insumo);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en InsumosDao mostrarInsumos: " + e.getMessage());

        } finally {
        }

        return insumos;
    }

    public Insumos mostrarInsumo(Integer id) {
        Insumos insumo = null;
        try {
            String sql_mostrarI = "SELECT * FROM hotel_clv.insumos WHERE insu_id =?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_mostrarI);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Integer insuId = rs.getInt("insu_id");
                String insuNombre = rs.getString("insu_nombre");
                String insuDetalle = rs.getString("insu_nombre");
                Integer insuCantidad = rs.getInt("insu_nombre");
                BigDecimal insuValor = rs.getBigDecimal("insu_valor");
                String insuImagen = rs.getString("insu_dimg");
                Integer estaId = rs.getInt("estados_esta_id");
                insumo = new Insumos(insuId, insuNombre, insuDetalle, insuCantidad, insuValor, insuImagen, estaId);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en InsumosDao mostrarInsumo: " + e.getMessage());
        } finally {
        }

        return insumo;
    }

}
