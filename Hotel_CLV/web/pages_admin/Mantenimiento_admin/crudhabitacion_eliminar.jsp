<%-- 
    Document   : crudhabitacion_eliminar
    Created on : 17/08/2023, 15:16:06
    Author     : Ruben Dario
--%>

<%@page import="Controller.HabitacionesDao"%>
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
                HabitacionesDao eliminarH = new HabitacionesDao();
                int resultado = eliminarH.eliminarHabi(id);
                if (resultado == 1) {
                    String informacion = "Registro Eliminado.";
                    String redireccion = "../habitaciones_lista.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%} else {%>
        <script>alert("Registro No Eliminado, Intentalo nuevamente.");
            window.history.back();</script>
            <% }
                }%>
    </body>
</html>
