<%-- 
    Document   : crudestado_editar
    Created on : 15/08/2023, 15:50:30
    Author     : Ruben Dario
--%>

<%@page import="Controller.EstadosDao"%>
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
            if (request.getParameter("editar") != null) {
                Integer id = Integer.parseInt(request.getParameter("codigo"));
                String letra = request.getParameter("letra");
                String descripcion = request.getParameter("descripcion");
                Integer categoria = Integer.parseInt(request.getParameter("categoria"));

                EstadosDao editarE = new EstadosDao();
                int resultado = editarE.modificarEstado(id, letra, descripcion, categoria);

                switch (resultado) {
                    case 1:
                        String informacion = "Modificación de Estado Exitoso";
                        String redireccion = "../estados_lista.jsp";%>
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