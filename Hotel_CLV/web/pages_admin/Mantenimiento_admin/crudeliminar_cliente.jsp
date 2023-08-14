<%-- 
    Document   : crudeliminar_usuario
    Created on : 20-jul-2023, 10:03:49
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Model.conexion" %>
<%@page import="java.sql.*" %>

<%
    boolean eliminar_registro = false;
    try {
        conexion con = new conexion();

        if (request.getParameter("eliminar") != null && request.getParameter("eliminar").equals("true")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String sql = "DELETE FROM personas WHERE per_id = ?;";
            PreparedStatement pst = con.getConexion().prepareCall(sql);
            pst.setInt(1, id);

            int n = pst.executeUpdate();

            if (n > 0) {
                eliminar_registro = true;
            } else {
                eliminar_registro = false;
            }
        }
    } catch (Exception e) {
        System.out.println("ERROR: " + e.getMessage());
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Registro</title>
    </head>

    <body>
        <% if (eliminar_registro) { %>
        <script>
            alert("Registro Eliminado Exitosamente");
            window.location.href = "../pages_admin/listado_clientes.jsp"; // Redirige a la página de bienvenida después del inicio de sesión exitoso
        </script>
        <% } else { %>
        <script>
            alert("Fallo en eliminar lo datos. Intenta nuevamente.");
            window.history.back(); // Regresa a la página anterior después del inicio de sesión incorrecto
        </script>
        <% }%>
    </body>
</html>