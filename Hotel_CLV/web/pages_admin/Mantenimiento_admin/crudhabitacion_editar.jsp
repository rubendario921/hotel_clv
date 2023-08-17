<%-- 
    Document   : crudhabitacion_editar
    Created on : 17/08/2023, 15:15:51
    Author     : Ruben Dario
--%>

<%@page import="Controller.HabitacionesDao"%>
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
                Integer id = Integer.parseInt(request.getParameter("codigo"));
                String nombre = request.getParameter("nombres");

                HabitacionesDao modificarH = new HabitacionesDao();
                int resultado = modificarH.modiHabi(id, nombre, tipo, piso, depar, descripcion, valor, imagen, insumo, estado);
                switch (resultado) {
                    case 1:
                        informacion = "Registro de Perfil Exitoso.";
                        redireccion = "../habitaciones_lista.jsp";
                        break;
                    case 1062:
                        informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../habitaciones_editar.jsp";
                        break;
                    case 1048:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../habitaciones_editar.jsp";
                        break;
                    default:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../habitaciones_editar.jsp";
                        break;
                }%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>                
        <%}%>
    </body>
</html>
