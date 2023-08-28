<%-- 
    Document   : crudcategorias_crear
    Created on : 28/08/2023, 13:57:00
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
            if (request.getParameter("nueva_categoria") != null) {
                String catNombre = request.getParameter("catNombre");
                String catDescripcion = request.getParameter("catDescripcion");

                CategoriasDao crearCate = new CategoriasDao();
                int resultado = crearCate.crearCategoria(catNombre, catDescripcion);
                switch (resultado) {
                    case 1:
                        String informacion = "Registro de Categorias Exitoso.";
                        String redireccion = "../categorias_lista.jsp";%>
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