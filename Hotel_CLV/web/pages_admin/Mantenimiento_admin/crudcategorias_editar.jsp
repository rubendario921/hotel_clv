<%-- 
    Document   : crudcategorias_editar
    Created on : 28/08/2023, 15:06:54
    Author     : Ruben Dario
--%>

<%@page import="Controller.CategoriasDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function mostrarMensaje(informacion, redireccion) {
                alert(informacion);
                window.location.href = redireccion;
            }
        </script>
    </head>
    <body>
        <%
            if (request.getParameter("editar") != null) {
                Integer catId = Integer.parseInt(request.getParameter("codigo"));
                String catNombre = request.getParameter("nombre");
                String catDescripcion = request.getParameter("descripcion");

                CategoriasDao editarCategorias = new CategoriasDao();
                int resultado = editarCategorias.modificarCategoria(catId, catNombre, catDescripcion);

                switch (resultado) {
                    case 1:
                        String informacion = "Registro Modificado";
                        String redireccion = "../categorias_lista.jsp";
        %>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%break;
            case 1062:%>
        <script>alert("El registro  ya existe en la base de datos, intente nuevamente.");
            window.history.back();
        </script>    
        <%break;
            case 1048:%>
        <script>alert("Los campos no puede estar vacios, intente nuevamente.");
            window.history.back();
        </script>              
        <%break;
            default:%>
        <script>alert("Registro Incorrecto, intente nuevamente");
            window.history.back();
        </script>             
        <%break;
                }
            }%>
    </body>
</html>