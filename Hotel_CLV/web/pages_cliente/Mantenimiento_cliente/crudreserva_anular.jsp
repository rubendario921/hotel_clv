<%-- 
    Document   : crudreserva_anular
    Created on : 29-ago-2023, 17:58:05
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.HabitacionesDao"%>
<%@page import="Controller.ReservasDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function mostrarMensaje(informacion, redireccion) {
                alert(informacion);
                window.location.href = redireccion;
            }
        </script>
    </head>
    <body>
        <%
            if (request.getParameter("anular") != null) {
                Integer reseId = Integer.parseInt(request.getParameter("id"));
                Integer habiId = Integer.parseInt(request.getParameter("habiId"));

                ReservasDao anularRese = new ReservasDao();
                int resultado = anularRese.anularReserva(reseId);

                switch (resultado) {
                    case 1:
                         HabitacionesDao cambioEstado = new HabitacionesDao();
                        int cambioDisponible = cambioEstado.cambioDispoHabi(habiId);

                        if (cambioDisponible == 1) {
                            String observacion = "Cambio de manera exitosa";
                        }
                        String informacion = "Reserva Anulada";
                        String redireccion = "../reserva_lista.jsp";
        %>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <%
                break;
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
</html