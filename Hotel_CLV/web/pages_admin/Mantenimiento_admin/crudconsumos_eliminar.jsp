<%-- 
    Document   : crudconsumos_eliminar
    Created on : 28/08/2023, 18:17:36
    Author     : USUARIO
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="Controller.ConsumosDao" %>
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
        <% if (request.getParameter("eliminar") != null && request.getParameter("eliminar").equals("true")) {
                int id = Integer.parseInt(request.getParameter("id"));
                ConsumosDao eliminarC = new ConsumosDao();
                int resultado = eliminarC.eliminarConsu(id);
                if (resultado == 1) {
                    String informacion = "Consumo Eliminado";
                    String redireccion = "../consumos_lista.jsp";
        %>     
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <% } else {%>
        <script>alert("Registro NO Eliminado, Intentalo nuevamente.");
            window.history.back();</script>
            <% }
                }%>
    </body>
</html>