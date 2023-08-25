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
            String informacion = "";
            String redireccion = "";

            if (request.getParameter("editar") != null) {
                Integer formu_id = Integer.parseInt(request.getParameter("codigo"));
                String formu_nombre = request.getParameter("nombre");
                String formu_correo = request.getParameter("correo");
                String formu_telefono = request.getParameter("telefono");
                String formu_asunto = request.getParameter("asunto");
                String formu_mensaje = request.getParameter("mensaje");
                String formu_ciudad = request.getParameter("ciudad");
                Integer estados_esta_id = Integer.parseInt(request.getParameter("estados_esta_id"));

                FormulariosDao editarF = new FormulariosDao();
                int resultado = editarF.modificarFormu(formu_id, formu_nombre, formu_correo, formu_telefono, formu_asunto, formu_mensaje, formu_ciudad, estados_esta_id);

                switch (resultado) {
                    case 1:
                        informacion = "Modificación de Mensaje Exitoso";
                        redireccion = "../formulariosBS_lista.jsp";
                        break;
                    case 2:
                        informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../formulariosBS_editar.jsp";
                        break;
                    case 3:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../formulariosBS_editar.jsp";
                        break;
                    default:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../formulariosBS_editar.jsp";
                  break;
          }%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%}%>
    </body>
</html>
