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
            function mostrarMensajeBienvenida(mensaje, redireccion) {
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

            Validaciones Nombre = new Validaciones();
            String nombre = Nombre.obtenerNombre(correo, usuario, password);
            session.setAttribute("nombre", nombre);

            Validaciones vPersona = new Validaciones();
            int resultado = vPersona.validarPersona(correo, usuario, password);
            if (resultado == 0) {%>
        <script>alert("Inicio de sesión incorrecto. Verifica tus datos e intenta nuevamente.");
            window.history.back();
        </script>
        <%} else {
            String mensaje = "";
            String redireccion = "";
            switch (resultado) {
                case 1:
                    mensaje = "Bienvenido Administrador";
                    redireccion = "../pages_admin/menu_admin.jsp";
                    break;

                case 2:
                    mensaje = "Bienvenido Supervisor";
                    redireccion = "../pages_admin/menu_admin.jsp";
                    break;

                case 3:
                    mensaje = "Bienvenido Recepcionista";
                    redireccion = "../pages_admin/menu_admin.jsp";
                    break;

                case 4:
                    mensaje = "Bienvenido Cliente";
                    redireccion = "../pages_cliente/menu_cliente.jsp";
                    break;
            }%>
        <script>mostrarMensajeBienvenida('<%= mensaje%>', '<%= redireccion%>');</script>            
        <%}%>
    </body>
</html>