<%-- 
    Document   : crudpersonas_crear
    Created on : 20-jul-2023, 12:08:52
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.PersonasDao"%>
<%@page import="java.time.LocalDateTime"%>
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
            if (request.getParameter("nueva_persona") != null) {
                String perNombres = request.getParameter("nombres");
                String perApellidos = request.getParameter("apellidos");
                
                int tipoDocumento = Integer.parseInt(request.getParameter("tipoDocumento"));
                String pernumDocumento = request.getParameter("numDocumento");
                
                int prefijosTelefono = Integer.parseInt(request.getParameter("prefijo"));
                String perTelefono = request.getParameter("telefono");
                
                String perCorreo = request.getParameter("correo");
                String perUsuario = request.getParameter("usuario");
                String perClave = request.getParameter("clave");
                String perImagen = "assets\\img\\user_default.png";
               
                Integer perfilId = Integer.parseInt(request.getParameter("perfil"));
                
                 String fregistroString = request.getParameter("fregistro");
                LocalDateTime perFRegistro = LocalDateTime.parse(fregistroString.replace(" ", " "));

                PersonasDao crearP = new PersonasDao();
                int resultado = crearP.crearPersona(perNombres, perApellidos, tipoDocumento, pernumDocumento, prefijosTelefono, perTelefono, perCorreo, perUsuario, perClave, perImagen, perFRegistro, perfilId);

                switch (resultado) {
                    case 1:
                        String informacion = "Registro Exitoso.";
                        String redireccion = "../menu_admin.jsp";%>
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