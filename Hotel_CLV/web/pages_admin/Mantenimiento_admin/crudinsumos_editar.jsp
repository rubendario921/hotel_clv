<%-- 
    Document   : crudinsumos_editar
    Created on : 19/08/2023, 17:24:03
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
            if (request.getParameter("editar") != null) {
                Integer insu_id = Integer.parseInt(request.getParameter("codigo"));
                String insu_nombre = request.getParameter("nombre");
                String insu_detalle = request.getParameter("detalle");
                Integer insu_cantidad = Integer.parseInt(request.getParameter("cantidad"));
                String valorStr = request.getParameter("valor");
                BigDecimal insu_valor = new BigDecimal(valorStr);
                String insu_dimg = request.getParameter("insu_dimg");
                Integer estados_esta_id = Integer.parseInt(request.getParameter("estados"));

                InsumosDao editarIsumo = new InsumosDao();
                int resultado = editarIsumo.modificarInsumo(insu_id, insu_nombre, insu_detalle, insu_cantidad, insu_valor, insu_dimg, estados_esta_id);

                switch (resultado) {
                    case 1:
                        String informacion = "Modificacion Exitosa.";
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