<%-- 
    Document   : crudconsumos_editar
    Created on : 28/08/2023, 18:17:19
    Author     : USUARIO
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="Controller.ConsumosDao" %>
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
                Integer consuId = Integer.parseInt(request.getParameter("codigo"));
                String consuNombre = request.getParameter("nombre");
                String consuDetalle = request.getParameter("detalle");
                Integer consuCantidad = Integer.parseInt(request.getParameter("cantidad"));
                BigDecimal consuValor = new BigDecimal(request.getParameter("valor"));
                String consuImagen = request.getParameter("consu_dimg");
                Integer estaId = Integer.parseInt(request.getParameter("estados_esta_id"));

                ConsumosDao editarC = new ConsumosDao();
                int resultado = editarC.modiConsumo(consuId, consuNombre, consuDetalle, consuCantidad, consuValor, consuImagen, estaId);

                switch (resultado) {
                    case 1:
                        informacion = "Modificación de Mensaje Exitoso";
                        redireccion = "../consumos_lista.jsp";
                        break;
                    case 2:
                        informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../consumos_editar.jsp";
                        break;
                    case 3:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../consumos_editar.jsp";
                        break;
                    default:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../consumos_editar.jsp";
                        break;
                }%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <% }%>
    </body>
</html>
