<%-- 
    Document   : crudestado_editar
    Created on : 15/08/2023, 15:50:30
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

            if (request.getParameter("editar") != null) {
                Integer id = Integer.parseInt(request.getParameter("codigo"));
                String letra = request.getParameter("letra");
                String descripcion = request.getParameter("descripcion");

                EstadosDao editarE = new EstadosDao();
                int resultado = editarE.modificarEstado(id, letra, descripcion);

                switch (resultado) {
                    case 1:
                        informacion = "Modificación de Estado Exitoso";
                        redireccion = "../estados_lista.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%break;
            case 1062:
                informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                redireccion = "../estados_editar.jsp";%>
        %>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%break;
            case 1048:
                informacion = "Los campos no puede estar vacios, intente nuevamente.";
                redireccion = "../estados_editar.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>        
        <%break;
            default:
                informacion = "Registro Incorrecto, intente nuevamente.";
                redireccion = "../estados_editar.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%}
            }%>
    </body>
</html>