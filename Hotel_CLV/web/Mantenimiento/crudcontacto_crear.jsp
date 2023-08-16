<%-- 
    Document   : crudregistrar_formulario
    Created on : 27-jul-2023, 18:05:43
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.FormulariosDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            if (request.getParameter("nuevo_formulario") != null) {
                String nombre = request.getParameter("nombre");
                String correo = request.getParameter("correo");
                String telefono = request.getParameter("telefono");
                String asunto = request.getParameter("asunto");
                String mensaje = request.getParameter("mensaje");
                String ciudad = request.getParameter("ciudad");

                FormulariosDao registrarF = new FormulariosDao();
                int resultado = registrarF.registrarFormu(nombre, correo, telefono, asunto, mensaje, ciudad);

                if (resultado == 1) {
                    String informacion = "Registro Exitoso, Nos comunicaremos con Ud. en menos de 24 horas";
                    String redireccion = "../index.jsp";
        %>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script> 
        <%} else {%>
        <script>alert("Registro Incorrecto, Intentalo nuevamente.");
            window.history.back(); // Regresa a la página anterior después del inicio de sesión incorrecto</script>
            <%}
               }%>        
    </body>
</html>