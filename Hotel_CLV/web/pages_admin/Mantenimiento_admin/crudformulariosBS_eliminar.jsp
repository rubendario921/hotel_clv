<%-- 
    Document   : crudformulariosBS_eliminar
    Created on : 24/08/2023, 21:09:41
    Author     : Usuario
--%>

<%@page import="Controller.FormulariosDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function mostrarMensaje(informacion, redireccion){
                alert(informacion);
                window.location.href = redireccion;
            }
        </script>
    </head>
    <body>
        
     <% if (request.getParameter("eliminar") != null && request.getParameter("eliminar").equals("true")){
         int id = Integer.parseInt(request.getParameter("id"));
         FormulariosDao eliminarF = new FormulariosDao();
         int resultado = eliminarF.eliminarFormularioBS(id);
         if (resultado ==1){
             String informacion = "Sugerencia Eliminada";
             String redireccion = "../formulariosBS_lista.jsp";%>     
             <script> mostrarMensaje ('<%= informacion%>', '<%= redireccion%>');</script>
        <%} else {%>
        <script>alert("Mensaje NO Eliminado, Intentalo nuevamente.");
            window.history.back();</script>
        <%}%>
        <%}%>
    </body>
</html>
