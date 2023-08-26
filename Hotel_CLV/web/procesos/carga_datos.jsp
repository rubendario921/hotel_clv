<%-- 
    Document   : carga_datos
    Created on : 17-jul-2023, 20:10:45
    Author     : Ruben Dario 921
--%>
<%@page import="java.util.Map"%>
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

            // Extraer session de nombre y nombre del perfil
            Validaciones validaciones = new Validaciones();
            Map<String, Object> userData = validaciones.obtenerNombrePerfil(correo, usuario, password);

            Integer perId = (Integer) userData.get("perId");
            String nombre = (String) userData.get("nombre");
            String perfil = (String) userData.get("perfil");

            session.setAttribute("perId", perId);
            session.setAttribute("nombre", nombre);
            session.setAttribute("perfil", perfil);

            //Validar Usuario
            Validaciones Persona = new Validaciones();
            int resultado = Persona.validarPersona(correo, usuario, password);
            if (resultado == 0) {%>
        <script>alert("Inicio de sesión incorrecto. Verifica tus datos e intenta nuevamente.");
            window.history.back();
        </script>
        <%} else {
            String mensaje = "";
            String redireccion = "../pages_admin/menu_admin.jsp";
            switch (resultado) {
                case 1:
                    mensaje = "Bienvenido Administrador";
                    break;

                case 2:
                    mensaje = "Bienvenido Supervisor";
                    break;

                case 3:
                    mensaje = "Bienvenido Recepcionista";
                    break;

                case 4:
                    mensaje = "Bienvenido Cliente";
                    redireccion = "../pages_cliente/menu_dashboard.jsp";
                    break;
            }
        %>
        <script>mostrarMensajeBienvenida('<%= mensaje%>', '<%= redireccion%>');</script>            
        <% }%>
    </body>
</html>