/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.*;

/**
 *
 * @author Ruben Dario
 */
public class HabitacionInsumosDao {

    conexion con = new conexion();

    public void registrarRelacion(int habiId, String[] idInsumo) {
        try {
            String sql_registro = "INSERT INTO hotel_clv.habitaciones_has_insumos (habitaciones_habi_id,insumos_insu_id) VALUES (?, ?);";
            PreparedStatement pst = con.getConexion().prepareStatement(sql_registro);

            for (String insumoId : idInsumo) {
                pst.setInt(1, habiId);
                pst.setString(2, insumoId);

                pst.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println("Error en HabitacionInsumosDao registrarRelacion: " + e.getMessage());
        }
    }

    public void modificarRelacion(int habiId, String[] idInsumo) {
        try {
            String sql_modificar ="UPDATE hotel_clv.habitaciones_has_insumos SET habitaciones_habi_id = ?, insumos_insu_id =? WHERE (`habitaciones_habi_id` = '5') and (`insumos_insu_id` = '1');";
        } catch (Exception e) {
        }
    }

}
