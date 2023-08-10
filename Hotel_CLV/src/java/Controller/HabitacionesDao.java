/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import java.math.BigDecimal;
import java.util.*;
import java.sql.*;

/**
 *
 * @author Ruben Dario
 */
public class HabitacionesDao {

    conexion con = new conexion();

    public List<Habitaciones> mostrarhabi() {
        List<Habitaciones> habitaciones = new ArrayList<>();
        try {
            String sql = "SELECT *  FROM hotel_clv.habitaciones;";
            Statement pst = con.getConexion().prepareCall(sql);
            ResultSet rs = pst.executeQuery(sql);
            while (rs.next()) {
                int habiId = rs.getInt("habi_id");
                String habiNombre = rs.getString("habi_nombre");
                String habiTipo = rs.getString("habi_tipo");
                String habiPiso = rs.getString("habi_piso");
                String habidepar = rs.getString("habi_depar");
                String habidescri = rs.getString("habi_descripcion");
                BigDecimal habiValorD = rs.getBigDecimal("habi_valor_diario");
                int insuId = rs.getInt("insumos_insu_id");
                int imgId = rs.getInt("imagenes_img_id");
                int estaId = rs.getInt("estados_esta_id");

                Habitaciones habitacion = new Habitaciones(habiId, habiNombre, habiTipo, habiPiso, habidepar, habidescri, habiValorD, insuId, imgId, estaId);
                habitaciones.add(habitacion);

            }
            rs.close();
            pst.close();

        } catch (Exception e) {
        }
        return habitaciones;
    }
}
