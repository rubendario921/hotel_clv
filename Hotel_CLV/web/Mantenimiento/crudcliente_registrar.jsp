<%-- 
    Document   : crudregistrar
    Created on : 19-jul-2023, 12:53:25
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Model.conexion" %>

<%
    try {
        conexion con = new conexion();
        if (request.getParameter("nuevo") != null) {
            String nom = request.getParameter("nom");
            String ape = request.getParameter("ape");
            String usu = request.getParameter("usu");
            String cedu = request.getParameter("cedu");
            String cont = request.getParameter("cont");
            String corr = request.getParameter("corr");
            String pass = request.getParameter("pass");
            //int rol = Integer.parseInt(request.getParameter("rol"));

            String sql = "INSERT INTO personas (per_nombres,per_apellidos,per_cedula,per_telefono,per_correo,per_usuario,per_clave,perfiles_perfil_id,estados_esta_id)values(?,?,?,?,?,?,?,?,?);";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(1, nom);
            pst.setString(2, ape);
            pst.setString(3, cedu);
            pst.setString(4, cont);
            pst.setString(5, corr);
            pst.setString(6, usu);
            pst.setString(7, pass);
            pst.setString(8, "4");
            pst.setString(9, "1");
            int n = pst.executeUpdate();
            if (n > 0) {
                out.print("<script>alert('Registro Guardado')</script>");
                out.print("<script>window.location.href='../login_cliente.jsp'</script>");
            } else {
                out.print("<script>alert('Registro NO Guardado')</script>");
                out.print("<script>window.location.href='../registro_cliente.jsp'</script>");
            }
        }

    } catch (SQLException e) {
        if (e.getErrorCode() == 1062) {
            out.print("<script>alert('El registro  ya existe en la base de datos, intente nuevamente');</script>");// 1062 es el código de error para valor duplicado en MySQL
            out.print("<script>window.location.href='../registro_cliente.jsp'</script>");
        } else if (e.getErrorCode() == 1048) {
            out.print("<script>alert('Los campos no puede estar vacios,, intente nuevamente');</script>");// 1048 es el código de error para valor duplicado en MySQL
            out.print("<script>window.location.href='../registro_cliente.jsp'</script>");
        } else {
        }
        // Si la excepción es por otro motivo, muestra un mensaje de error genérico
        out.print("<script>alert('Error al insertar el registro');</script>");
    }
%>