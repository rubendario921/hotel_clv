<%-- 
    Document   : crumetodoPagos_editar
    Created on : 21/08/2023, 16:24:01
    Author     : Usuario
--%>
<%@page import="Controller.MetodoPagosDao"%>
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
                String nombre = request.getParameter("nombre");

                MetodoPagosDao modificarM = new MetodoPagosDao();
                int resultado = modificarM.modificarMetodoPagos(id, letra, nombre);

                switch (resultado) {
                    case 1:
                        String informacion = "Metodo de Pago Modificado Correctamente.";
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