<%-- 
    Document   : crudinsumos_crear
    Created on : 16/08/2023, 18:48:50
    Author     : Wladimir Campaña
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="Controller.InsumosDao"%>
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
            if (request.getParameter("nuevo_insumo") != null) {
                String nombre = request.getParameter("nombre");
                String detalle = request.getParameter("detalle");
                Integer cantidad = Integer.parseInt(request.getParameter("cantidad"));
                String valorStr = request.getParameter("valor");
                BigDecimal valor = new BigDecimal(valorStr);
                String imagen = "assets\\img\\user_default.png";
                Integer estado = Integer.parseInt(request.getParameter("estado"));

                InsumosDao crearI = new InsumosDao();
                int resultado = crearI.crearInsumo(nombre, detalle, cantidad, valor, imagen, estado);
                switch (resultado) {
                    case 1:
                        String informacion = "Registro Exitoso";
                        String redireccion = "../insumos_lista.jsp";%>
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