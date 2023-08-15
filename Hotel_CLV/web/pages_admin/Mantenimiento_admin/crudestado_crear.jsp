<%-- 
    Document   : crudestado_crear
    Created on : 15/08/2023, 12:21:55
    Author     : Ruben Dario
--%>

<%@page import="Controller.EstadosDao"%>
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
            if (request.getParameter("nuevo_estado") != null) {
                String letra = request.getParameter("letra");
                String descripcion = request.getParameter("descripcion");

                EstadosDao crearE = new EstadosDao();
                int resultado = crearE.crearEstado(letra, descripcion);

                switch (resultado) {
                    case 1:
                        informacion = "Registro de Estado Exitoso.";
                        redireccion = "../estados_lista.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%break;
            case 1062:
                informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                redireccion = "../estados_crear.jsp";%>
        %>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%break;
            case 1048:
                informacion = "Los campos no puede estar vacios, intente nuevamente.";
                redireccion = "../estados_crear.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>        
        <%break;
            default:
                informacion = "Registro Incorrecto, intente nuevamente.";
                redireccion = "../estados_crear.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <% }
            }%>
    </body>
</html>
