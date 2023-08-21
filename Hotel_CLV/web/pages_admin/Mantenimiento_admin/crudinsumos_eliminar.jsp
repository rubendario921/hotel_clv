<%-- 
    Document   : crudinsumos_eliminar
    Created on : 20/08/2023, 16:38:23
    Author     : Wladimir Campaña
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.InsumosDao" %>
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
        <% if (request.getParameter("eliminar") != null && request.getParameter("eliminar").equals("true")){
         int id = Integer.parseInt(request.getParameter("id"));
         InsumosDao eliminarI = new InsumosDao();
         int resultado = eliminarI.eliminarInsumo(id);
         if (resultado ==1){
             String informacion = "Insumo Eliminado";
             String redireccion = "../insumos_lista";%>     
       
        }
    </body>
</html>
