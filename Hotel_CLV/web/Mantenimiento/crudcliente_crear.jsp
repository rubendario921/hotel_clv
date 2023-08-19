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
            String informacion = "";
            String redireccion = "";
            if (request.getParameter("nuevo_cliente") != null) {
                String perNombres = request.getParameter("nombre");
                String perApellidos = request.getParameter("apellido");
                String perCedula = request.getParameter("cedula");
                String perTelefono = request.getParameter("telefono");
                String perCorreo = request.getParameter("correo");
                String perUsuario = request.getParameter("usuario");
                String perClave = request.getParameter("clave");
                String perImagen = "assets\\img\\user_default.png";                
                String fregistroString  = request.getParameter("fregistro");
                LocalDateTime perFRegistro = LocalDateTime.parse(fregistroString.replace(" ", " "));
                
                Integer perfilId = 4;
                Integer estaId = 1;

                PersonasDao crearP = new PersonasDao();
                int resultado = crearP.crearPersona(perNombres, perApellidos, perCedula, perTelefono, perCorreo, perUsuario, perClave, perImagen, perFRegistro, perfilId, estaId);
                switch (resultado) {
                    case 1:
                        informacion = "Registro de Perfil Exitoso.";
                        redireccion = "../login_cliente.jsp";
                        break;

                    case 1062:
                        informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../registro_cliente.jsp";
                        break;

                    case 1048:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../registro_cliente.jsp";
                        break;

                    default:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../registro_cliente.jsp";
                        break;
                }%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%
            }%>
    </body>
</html>