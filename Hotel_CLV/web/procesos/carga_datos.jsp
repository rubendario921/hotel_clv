<%-- 
    Document   : carga_datos
    Created on : 17-jul-2023, 20:10:45
    Author     : Ruben Dario 921
--%>

<%@page import="java.sql.*"%>
<%@page import="Model.Validaciones"%>
<%@page import="Model.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <script type="text/javascript">
            function mostrarMensajeBienvenida(mensaje, nombre, redireccion) {
                alert(mensaje);
                window.location.href = redireccion;
            }
        </script>
    </head>
    <body>

        <%
            String correo = request.getParameter("correo");
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");

            Validaciones vPersona = new Validaciones();
            int resultado = vPersona.validarPersona(correo, usuario, password);

            Validaciones vNombre = new Validaciones();
            String nombre = vNombre.obtenerNombre(correo, usuario, password);

            if (resultado == 1) {
                String mensaje = "Bienvenido Administrador";
                session.setAttribute("nombre", nombre);
                String redireccion = "../pages_admin/menu_admin.jsp";
        %>
        <script>mostrarMensajeBienvenida('<%= mensaje%>', '<%=nombre%>', '<%= redireccion%>');</script> 
        <%} else if (resultado == 2) {
            String mensaje = "Bienvenido Supervisor";
            session.setAttribute("nombre", nombre);
            String redireccion = "../pages_admin/menu_admin.jsp";%>
        <script>mostrarMensajeBienvenida('<%= mensaje%>', '<%=nombre%>', '<%= redireccion%>');</script> 
        <%} else if (resultado == 3) {
            String mensaje = "Bienvenido Recepcionista";
            session.setAttribute("nombre", nombre);
            String redireccion = "../pages_admin/menu_admin.jsp";%>
        <script>mostrarMensajeBienvenida('<%= mensaje%>', '<%=nombre%>', '<%= redireccion%>');</script> 
        <%} else if (resultado == 4) {
            String mensaje = "Bienvenido Cliente";
            session.setAttribute("nombre", nombre);
            String redireccion = "../pages_cliente/menu_cliente.jsp";%>
        <script>mostrarMensajeBienvenida('<%= mensaje%>', '<%=nombre%>', '<%= redireccion%>');</script> 
        <%} else {%>
        <script>alert("Inicio de sesión incorrecto. Verifica tus datos e intenta nuevamente.");
            window.history.back(); // Regresa a la página anterior después del inicio de sesión incorrecto</script>
            <%}%>
    </body>
</html>