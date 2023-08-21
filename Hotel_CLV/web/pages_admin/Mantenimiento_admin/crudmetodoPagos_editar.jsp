<%-- 
    Document   : crumetodoPagos_editar
    Created on : 21/08/2023, 16:24:01
    Author     : Usuario
--%>

<%@page import="Controller.MetodoPagosDao"%>
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

                MetodoPagosDao modificarM = new MetodoPagosDao();
                int resultado = modificarM.modificarMetodoPagos(id, letra, nombre);

                switch (resultado) {
                    case 1:
                        informacion = "Registro de Matodo Exitoso.";
                        redireccion = "../metodoPagos_lista.jsp";
                        break;
                    case 1062:
                        informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../metodoPagos_editar.jsp";
                        break;
                    case 1048:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../metodoPagos_editar.jsp";
                        break;
                    default:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../metodoPagos_editar.jsp";
                        break;
                }%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%}%>
    </body>
</html>