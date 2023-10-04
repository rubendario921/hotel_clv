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
                Integer tipoDocumento = rs.getInt("tipodocumento_docI_id");
                String pernumDocumento = rs.getString("per_numDocumento");
                Integer prefijosTelefono = rs.getInt("prefijos_perfiCont_id");
                String perTelefono = rs.getString("per_telefono");
                String perCorreo = rs.getString("per_correo");
                String perUsuario = rs.getString("per_usuario");
                String perClave = rs.getString("per_clave");
                String perImagen = rs.getString("per_dimg");
                LocalDateTime perFRegistro = rs.getTimestamp("per_fregistro").toLocalDateTime();
                Integer perfilId = rs.getInt("perfiles_perfil_id");
                Integer estaId = rs.getInt("estados_esta_id");

                Personas persona = new Personas(perId, perNombres, perApellidos, tipoDocumento, pernumDocumento, prefijosTelefono, perTelefono, perCorreo, perUsuario, perClave, perImagen, perFRegistro, perfilId, estaId);
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
                Integer tipoDocumento = rs.getInt("tipodocumento_docI_id");
                String pernumDocumento = rs.getString("per_numDocumento");
                Integer prefijosTelefono = rs.getInt("prefijos_perfiCont_id");
                String perTelefono = rs.getString("per_telefono");
                String perCorreo = rs.getString("per_correo");
                String perUsuario = rs.getString("per_usuario");
                String perClave = rs.getString("per_clave");
                String perImagen = rs.getString("per_dimg");
                LocalDateTime perFRegistro = rs.getTimestamp("per_fregistro").toLocalDateTime();
                Integer perfilId = rs.getInt("perfiles_perfil_id");
                Integer estaId = rs.getInt("estados_esta_id");

                Personas persona = new Personas(perId, perNombres, perApellidos, tipoDocumento, pernumDocumento, prefijosTelefono, perTelefono, perCorreo, perUsuario, perClave, perImagen, perFRegistro, perfilId, estaId);
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
                Integer tipoDocumento = rs.getInt("tipodocumento_docI_id");
                String pernumDocumento = rs.getString("per_numDocumento");
                Integer prefijosTelefono = rs.getInt("prefijos_perfiCont_id");
                String perTelefono = rs.getString("per_telefono");
                String perCorreo = rs.getString("per_correo");
                String perUsuario = rs.getString("per_usuario");
                String perClave = rs.getString("per_clave");
                String perImagen = rs.getString("per_dimg");
                LocalDateTime perFRegistro = rs.getTimestamp("per_fregistro").toLocalDateTime();
                Integer perfilId = rs.getInt("perfiles_perfil_id");
                Integer estaId = rs.getInt("estados_esta_id");

                Personas persona = new Personas(perId, perNombres, perApellidos, tipoDocumento, pernumDocumento, prefijosTelefono, perTelefono, perCorreo, perUsuario, perClave, perImagen, perFRegistro, perfilId, estaId);
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
                Integer tipoDocumento = rs.getInt("tipodocumento_docI_id");
                String pernumDocumento = rs.getString("per_numDocumento");
                Integer prefijosTelefono = rs.getInt("prefijos_perfiCont_id");
                String perTelefono = rs.getString("per_telefono");
                String perCorreo = rs.getString("per_correo");
                String perUsuario = rs.getString("per_usuario");
                String perClave = rs.getString("per_clave");
                String perImagen = rs.getString("per_dimg");
                LocalDateTime perFRegistro = rs.getTimestamp("per_fregistro").toLocalDateTime();
                Integer perfilId = rs.getInt("perfiles_perfil_id");
                Integer estaId = rs.getInt("estados_esta_id");

                persona = new Personas(perId, perNombres, perApellidos, tipoDocumento, pernumDocumento, prefijosTelefono, perTelefono, perCorreo, perUsuario, perClave, perImagen, perFRegistro, perfilId, estaId);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PersonaDao mostrarPersona: " + e.getMessage());
        } finally {
        }
        return persona;
    }

    public int crearPersona(String perNombres, String perApellidos, Integer tipoDocumento, String pernumDocumento, Integer prefijosTelefono, String perTelefono, String perCorreo, String perUsuario, String perClave, String perImagen, LocalDateTime perFRegistro, Integer perfilId) {
        int resultado = 0;
        try {
            String sql_estado = "SELECT esta_id FROM hotel_clv.estados WHERE esta_descripcion LIKE 'ACTI%';";
            PreparedStatement pstEstado = con.getConexion().prepareStatement(sql_estado);
            ResultSet rsEstado = pstEstado.executeQuery(sql_estado);
            while (rsEstado.next()) {
                int estaId = rsEstado.getInt("esta_id");
                String sql_crearP = "INSERT INTO hotel_clv.personas (per_nombres, per_apellidos,tipodocumento_docI_id,per_numDocumento,prefijos_perfiCont_id,per_telefono,per_correo,per_usuario,per_clave,per_dimg,per_fregistro,perfiles_perfil_id,estados_esta_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);";
                PreparedStatement pst = con.getConexion().prepareCall(sql_crearP);
                pst.setString(1, perNombres);
                pst.setString(2, perApellidos);
                pst.setInt(3, tipoDocumento);
                pst.setString(4, pernumDocumento);
                pst.setInt(5, prefijosTelefono);
                pst.setString(6, perTelefono);
                pst.setString(7, perCorreo);
                pst.setString(8, perUsuario);
                pst.setString(9, perClave);
                pst.setString(10, perImagen);
                pst.setTimestamp(11, Timestamp.valueOf(perFRegistro));
                pst.setInt(12, perfilId);
                pst.setInt(13, estaId);
                int n = pst.executeUpdate();
                if (n > 0) {
                    resultado = 1;
                } else {
                    resultado = 0;
                }
                pst.close();
            }
            rsEstado.close();
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

    public int modificarPersona(Integer perId, String perNombres, String perApellidos, Integer tipoDocumento, String pernumDocumento, Integer prefijosTelefono, String perTelefono, String perCorreo, String perUsuario, String perClave, String perImagen, LocalDateTime perFRegistro, Integer perfilId, Integer estaId) {
        int resultado = 0;
        try {
            String sql_modifcarP = "UPDATE hotel_clv.personas SET per_nombres=?, per_apellidos=?,tipodocumento_docI_id=?,per_numDocumento=?,prefijos_perfiCont_id=?,per_telefono=?,per_correo=?,per_usuario=?,per_clave=?, per_dimg=?,per_fregistro = ?,perfiles_perfil_id=?,estados_esta_id=? WHERE per_id=?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql_modifcarP);
            pst.setString(1, perNombres);
            pst.setString(2, perApellidos);
            pst.setInt(3, tipoDocumento);
            pst.setString(4, pernumDocumento);
            pst.setInt(5, prefijosTelefono);
            pst.setString(6, perTelefono);
            pst.setString(7, perCorreo);
            pst.setString(8, perUsuario);
            pst.setString(9, perClave);
            pst.setString(10, perImagen);
            pst.setTimestamp(11, Timestamp.valueOf(perFRegistro));
            pst.setInt(12, perfilId);
            pst.setInt(13, estaId);
            pst.setInt(14, perId);
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
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error en PersonasDao eliminarPersona: " + e.getMessage());
        } finally {
        }
        return resultado;
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public int crearCliente(String perNombres, String perApellidos, int tipoDocumento, String numDocumento, int prefijosCont, String perTelefono, String perCorreo, String perUsuario, String perClave, String perImagen, LocalDateTime perFRegistro) {
        int resultado = 0;
        Connection conn = null;
        PreparedStatement pstPerfil = null;
        PreparedStatement pstEstado = null;
        PreparedStatement pstCrearP = null;

        try {
            conn = con.getConexion();
            // Obtener perfilId
            String sql_perfil = "SELECT perfil_id FROM hotel_clv.perfiles WHERE perfil_nombre LIKE 'CLI%';";
            pstPerfil = conn.prepareStatement(sql_perfil);
            ResultSet rsPerfil = pstPerfil.executeQuery();

            while (rsPerfil.next()) {
                int perfilId = rsPerfil.getInt("perfil_id");

                // Obtener estaId
                String sql_estado = "SELECT esta_id FROM hotel_clv.estados WHERE esta_descripcion LIKE 'ACTI%';";
                pstEstado = conn.prepareStatement(sql_estado);
                ResultSet rsEstado = pstEstado.executeQuery();

                while (rsEstado.next()) {
                    int estaId = rsEstado.getInt("esta_id");

                    // Insertar en personas
                    String sql_crearP = "INSERT INTO hotel_clv.personas (per_nombres, per_apellidos, tipodocumento_docI_id,per_numDocumento,prefijos_perfiCont_id , per_telefono, per_correo, per_usuario, per_clave, per_dimg, per_fregistro, perfiles_perfil_id, estados_esta_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?);";
                    pstCrearP = conn.prepareStatement(sql_crearP);
                    pstCrearP.setString(1, perNombres);
                    pstCrearP.setString(2, perApellidos);
                    pstCrearP.setInt(3, tipoDocumento);
                    pstCrearP.setString(4, numDocumento);
                    pstCrearP.setInt(5, prefijosCont);
                    pstCrearP.setString(6, perTelefono);
                    pstCrearP.setString(7, perCorreo);
                    pstCrearP.setString(8, perUsuario);
                    pstCrearP.setString(9, perClave);
                    pstCrearP.setString(10, perImagen);
                    pstCrearP.setTimestamp(11, Timestamp.valueOf(perFRegistro));
                    pstCrearP.setInt(12, perfilId);
                    pstCrearP.setInt(13, estaId);

                    int n = pstCrearP.executeUpdate();
                    if (n > 0) {
                        resultado = 1;
                    } else {
                        resultado = 0;
                    }
                }
            }
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
            try {
                if (pstCrearP != null) {
                    pstCrearP.close();
                }
                if (pstEstado != null) {
                    pstEstado.close();
                }
                if (pstPerfil != null) {
                    pstPerfil.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultado;
    }
}
