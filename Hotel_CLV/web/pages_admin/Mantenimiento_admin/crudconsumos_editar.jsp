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
                Integer consuId = Integer.parseInt(request.getParameter("id"));
                String consuNombre = request.getParameter("nombre");
                String consuDetalle = request.getParameter("correo");
                Integer consuCantidad = Integer.parseInt(request.getParameter("cantidad"));
                BigDecimal consuValor = new BigDecimal(request.getParameter("valor"));
                String consuImagen = request.getParameter("imagen");
                Integer estaId = Integer.parseInt(request.getParameter("estados_esta_id"));

                ConsumosDao editarC = new ConsumosDao();
                int resultado = editarC.modiConsumo(consuId, consuNombre, consuDetalle, consuCantidad, consuValor, consuImagen, estaId);

                switch (resultado) {
                    case 1:
                        informacion = "Registro Modificado";
                        redireccion = "../cosumos_editar.jsp";%>
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