<%-- 
    Document   : crudpersonas_editar
    Created on : 22-ago-2023, 0:05:37
    Author     : Ruben Dario 921
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="Controller.PersonasDao"%>
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
        <% if (request.getParameter("editar") != null) {
                Integer perId = Integer.parseInt(request.getParameter("personaId"));
                String perNombres = request.getParameter("nombres");
                String perApellidos = request.getParameter("apellidos");

                int tipoDocumento = Integer.parseInt(request.getParameter("tipoDocumento"));
                String pernumDocumento = request.getParameter("numDocumento");

                int prefijosTelefono = Integer.parseInt(request.getParameter("prefijo"));
                String perTelefono = request.getParameter("telefono");
                
                String perCorreo = request.getParameter("correo");
                String perUsuario = request.getParameter("usuario");
                String perClave = request.getParameter("clave");
                String perImagen = request.getParameter("imagen");
                String fregistroString = request.getParameter("fregistro");
                LocalDateTime perFRegistro = LocalDateTime.parse(fregistroString.replace(" ", " "));
                Integer perfilId = Integer.parseInt(request.getParameter("perfil"));
                Integer estaId = Integer.parseInt(request.getParameter("estado"));

                PersonasDao modiPersona = new PersonasDao();
                int resultado = modiPersona.modificarPersona(perId, perNombres, perApellidos, tipoDocumento, pernumDocumento, prefijosTelefono, perTelefono, perCorreo, perUsuario, perClave, perImagen, perFRegistro, perfilId, estaId);

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