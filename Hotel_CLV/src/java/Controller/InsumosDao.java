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

    public List<Insumos> mostrarInsumos() {
        List<Insumos> insumos = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM insumos INNER JOIN estados WHERE insumos.estados_esta_id = estados.esta_id ;";
            Statement pst = con.getConexion().prepareCall(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                Integer insuId = rs.getInt("insu_id");
                String insuNombre = rs.getString("insu_nombre");
                String insuDetalle = rs.getString("insu_detalle");
                Integer insuCantidad = rs.getInt("insu_cantidad");
                BigDecimal insuValor = rs.getBigDecimal("insu_valor");
                String insuImagen = rs.getString("insu_dimg");
                Integer estados_esta_id = rs.getInt("estados_esta_id");//Pendiente asignacion
                Integer estaId = rs.getInt("esta_id");
                String estaLetra = rs.getString("esta_letra");//Pendiente asignacion
                String estaDescripcion = rs.getString("esta_descripcion");//Pendiente asignacion

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

}
