<%-- 
    Document   : crudformulariosBS_editar
    Created on : 25/08/2023, 14:44:52
    Author     : Usuario
--%>

<%@page import="Controller.FormulariosDao" %>
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
                int formu_id = Integer.parseInt(request.getParameter("codigo"));
                String formu_nombre = request.getParameter("nombre");
                String formu_correo = request.getParameter("correo");
                String formu_telefono = request.getParameter("telefono");
                String formu_asunto = request.getParameter("asunto");
                String formu_mensaje = request.getParameter("mensaje");
                String formu_ciudad = request.getParameter("ciudad");
                String formu_observacion = request.getParameter("observacion");
                int estados_esta_id = Integer.parseInt(request.getParameter("estados"));

                FormulariosDao editarF = new FormulariosDao();
                int resultado = editarF.modificarFormu(formu_id, formu_nombre, formu_correo, formu_telefono, formu_asunto, formu_mensaje, formu_ciudad, formu_observacion, estados_esta_id);

                switch (resultado) {
                    case 1:
                        String informacion = "Ticket Modificado";
                        String redireccion = "../formulariosBS_lista.jsp";%>
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