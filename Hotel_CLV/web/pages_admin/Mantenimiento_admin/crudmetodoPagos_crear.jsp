<%-- 
    Document   : crudmetodoPagos_crear
    Created on : 21/08/2023, 16:10:24
    Author     : Wladimir Campaña
--%>

<%@page import="Controller.MetodoPagosDao"%>
<%@page import="Controller.MetodoPagos"%>
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
            if (request.getParameter("nuevo_metodo") != null) {
                String letra = request.getParameter("letra");
                String nombre = request.getParameter("nombre");

                MetodoPagosDao registrarM = new MetodoPagosDao();
                int resultado = registrarM.crearMetodoPagos(letra, nombre);

                switch (resultado) {
                    case 1:
                        String informacion = "Registro de Método Exitoso.";
                        String redireccion = "../metodoPagos_lista.jsp";%>
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