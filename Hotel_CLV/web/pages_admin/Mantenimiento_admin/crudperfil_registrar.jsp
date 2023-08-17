<%-- 
    Document   : crudregistrar_perfil
    Created on : 13-ago-2023, 14:57:23
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.PerfilesDao"%>
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
            if (request.getParameter("nuevo_perfil") != null) {
                String letra = request.getParameter("letra");
                String nombre = request.getParameter("nombre");

                PerfilesDao registrarP = new PerfilesDao();
                int resultado = registrarP.crearPerfil(letra, nombre);

                switch (resultado) {
                    case 1:
                        informacion = "Registro de Perfil Exitoso.";
                        redireccion = "../perfil_lista.jsp";
                        break;
                    case 1062:
                        informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../perfil_crear.jsp";
                        break;
                    case 1048:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../perfil_crear.jsp";
                        break;
                    default:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../perfil_crear.jsp";
                        break;
                }%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%
            }%>
    </body>
</html>