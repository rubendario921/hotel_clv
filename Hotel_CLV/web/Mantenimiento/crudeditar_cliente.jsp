<%-- 
    Document   : crudeditar_cliente
    Created on : 20-jul-2023, 0:32:07
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.conexion" %>
<%@page import="java.sql.*"%>

<%
    try {
        conexion con = new conexion();
        if (request.getParameter("editar") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nom");
            String apellido = request.getParameter("ape");
            String cedula = request.getParameter("cedu");
            String contacto = request.getParameter("cont");
            String correo = request.getParameter("corr");
            String usuario = request.getParameter("usu");
            String password = request.getParameter("pass");
            String estado = request.getParameter("est");
            //int rol = Integer.parseInt(request.getParameter("rol"));
            String sql = "UPDATE personas "
                    + "SET per_nombres = ?, per_apellidos = ?, per_cedula = ?, per_telefono = ?, per_correo = ?, per_usuario=?, per_clave = ?, per_estado = ?"
                    + "WHERE per_id = ?";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setString(1, nombre);
            pst.setString(2, apellido);
            pst.setString(3, cedula);
            pst.setString(4, contacto);
            pst.setString(5, correo);
            pst.setString(6, usuario);
            pst.setString(7, password);
            pst.setString(8, estado);
            pst.setInt(9, id);

            int n = pst.executeUpdate();

            if (n > 0) {
                out.print("<script>alert('Editado con éxito')</script>");
                out.print("<script>window.location.href='../pages_admin/listado_clientes.jsp'</script>");

            } else {
                out.print("<script>alert('Fallo al Editar')</script>");
            }
        }
    } catch (Exception e) {
        out.print("<script>alert('Error al procesar la solicitud')</script>");
        e.printStackTrace();
    }
%>