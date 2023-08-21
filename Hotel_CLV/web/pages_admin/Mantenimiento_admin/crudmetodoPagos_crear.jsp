<%-- 
    Document   : crudmetodoPagos_crear
    Created on : 21/08/2023, 16:10:24
    Author     : Wladimir Campaña
--%>

<%@page import="Controller.MetodoPagosDao"%>
<%@page import="Controller.MetodoPagos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var letra = document.getElementById("letra").value.trim();
        var nombre = document.getElementById("nombre").value.trim();

        // Validar campos obligatorios
        if (letra === "" || nombre === "" ) {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }      
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>

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
            if (request.getParameter("nuevo_metodo") != null) {
                String letra = request.getParameter("letra");
                String nombre = request.getParameter("nombre");

                MetodoPagosDao registrarM = new MetodoPagosDao();
                int resultado = registrarM.crearMetodoPagos(letra, nombre);

                switch (resultado) {
                    case 1:
                        informacion = "Registro de Método Exitoso.";
                        redireccion = "../metodoPagos_lista.jsp";
                        break;
                    case 1062:
                        informacion = "El registro  ya existe en la base de datos, intente nuevamente.";
                        redireccion = "../metodoPagos_crear.jsp";
                        break;
                    case 1048:
                        informacion = "Los campos no puede estar vacios, intente nuevamente.";
                        redireccion = "../metodoPagos_crear.jsp";
                        break;
                    default:
                        informacion = "Registro Incorrecto, intente nuevamente.";
                        redireccion = "../metodoPagos_crear.jsp";
                        break;
                }%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%
            }%>
    </body>
</html>