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
import java.time.LocalDateTime;

/**
 *
 * @author Ruben Dario 921
 */
public class ReservasDao {

    conexion con = new conexion();

    public List<Reservas> mostrarListaReserva() {
        List<Reservas> reservas = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.reservas;";
            Statement pst = con.getConexion().prepareCall(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                Integer reseId = rs.getInt("rese_id");
                Integer numDias = rs.getInt("rese_num_dias");
                LocalDateTime reseFReserva = rs.getTimestamp("rese_f_reserva").toLocalDateTime();
                LocalDateTime reseFInicio = rs.getTimestamp("rese_f_inicio").toLocalDateTime();
                LocalDateTime reseFSalida = rs.getTimestamp("rese_f_salida").toLocalDateTime();
                BigDecimal reseVTotal = rs.getBigDecimal("rese_vtotal");
                Integer habiId = rs.getInt("habitaciones_habi_id");
                Integer estaId = rs.getInt("estados_esta_id");
                Integer periId = rs.getInt("personas_per_id");
                Integer consuiId = rs.getInt("consumos_consu_id");

                Reservas reserva = new Reservas(reseId, numDias, reseFReserva, reseFInicio, reseFSalida, reseVTotal, habiId, estaId, periId, consuiId);
                reservas.add(reserva);
            }
            rs.close();
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en ReservasDao mostrarListaReserva: " + e.getMessage());
        } finally {
        }
        return reservas;
    }

    public Reservas mostrarReserva(Integer id) {
        Reservas reserva = null;
        try {
            String sql_mostrarR = "SELECT * FROM hotel_clv.reservas WHERE rese_id=? ;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_mostrarR);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Integer reseId = rs.getInt("rese_id");
                Integer numDias = rs.getInt("rese_num_dias");
                LocalDateTime reseFReserva = rs.getTimestamp("rese_f_reserva").toLocalDateTime();
                LocalDateTime reseFInicio = rs.getTimestamp("rese_f_inicio").toLocalDateTime();
                LocalDateTime reseFSalida = rs.getTimestamp("rese_f_salida").toLocalDateTime();
                BigDecimal reseVTotal = rs.getBigDecimal("rese_vtotal");
                Integer habiId = rs.getInt("habitaciones_habi_id");
                Integer estaId = rs.getInt("estados_esta_id");
                Integer periId = rs.getInt("personas_per_id");
                Integer consuiId = rs.getInt("consumos_consu_id");

                reserva = new Reservas(reseId, numDias, reseFReserva, reseFInicio, reseFSalida, reseVTotal, habiId, estaId, periId, consuiId);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en ReservasDao mostrarReserva: " + e.getMessage());
        } finally {
        }
        return reserva;
    }

    public int crearReserva(Integer reseId, Integer numDias, LocalDateTime reseFReserva, LocalDateTime reseFInicio, LocalDateTime reseFSalida, BigDecimal reseVTotal, Integer habiId, Integer estaId, Integer periId, Integer consuiId) {
        int resultado = 0;
        try {
            String sql_crear = "INSERT INTO hotel_clv.reservas(rese_num_dias,rese_f_reserva,rese_f_inicio,rese_f_salida,rese_vtotal,habitaciones_habi_id,estados_esta_id,personas_per_id,consumos_consu_id) VALUES (?,?,?,?,?,?,?,?,?);";
            PreparedStatement pst = con.getConexion().prepareCall(sql_crear);
            pst.setInt(1, numDias);
            pst.setTimestamp(2, Timestamp.valueOf(reseFReserva));
            pst.setTimestamp(3, Timestamp.valueOf(reseFInicio));
            pst.setTimestamp(4, Timestamp.valueOf(reseFSalida));
            pst.setBigDecimal(5, reseVTotal);
            pst.setInt(6, habiId);
            pst.setInt(7, estaId);
            pst.setInt(8, periId);
            pst.setInt(9, consuiId);

            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en ReservasDao crearPersona: " + e.getMessage());
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

    public int modificarReserva(Integer reseId, Integer numDias, LocalDateTime reseFReserva, LocalDateTime reseFInicio, LocalDateTime reseFSalida, BigDecimal reseVTotal, Integer habiId, Integer estaId, Integer periId, Integer consuiId) {
        int resultado = 0;
        try {
            String sql_modificar = "UPDATE hotel_clv.reservas SET rese_num_dias=?,rese_f_reserva=?,rese_f_inicio=?,rese_f_salida=?,rese_vtotal=?,habitaciones_habi_id=?,estados_esta_id=?,personas_per_id=?,consumos_consu_id=? WHERE rese_id=?";
            PreparedStatement pst = con.getConexion().prepareCall(sql_modificar);
            pst.setInt(1, numDias);
            pst.setTimestamp(2, Timestamp.valueOf(reseFReserva));
            pst.setTimestamp(3, Timestamp.valueOf(reseFInicio));
            pst.setTimestamp(4, Timestamp.valueOf(reseFSalida));
            pst.setBigDecimal(5, reseVTotal);
            pst.setInt(6, habiId);
            pst.setInt(7, estaId);
            pst.setInt(8, periId);
            pst.setInt(9, consuiId);
            pst.setInt(10, reseId);

            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en ReservasDao modificarReserva: " + e.getMessage());
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

    public int eliminarReserva(Integer id) {
        int resultado = 0;
        try {
            String sql_eliminar = "DELETE FROM hotel_clv.reservas WHERE per_id=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_eliminar);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 2;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en ReservasDao eliminarReserva: " + e.getMessage());
        } finally {
        }
        return resultado;
    }
}
