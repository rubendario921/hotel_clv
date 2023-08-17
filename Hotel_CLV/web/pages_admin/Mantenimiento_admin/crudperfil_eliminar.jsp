<%-- 
    Document   : crudperfil_eliminar
    Created on : 14/08/2023, 11:47:29
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
            if (request.getParameter("eliminar") != null && request.getParameter("eliminar").equals("true")) {
                int id = Integer.parseInt(request.getParameter("id"));
                PerfilesDao eliminarP = new PerfilesDao();
                int resultado = eliminarP.eliminarPefil(id);
                if (resultado == 1) {
                    String informacion = "Registro Eliminado.";
                    String redireccion = "../perfil_lista.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%} else {%>
        <script>alert("Registro No Eliminado, Intentalo nuevamente.");
            window.history.back();</script>
            <%}

                }%>
    </body>
</html>
