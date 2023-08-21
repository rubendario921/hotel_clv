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
                Integer id = Integer.parseInt(request.getParameter("codigo"));
                String nombre = request.getParameter("nombre");
                String detalle = request.getParameter("detalle");
                String cantidad = request.getParameter("cantidad");
                String valor = request.getParameter("valor");
                String dimg = request.getParameter("insu_dimg");
               Integer esta_id = Integer.parseInt(request.getParameter("estados_esta_id"));
                       
                       InsumosDao editarI = new InsumosDao();
                int resultado = editarI.modificarInsumo(id, nombre, detalle, cantidad, valor, dimg, esta_id);

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