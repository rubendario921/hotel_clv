<%-- 
    Document   : crudeliminar_admin
    Created on : 20-jul-2023, 10:04:15
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.conexion,java.sql.*" %>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<%
    try {
        if (request.getParameter("eliminar") != null && request.getParameter("eliminar").equals("true")) {
            int id = Integer.parseInt(request.getParameter("id"));

            String sql = "DELETE FROM empleados WHERE emp_id = ?";
            String url = "jdbc:mysql://localhost:3306/proyecto_integrador?autoReconnect=true&useSSL=false&zeroDateTimeBehavior=convertToNull";
            String user = "root";
            String pass = "12345";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            int n = pst.executeUpdate();

            if (n > 0) {
                out.print("<script>alert('Eliminado con éxito')</script>");
                out.print("<script>window.location.href='../listado_empleados.jsp'</script>");
            } else {
                out.print("<script>alert('Fallo al eliminar')</script>");
            }
        }
    } catch (Exception e) {
        System.out.println("ERROR: " + e.getMessage());
    }


%>
