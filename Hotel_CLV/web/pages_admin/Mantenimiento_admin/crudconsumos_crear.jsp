<%-- 
    Document   : crudconsumos_crear
    Created on : 28/08/2023, 18:16:57
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
            if (request.getParameter("nuevo_consumo") != null) {
                String consuNombre = request.getParameter("nombre");
                String consuDetalle = request.getParameter("detalle");
                Integer consuCantidad = Integer.parseInt(request.getParameter("cantidad"));
                String valorStr = request.getParameter("valor");
                BigDecimal consuValor = new BigDecimal(valorStr);
                String consuImagen = "assets\\img\\user_default.png";
                Integer estaId = Integer.parseInt(request.getParameter("estado"));

                ConsumosDao crearC = new ConsumosDao();
                int resultado = crearC.crearConsumo(consuNombre, consuDetalle, consuCantidad, consuValor, consuImagen, estaId);
                switch (resultado) {
                    case 1:
                        String informacion = "Registro Exitoso";
                        String redireccion = "../consumos_lista.jsp";%>
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