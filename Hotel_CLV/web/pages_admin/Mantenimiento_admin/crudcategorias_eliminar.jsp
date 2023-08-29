<%-- 
    Document   : crudcategorias_eliminar
    Created on : 28/08/2023, 12:50:50
    Author     : Ruben Dario
--%>

<%@page import="Controller.CategoriasDao"%>
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
                Integer id_cate = Integer.parseInt(request.getParameter("id_cate"));
                CategoriasDao eliminarCate = new CategoriasDao();
                int resultado = eliminarCate.eliminarCategoria(id_cate);
                if (resultado == 1) {
                    String informacion = "Registro Eliminado.";
                    String redireccion = "../categorias_lista.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%} else {%>
        <script>alert("Registro No Eliminado, Intentalo nuevamente.");
            window.history.back();</script>
            <% }
            }%>
    </body>
</html>
