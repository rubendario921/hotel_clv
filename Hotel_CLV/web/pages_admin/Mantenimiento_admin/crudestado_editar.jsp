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
                Integer estaId = Integer.parseInt(request.getParameter("codigo"));
                String estaLetra = request.getParameter("letra");
                String estaDescripcion = request.getParameter("descripcion");
                Integer estaCateId = Integer.parseInt(request.getParameter("categoria"));
                Integer estaColorNId = Integer.parseInt(request.getParameter("color"));

                EstadosDao editarE = new EstadosDao();
                int resultado = editarE.modificarEstado(estaId, estaLetra, estaDescripcion, estaCateId, estaColorNId);

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