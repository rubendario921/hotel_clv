<%-- 
    Document   : crudformulariosBS_crear
    Created on : 28/08/2023, 15:16:36
    Author     : Wladimir Campaña
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
            String informacion = "";
            String redireccion = "";
            if (request.getParameter("nuevo_mensaje") != null) {
                String nombre = request.getParameter("nombre");
                String correo = request.getParameter("correo");
                String telefono = request.getParameter("telefono");
                String asunto = request.getParameter("asunto");
                String mensaje = request.getParameter("mensaje");
                String ciudad = request.getParameter("ciudad");
                Integer estado = Integer.parseInt(request.getParameter("estados_esta_id"));

                FormulariosDao crearF = new FormulariosDao();
                int resultado = crearF.registrarFormu(nombre, correo, telefono, asunto, mensaje, ciudad, estado);
                switch (resultado) {
                    case 1:
                        informacion = "Registro exitoso";
                        redireccion = "../formulariosBS_lista.jsp";
                        break;
                    case 2:
                        informacion = "El insumo  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../formulariosBS_crear.jsp";
                        break;
                    case 3:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../formulariosBS_crear.jsp";
                        break;
                    case 4:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../formulariosBS_crear.jsp";
                     break;
             }%>
        <script>mostrarMensaje('<%=informacion%>', '<%=redireccion%>');</script>      
        <%}%>         
    </body>
</html>
