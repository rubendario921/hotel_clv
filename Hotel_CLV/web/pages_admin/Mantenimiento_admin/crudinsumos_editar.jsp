<%-- 
    Document   : crudinsumos_editar
    Created on : 19/08/2023, 17:24:03
    Author     : Wladimir Campaña
--%>

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
            String informacion = "";
            String redireccion = "";

            if (request.getParameter("editar") != null) {
                Integer insu_id = Integer.parseInt(request.getParameter("codigo"));
                String insu_nombre = request.getParameter("nombre");
                String insu_detalle = request.getParameter("detalle");
                String insu_cantidad = request.getParameter("cantidad");
                String insu_valor = request.getParameter("valor");
                String insu_dimg = request.getParameter("insu_dimg");
                Integer estados_esta_id = Integer.parseInt(request.getParameter("estados_esta_id"));

                InsumosDao editarI = new InsumosDao();
                int resultado = editarI.modificarInsumo(insu_id, insu_nombre, insu_detalle, insu_cantidad, insu_valor, insu_dimg, estados_esta_id);

                switch (resultado) {
                    case 1:
                        informacion = "Modificación de Insumo Exitoso";
                        redireccion = "../insumos_lista.jsp";
                        break;
                    case 2:
                        informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../insumos_editar.jsp";
                        break;
                    case 3:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../insumos_editar.jsp";
                        break;
                    default:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../insumos_editar.jsp";
                        break;
                }%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%}%>
    </body>
</html>