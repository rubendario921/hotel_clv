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
            String sql = "SELECT habi_id, habi_nombre, habi_tipo, habi_descripcion,habi_dimg FROM hotel_clv.habitaciones group by habi_nombre;";
            Statement pst = con.getConexion().prepareCall(sql);
            ResultSet rs = pst.executeQuery(sql);
            while (rs.next()) {
                int habiId = rs.getInt("habi_id");
                String habiNombre = rs.getString("habi_nombre");
                String habiTipo = rs.getString("habi_tipo");                
                String habiDescripcion = rs.getString("habi_descripcion");                
                String habiImg = rs.getString("habi_dimg");               

                Habitaciones habitacion = new Habitaciones(habiId, habiNombre, habiTipo, habiDescripcion, habiImg);
                habitaciones.add(habitacion);
            }
            rs.close();
            pst.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return habitaciones;
    }

    public List<Habitaciones> mostrarAdminHabi() {
        List<Habitaciones> habitaciones = new ArrayList<>();
        try {
            String sql = "SELECT * FROM hotel_clv.habitaciones; ";
            Statement pst = con.getConexion().prepareCall(sql);
            ResultSet rs = pst.executeQuery(sql);
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

        } catch (Exception e) {
            e.printStackTrace();
        }
        return habitaciones;
    }
}
