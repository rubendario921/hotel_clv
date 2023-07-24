<%-- 
    Document   : crudedtiar_admin
    Created on : 20-jul-2023, 10:54:02
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
            String usuario = request.getParameter("usu");
            String password = request.getParameter("pass");
            int contacto = Integer.parseInt(request.getParameter("cont"));
            String correo = request.getParameter("corr");
            int perfil = Integer.parseInt(request.getParameter("per"));
            String estado = request.getParameter("est");

            String sql = "UPDATE proyecto_integrador.empleados "
                    + "SET emp_nombres = ?, emp_apellidos = ?, emp_cedula = ?, emp_usuario=?, emp_clave = ?,emp_contacto = ?, emp_correo = ?, emp_perfil = ?,emp_estado = ?"
                    + "WHERE emp_id = ?";

            String url = "jdbc:mysql://localhost:3306/proyecto_integrador?autoReconnect=true&useSSL=false&zeroDateTimeBehavior=convertToNull";
            String user = "root";
            String pass = "12345";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, nombre);
            pst.setString(2, apellido);
            pst.setString(3, cedula);
            pst.setString(4, usuario);
            pst.setString(5, password);
            pst.setInt(6, contacto);
            pst.setString(7, correo);
            pst.setInt(8, perfil);
            pst.setString(9, estado);
            pst.setInt(10, id);

            int n = pst.executeUpdate();

            if (n > 0) {
                out.print("<script>alert('Editado con éxito')</script>");
                out.print("<script>window.location.href='../listado_empleados.jsp'</script>");
            } else {
                out.print("<script>alert('Fallo al Editar')</script>");
            }
        }
    } catch (Exception e) {
        System.out.println("ERROR: " + e.getMessage());
    }
%>
