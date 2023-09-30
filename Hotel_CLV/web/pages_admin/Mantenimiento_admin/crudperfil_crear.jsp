<%-- 
    Document   : crudregistrar_perfil
    Created on : 13-ago-2023, 14:57:23
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.PerfilesDao"%>
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
            if (request.getParameter("nuevo_perfil") != null) {
                String perfletra = request.getParameter("letra");
                String perfnombre = request.getParameter("nombre");
                int perfcolorId = Integer.parseInt(request.getParameter("color"));

                PerfilesDao registrarP = new PerfilesDao();
                int resultado = registrarP.crearPerfil(perfletra, perfnombre, perfcolorId);

                switch (resultado) {
                    case 1:
                        String informacion = "Registro de Perfil Exitoso.";
                        String redireccion = "../perfil_lista.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <% break;
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