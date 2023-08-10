<%-- 
    Document   : carga_datos
    Created on : 17-jul-2023, 19:22:25
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    boolean loginExitoso = false;

    try {

        String usuario = request.getParameter("correo");
        String pass = request.getParameter("password");
        String url = "jdbc:mysql://localhost:3306/hotel_clv?autoReconnect=true&useSSL=false&zeroDateTimeBehavior=convertToNull";
        String user = "root";
        String pass1 = "12345";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass1);

        String sql = "SELECT * FROM personas WHERE per_correo=? and per_clave=? and perfiles_perfil_id= 4";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, usuario);
        pst.setString(2, pass);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            loginExitoso = true;
        } else {
            loginExitoso = false;
        }

        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>

    <body>
        <% if (loginExitoso) { %>
        <script>
            alert("Inicio de sesión exitoso. ¡Bienvenido!");
            window.location.href = "../pages_cliente/menu_cliente.jsp"; // Redirige a la página de bienvenida después del inicio de sesión exitoso
        </script>
        <% } else { %>
        <script>
            alert("Inicio de sesión incorrecto. Verifica tus datos e intenta nuevamente.");
            window.history.back(); // Regresa a la página anterior después del inicio de sesión incorrecto
        </script>
        <% }%>
    </body>
</html>