<%-- 
    Document   : crudpersonas_crear
    Created on : 20-jul-2023, 12:08:52
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.PersonasDao"%>
<%@page import="java.time.LocalDateTime"%>
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
            if (request.getParameter("nuevo_persona") != null) {
                String perNombres = request.getParameter("nombres");
                String perApellidos = request.getParameter("apellidos");
                String perCedula = request.getParameter("cedula");
                String perTelefono = request.getParameter("telefono");
                String perCorreo = request.getParameter("correo");
                String perUsuario = request.getParameter("usuario");
                String perClave = request.getParameter("clave");
                String perImagen = "assets\\img\\user_default.png";
                String fregistroString = request.getParameter("fregistro");
                LocalDateTime perFRegistro = LocalDateTime.parse(fregistroString.replace(" ", " "));
                Integer perfilId = Integer.parseInt(request.getParameter("perfil"));
                Integer estaId = 1;

                PersonasDao crearPersona = new PersonasDao();
                int resultado = crearPersona.crearPersona(perNombres, perApellidos, perCedula, perTelefono, perCorreo, perUsuario, perClave, perImagen, perFRegistro, perfilId, estaId);

                switch (resultado) {
                    case 1:
                        String informacion = "Registro Exitoso.";
                        String redireccion = "../menu_admin.jsp";%>
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