<%-- 
    Document   : crudperfil_editar
    Created on : 14/08/2023, 12:36:51
    Author     : Ruben Dario
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

            if (request.getParameter("editar") != null) {
                Integer id = Integer.parseInt(request.getParameter("codigo"));
                String letra = request.getParameter("letra");
                String nombre = request.getParameter("nombre");

                PerfilesDao modificarP = new PerfilesDao();
                int resultado = modificarP.modificarPerfil(id, letra, nombre);

                switch (resultado) {
                    case 1:
                        informacion = "Registro de Perfil Exitoso.";
                        redireccion = "../perfil_lista.jsp";
                        break;
                    case 1062:
                        informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../perfil_lista.jsp";
                        break;
                    case 1048:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../perfil_lista.jsp";
                        break;
                    default:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../perfil_lista.jsp";
                        break;
                }%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%}%>
    </body>
</html>