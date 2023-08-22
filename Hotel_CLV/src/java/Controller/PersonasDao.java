/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.conexion;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.*;

/**
 *
 * @author Ruben Dario
 */
public class PersonasDao {

    conexion con = new conexion();

    public List<Personas> mostrarListaPersonas() {
        List<Personas> personas = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.personas;";
            Statement pst = con.getConexion().prepareCall(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                Integer perId = rs.getInt("per_id");
                String perNombres = rs.getString("per_nombres");
                String perApellidos = rs.getString("per_apellidos");
                String perCedula = rs.getString("per_cedula");
                String perTelefono = rs.getString("per_telefono");
                String perCorreo = rs.getString("per_correo");
                String usuario = rs.getString("per_usuario");
                String perClave = rs.getString("per_clave");
                String perImagen = rs.getString("per_dimg");
                LocalDateTime perFRegistro = rs.getTimestamp("per_fregistro").toLocalDateTime();
                Integer perfilId = rs.getInt("perfiles_perfil_id");
                Integer estaId = rs.getInt("estados_esta_id");

                Personas persona = new Personas(perId, perNombres, perApellidos, perCedula, perTelefono, perCorreo, usuario, perClave, perImagen, perFRegistro, perfilId, estaId);
                personas.add(persona);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PersonaDao mostrarListaPersonas: " + e.getMessage());
        } finally {
        }
        return personas;
    }

    public List<Personas> mostrarListaPersonasC() {
        List<Personas> personas = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.personas WHERE perfiles_perfil_id=4;";
            Statement pst = con.getConexion().prepareCall(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                Integer perId = rs.getInt("per_id");
                String perNombres = rs.getString("per_nombres");
                String perApellidos = rs.getString("per_apellidos");
                String perCedula = rs.getString("per_cedula");
                String perTelefono = rs.getString("per_telefono");
                String perCorreo = rs.getString("per_correo");
                String usuario = rs.getString("per_usuario");
                String perClave = rs.getString("per_clave");
                String perImagen = rs.getString("per_dimg");
                LocalDateTime perFRegistro = rs.getTimestamp("per_fregistro").toLocalDateTime();
                Integer perfilId = rs.getInt("perfiles_perfil_id");
                Integer estaId = rs.getInt("estados_esta_id");

                Personas persona = new Personas(perId, perNombres, perApellidos, perCedula, perTelefono, perCorreo, usuario, perClave, perImagen, perFRegistro, perfilId, estaId);
                personas.add(persona);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PersonaDao mostrarListaPersonasC: " + e.getMessage());
        } finally {
        }
        return personas;
    }

    public List<Personas> mostrarListaPersonasE() {
        List<Personas> personas = new ArrayList<>();
        try {
            String sql_lista = "SELECT * FROM hotel_clv.personas WHERE perfiles_perfil_id !=4;";
            Statement pst = con.getConexion().prepareCall(sql_lista);
            ResultSet rs = pst.executeQuery(sql_lista);
            while (rs.next()) {
                Integer perId = rs.getInt("per_id");
                String perNombres = rs.getString("per_nombres");
                String perApellidos = rs.getString("per_apellidos");
                String perCedula = rs.getString("per_cedula");
                String perTelefono = rs.getString("per_telefono");
                String perCorreo = rs.getString("per_correo");
                String usuario = rs.getString("per_usuario");
                String perClave = rs.getString("per_clave");
                String perImagen = rs.getString("per_dimg");
                LocalDateTime perFRegistro = rs.getTimestamp("per_fregistro").toLocalDateTime();
                Integer perfilId = rs.getInt("perfiles_perfil_id");
                Integer estaId = rs.getInt("estados_esta_id");

                Personas persona = new Personas(perId, perNombres, perApellidos, perCedula, perTelefono, perCorreo, usuario, perClave, perImagen, perFRegistro, perfilId, estaId);
                personas.add(persona);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PersonaDao mostrarListaPersonasE: " + e.getMessage());
        } finally {
        }
        return personas;
    }

    public Personas mostrarPersona(Integer id) {
        Personas persona = null;
        try {
            String sql_mostrarP = "SELECT * FROM hotel_clv.personas WHERE per_id =?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_mostrarP);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Integer perId = rs.getInt("per_id");
                String perNombres = rs.getString("per_nombres");
                String perApellidos = rs.getString("per_apellidos");
                String perCedula = rs.getString("per_cedula");
                String perTelefono = rs.getString("per_telefono");
                String perCorreo = rs.getString("per_correo");
                String usuario = rs.getString("per_usuario");
                String perClave = rs.getString("per_clave");
                String perImagen = rs.getString("per_dimg");
                LocalDateTime perFRegistro = rs.getTimestamp("per_fregistro").toLocalDateTime();
                Integer perfilId = rs.getInt("perfiles_perfil_id");
                Integer estaId = rs.getInt("estados_esta_id");

                persona = new Personas(perId, perNombres, perApellidos, perCedula, perTelefono, perCorreo, usuario, perClave, perImagen, perFRegistro, perfilId, estaId);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PersonaDao mostrarPersona: " + e.getMessage());
        } finally {
        }
        return persona;
    }

    public int crearPersona(String perNombres, String perApellidos, String perCedula, String perTelefono, String perCorreo, String perUsuario, String perClave, String perImagen, LocalDateTime perFRegistro, Integer perfilId, Integer estaId) {
        int resultado = 0;
        try {
            String sql_crearP = "INSERT INTO hotel_clv.personas (per_nombres, per_apellidos,per_cedula,per_telefono,per_correo,per_usuario,per_clave,per_dimg,per_fregistro,perfiles_perfil_id,estados_esta_id) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement pst = con.getConexion().prepareCall(sql_crearP);
            pst.setString(1, perNombres);
            pst.setString(2, perApellidos);
            pst.setString(3, perCedula);
            pst.setString(4, perTelefono);
            pst.setString(5, perCorreo);
            pst.setString(6, perUsuario);
            pst.setString(7, perClave);
            pst.setString(8, perImagen);
            pst.setTimestamp(9, Timestamp.valueOf(perFRegistro));
            pst.setInt(10, perfilId);
            pst.setInt(11, estaId);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();

        } catch (SQLException e) {
            System.out.println("Error en PersonasDao crearPersona: " + e.getMessage());
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

    public int modificarPersona(Integer id, String perNombres, String perApellidos, String perCedula, String perTelefono, String perCorreo, String perUsuario, String perClave, String perImagen, LocalDateTime perFRegistro, Integer perfilId, Integer estaId) {
        int resultado = 0;
        try {
            String sql_modifcarP = "UPDATE hotel_clv.personas SET per_nombres=?, per_apellidos=?,per_cedula=?,per_telefono=?,per_correo=?,per_usuario=?,per_clave=?, per_dimg=?,per_fregistro = ?,perfiles_perfil_id=?,estados_esta_id=? WHERE per_id=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_modifcarP);
            pst.setString(1, perNombres);
            pst.setString(2, perApellidos);
            pst.setString(3, perCedula);
            pst.setString(4, perTelefono);
            pst.setString(5, perCorreo);
            pst.setString(6, perUsuario);
            pst.setString(7, perClave);
            pst.setString(8, perImagen);
            pst.setTimestamp(9, Timestamp.valueOf(perFRegistro));
            pst.setInt(10, perfilId);
            pst.setInt(11, estaId);
            pst.setInt(12, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PersonasDao modificarPersona:  " + e.getMessage());
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

    public int eliminarPersona(Integer id) {
        int resultado = 0;
        try {
            String sql_eliminarP = "DELETE FROM hotel_clv.personas WHERE per_id=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_eliminarP);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
            if (n > 0) {
                resultado = 1;
            } else {
                resultado = 0;
            }

        } catch (Exception e) {
            System.out.println("Error en PersonasDao eliminarPersona: " + e.getMessage());
        } finally {
        }
        return resultado;
    }
}
