<%-- 
    Document   : carga_datos_admin
    Created on : 17-jul-2023, 20:10:45
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String usuario = request.getParameter("usuario");
    String pass = request.getParameter("password");

    try {
        String url = "jdbc:mysql://localhost:3306/hotel_clv?autoReconnect=true&useSSL=false&zeroDateTimeBehavior=convertToNull";
        String user = "root";
        String pass1 = "12345";

        String nombre = "";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass1);

        String sql = "SELECT * FROM personas WHERE per_usuario=? AND per_clave=?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, usuario);
        pst.setString(2, pass);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            nombre = rs.getString("per_nombres");
            session.setAttribute("nombre", nombre);
            int perfil = rs.getInt("per_perfil");
            if (perfil == 1) {
%>
<script>
    alert("Bienvenido, Administrador.");
    window.location.href = "../pages_admin/menu_admin.jsp"; // Redirige al menú del administrador

</script>
<%
} else if (perfil == 2) {
%>
<script>
    alert("Bienvenido, Supervisor.");
    window.location.href = "../pages_admin/menu_admin.jsp"; // Redirige al menú del vendedor
</script>
<%
    }
} else {
%>
<script>
    alert("Inicio de sesión incorrecto. Verifica tus datos e intenta nuevamente.");
    window.history.back(); // Regresa a la página anterior después del inicio de sesión incorrecto
</script>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
