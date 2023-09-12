<%-- 
    Document   : crudreservas_editar
    Created on : 12/09/2023, 16:00:05
    Author     : Ruben Dario
--%>

<%@page import="Controller.ReservasDao"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.time.LocalDateTime"%>
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
            if (request.getParameter("editar") != null) {
                int reseId = Integer.parseInt(request.getParameter("id_reserva"));
                int numDias = Integer.parseInt(request.getParameter("valorD"));

                String fReservaString = request.getParameter("fReserva");
                LocalDateTime reseFReserva = LocalDateTime.parse(fReservaString.replace(" ", " "));

                String fInicioString = request.getParameter("fInicio");
                LocalDateTime reseFInicio = LocalDateTime.parse(fInicioString.replace(" ", " "));

                String fSalidaString = request.getParameter("fSalida");
                LocalDateTime reseFSalida = LocalDateTime.parse(fSalidaString.replace(" ", " "));

                String vTotalString = request.getParameter("VTotal");
                BigDecimal reseVTotal = new BigDecimal(vTotalString);

                int habiId = Integer.parseInt(request.getParameter("id_habi"));
                int consuId = Integer.parseInt(request.getParameter("consumo"));
                int perId = Integer.parseInt(request.getParameter("personaId"));
                int estaId = Integer.parseInt(request.getParameter("estado"));

                ReservasDao modiReserva = new ReservasDao();
                int resultado = modiReserva.modificarReserva(reseId, numDias, reseFReserva, reseFInicio, reseFSalida, reseVTotal, habiId, estaId, perId, consuId);

                switch (resultado) {
                    case 1:
                        String informacion = "Registro Exitoso.";
                        String redireccion = "../reservas_lista.jsp";%>
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