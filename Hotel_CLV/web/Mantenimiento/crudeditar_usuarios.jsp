<%-- 
    Document   : crudeditar_usuarios
    Created on : 20-jul-2023, 0:32:07
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    try {
        if (request.getParameter("editar") != null) {

            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nom");
            String apellido = request.getParameter("ape");
            String cedula = request.getParameter("cedu");
            int contacto = Integer.parseInt(request.getParameter("cont"));
            String correo = request.getParameter("corr");
            String password = request.getParameter("pass");
            String estado = request.getParameter("est");
            //int rol = Integer.parseInt(request.getParameter("rol"));

            String sql = "UPDATE proyecto_integrador.usuarios "
                    + "SET usu_nombres = ?, usu_apellidos = ?, usu_cedula = ?, usu_contacto = ?, usu_correo = ?, usu_clave = ?, usu_estado = ?"
                    + "WHERE usu_id = ?";

            String url = "jdbc:mysql://localhost:3306/proyecto_integrador?autoReconnect=true&useSSL=false&zeroDateTimeBehavior=convertToNull";
            String user = "root";
            String pass = "12345";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, nombre);
            pst.setString(2, apellido);
            pst.setString(3, cedula);
            pst.setInt(4, contacto);
            pst.setString(5, correo);
            pst.setString(6, password);
            pst.setString(7, estado);
            pst.setInt(8, id);

            int n = pst.executeUpdate();

            if (n > 0) {
                out.print("<script>alert('Editado con éxito')</script>");
                out.print("<script>window.location.href='./listado_usuarios.jsp'</script>");
            } else {
                out.print("<script>alert('Fallo al Editar')</script>");
            }
        }
    } catch (Exception e) {
        System.out.println("ERROR: " + e.getMessage());
    }
%>