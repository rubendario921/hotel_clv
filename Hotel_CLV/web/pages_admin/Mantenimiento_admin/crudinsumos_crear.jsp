<%-- 
    Document   : crudinsumos_crear
    Created on : 16/08/2023, 18:48:50
    Author     : Usuario
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
            if (request.getParameter("nuevo_insumo") != null) {
                String nombre = request.getParameter("nombre");
                String detalle = request.getParameter("detalle");
                String cantidad = request.getParameter("cantidad");
                String valor = request.getParameter("valor");
                String imagen = request.getParameter("imagen");
                String estado = request.getParameter("estado");

                InsumosDao crearI = new InsumosDao();
                int resultado = crearI.crearInsumo(nombre, detalle, cantidad, valor, imagen, estado);
                switch (resultado) {
                    case 1:
                        informacion = "Registro de insumo exitoso";
                        redireccion = "../insumos_lista.jsp";
                        break;
                    case 2:
                        informacion = "El insumo  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../insumos_crear.jsp";
                        break;
                    case 3:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../insumos_crear.jsp";
                        break;
                    case 4:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../insumos_crear.jsp";
                        break;
                }%>
        <script>mostrarMensaje('<%=informacion%>', '<%=redireccion%>');</script>      
            <%}%>         
    </body>
</html>
