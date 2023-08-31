<%-- 
    Document   : crudconsumos_crear
    Created on : 28/08/2023, 18:16:57
    Author     : USUARIO
--%>

<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>>
<%@page import="Controller.ConsumosDao" %>
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
            if (request.getParameter("nuevo_consumo") != null) {
                String consuNombre = request.getParameter("nombre");
                String consuDetalle = request.getParameter("detalle");
                Integer consuCantidad = Integer.parseInt(request.getParameter("cantidad"));
                BigDecimal consuValor = new BigDecimal(request.getParameter("valor"));
                String consuImagen = request.getParameter("consu_dimg");
                Integer estaId = Integer.parseInt(request.getParameter("estados_esta_id"));

                ConsumosDao crearC = new ConsumosDao();
                int resultado = crearC.crearConsumo(consuNombre, consuDetalle, consuCantidad, consuValor, consuImagen, estaId);
                switch (resultado) {
                    case 1:
                        informacion = "Registro existoso";
                        redireccion = "../consumos_lista.jsp";
                        break;

                    case 2:
                        informacion = "El consumo  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../consumos_crear.jsp";
                        break;
                    case 3:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../consumos_crear.jsp";
                        break;
                    case 4:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../consumos_crear.jsp";
                        break;
                }%>
        <script>mostrarMensaje('<%=informacion%>', '<%=redireccion%>');</script>      
        <% }%>
    </body>
</html>