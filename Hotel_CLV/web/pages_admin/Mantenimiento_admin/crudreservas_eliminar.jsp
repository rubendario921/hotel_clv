<%-- 
    Document   : crudreservas_eliminar
    Created on : 23-ago-2023, 0:31:19
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.ReservasDao"%>
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
            if (request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                ReservasDao eliminarR = new ReservasDao();
                int resultado = eliminarR.eliminarReserva(id);
                if (resultado == 1) {
                    String informacion = "Registro Eliminado.";
                    String redireccion = "../reservas_lista.jsp";
        %>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <% } else {%>
        <script>alert("Registro No Eliminado, Intentalo nuevamente.");
            window.history.back();
        </script>
        <% }
            }%>
    </body>
</html>