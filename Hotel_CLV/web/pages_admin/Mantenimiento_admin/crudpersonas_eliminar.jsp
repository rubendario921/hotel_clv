<%-- 
    Document   : crudpersonas_eliminar
    Created on : 22/08/2023, 9:25:32
    Author     : Ruben Dario
--%>

<%@page import="Controller.PersonasDao"%>
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
                PersonasDao eliminarPer = new PersonasDao();
                int resultado = eliminarPer.eliminarPersona(id);

                if (resultado == 1) {
                    String informacion = "Registro Eliminado.";
                    String redireccion = "../menu_admin.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <% } else {%> 
        <script>alert("Registro No Eliminado, Intentalo nuevamente.");
            window.history.back();
        </script>
        <% }
            }%>
    </body>
</html>