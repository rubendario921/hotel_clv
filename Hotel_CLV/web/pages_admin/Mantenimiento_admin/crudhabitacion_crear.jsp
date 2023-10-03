<%-- 
    Document   : crudhabitacion_crear
    Created on : 17/08/2023, 15:15:35
    Author     : Ruben Dario
--%>

<%@page import="Model.HabitacionInsumosDao"%>
<%@page import="Controller.HabitacionesDao"%>
<%@page import="java.math.BigDecimal"%>
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
            if (request.getParameter("nueva_habitacion") != null) {

                String nombre = request.getParameter("nombre");
                String tipo = request.getParameter("tipo");
                String piso = request.getParameter("piso");
                String depar = request.getParameter("departamento");
                String descripcion = request.getParameter("descripcion");
                String valorStr = request.getParameter("valor");
                BigDecimal valor = new BigDecimal(valorStr);
                String imagen = "assets\\img\\user_default.png";
                Integer estado = Integer.parseInt(request.getParameter("estado"));

                HabitacionesDao crearHabitacion = new HabitacionesDao();
                int resultado = crearHabitacion.crearHabi(nombre, tipo, piso, depar, descripcion, valor, imagen, estado);
                
                HabitacionesDao ultimoregistro = new HabitacionesDao();
                int habiId = ultimoregistro.ultimoregistro();

                String[] idInsumo = request.getParameterValues("insumo");
                
                System.out.println("idInsumo");
                                
                HabitacionInsumosDao registroHabiInsumo = new HabitacionInsumosDao();
                registroHabiInsumo.registrarRelacion(habiId, idInsumo);

                switch (resultado) {
                    case 1:
                        String informacion = "Registro Exitoso";
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