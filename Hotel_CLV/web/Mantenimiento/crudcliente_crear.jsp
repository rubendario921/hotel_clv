<%-- 
    Document   : crudregistrar
    Created on : 19-jul-2023, 12:53:25
    Author     : Ruben Dario 921
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="Controller.PersonasDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function mostrarMensaje(informacion, redireccion) {
                alert(informacion);
                window.location.href = redireccion;
            }
        </script>
    </head>
    <body>
        <%
            if (request.getParameter("nuevo_cliente") != null) {
                String perNombres = request.getParameter("nombres");
                String perApellidos = request.getParameter("apellidos");
                String perCedula = request.getParameter("cedula");
                String perTelefono = request.getParameter("telefono");
                String perCorreo = request.getParameter("correo");
                String perUsuario = request.getParameter("usuario");
                String perClave = request.getParameter("clave");
                String perImagen = "assets\\img\\user_default.png";
                LocalDateTime perFRegistro = LocalDateTime.now();

                PersonasDao crearP = new PersonasDao();
                int resultado = crearP.crearCliente(perNombres, perApellidos, perCedula, perTelefono, perCorreo, perUsuario, perClave, perImagen, perFRegistro);
                switch (resultado) {
                    case 1:
                        String informacion = "Registro Exitoso.";
                        String redireccion = "../login_cliente.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%break;
            case 1062:%>
        <script>alert("El registro  ya existe en la base de datos, intente nuevamente.");
            window.history.back();
        </script>    
        <%break;
            case 1048:%>
        <script>alert("Los campos no puede estar vacios, intente nuevamente.");
            window.history.back();
        </script>              
        <%break;
            default:%>
        <script>alert("Registro Incorrecto, intente nuevamente");
            window.history.back();
        </script>             
        <%break;
                }
            }%>
    </body>
</html>