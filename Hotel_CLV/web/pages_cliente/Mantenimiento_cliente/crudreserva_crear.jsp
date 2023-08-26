<%-- 
    Document   : crudreserva_crear
    Created on : 26-ago-2023, 3:28:27
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.ReservasDao"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>

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
            if (request.getParameter("reservar") != null) {
                Integer numDias = Integer.parseInt(request.getParameter("numDias"));

                String finicioString = request.getParameter("fInicio");
                String fSalidaString = request.getParameter("fSalida");
                LocalDateTime reseFReserva = LocalDateTime.now();
                
                
                LocalDateTime reseFInicio = LocalDateTime.parse(finicioString);
                LocalDateTime reseFSalida = LocalDateTime.parse(fSalidaString);

                String valorStr = request.getParameter("valorT");
                BigDecimal reseVTotal = new BigDecimal(valorStr);
                Integer habiId = Integer.parseInt(request.getParameter("habiId"));
                Integer estaId = 7;
                Integer perId = Integer.parseInt(request.getParameter("perId"));
                Integer consuId = Integer.parseInt(request.getParameter("consumo"));

                ReservasDao crearReserva = new ReservasDao();
                int resultado = crearReserva.crearReserva(numDias, reseFReserva, reseFInicio, reseFSalida, reseVTotal, habiId, estaId, perId, consuId);

                switch (resultado) {
                    case 1:
                        String informacion = "Registro Exitoso";
                        String redireccion = "../reserva_lista.jsp";%>
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