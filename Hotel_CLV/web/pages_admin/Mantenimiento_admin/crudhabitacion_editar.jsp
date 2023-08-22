<%-- 
    Document   : crudhabitacion_editar
    Created on : 17/08/2023, 15:15:51
    Author     : Ruben Dario
--%>

<%@page import="java.math.BigDecimal"%>
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
            if (request.getParameter("editar") != null) {
                Integer id = Integer.parseInt(request.getParameter("codigo"));
                String nombre = request.getParameter("nombre");
                String tipo = request.getParameter("tipo");
                String piso = request.getParameter("piso");
                String depar = request.getParameter("departamento");
                String descripcion = request.getParameter("descripcion");
                String valorStr = request.getParameter("valor");
                BigDecimal valor = new BigDecimal(valorStr);
                String imagen = request.getParameter("imagen");
                Integer insumo = Integer.parseInt(request.getParameter("insumo"));
                Integer estado = Integer.parseInt(request.getParameter("estado"));

                HabitacionesDao modificarH = new HabitacionesDao();
                int resultado = modificarH.modiHabi(id, nombre, tipo, piso, depar, descripcion, valor, imagen, insumo, estado);

                switch (resultado) {
                    case 1:
                        String informacion = "Registro de Perfil Exitoso.";
                        String redireccion = "../habitaciones_lista.jsp";%>
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
