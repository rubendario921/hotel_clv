<%-- 
    Document   : crudestado_crear
    Created on : 15/08/2023, 12:21:55
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
            if (request.getParameter("nuevo_estado") != null) {
                String letra = request.getParameter("letra");
                String descripcion = request.getParameter("descripcion");
                Integer categoria = Integer.parseInt(request.getParameter("categoria"));

                EstadosDao crearE = new EstadosDao();
                int resultado = crearE.crearEstado(letra, descripcion, categoria);

                switch (resultado) {
                    case 1:
                        String informacion = "Registro de Estado Exitoso.";
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