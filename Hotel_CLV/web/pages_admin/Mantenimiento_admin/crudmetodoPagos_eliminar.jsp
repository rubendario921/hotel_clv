<%-- 
    Document   : crudmetodoPagos_eliminar
    Created on : 21/08/2023, 16:20:00
    Author     : Wladimir Campaña
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
            if (request.getParameter("eliminar") != null && request.getParameter("eliminar").equals("true")) {
                int id = Integer.parseInt(request.getParameter("id"));
                MetodoPagosDao eliminarM = new MetodoPagosDao();
                int resultado = eliminarM.eliminarMetodoPagos(id);
                if (resultado == 1) {
                    String informacion = "Registro Eliminado.";
                    String redireccion = "../metodoPagos_lista.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%} else {%>
        <script>alert("Registro No Eliminado, Intentalo nuevamente.");
            window.history.back();</script>
            <%}%>
            <%}%>
    </body>
</html>

