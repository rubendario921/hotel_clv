<%-- 
    Document   : crudestado_eliminar
    Created on : 15/08/2023, 14:28:08
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
            if (request.getParameter("eliminar") != null && request.getParameter("eliminar").equals("true")) {
                int id = Integer.parseInt(request.getParameter("id"));
                EstadosDao eliminarE = new EstadosDao();
                int resultado = eliminarE.eliminarEstado(id);
                if (resultado == 1) {
                    String informacion = "Registro Eliminado.";
                    String redireccion = "../estados_lista.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%} else {%>
        <script>alert("Registro No Eliminado, Intentalo nuevamente.");
            window.history.back();</script>
        <%}
                }%>
    </body>
</html>
