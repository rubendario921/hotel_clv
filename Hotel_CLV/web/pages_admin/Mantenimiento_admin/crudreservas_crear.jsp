<%-- 
    Document   : crudreservas_crear
    Created on : 23-ago-2023, 0:37:33
    Author     : Ruben Dario 921
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
            if (request.getParameter("nueva_reserva") != null) {
                Integer numDias = Integer.parseInt(request.getParameter("numDias"));
                LocalDateTime reseFReserva = LocalDateTime.now();
//String reseFReservaString = request.getParameter("fReserva");
                //LocalDateTime reseFReserva = LocalDateTime.parse(reseFReservaString.replace(" ", " "));
                String reseFInicioString = request.getParameter("fInicio");
                LocalDateTime reseFInicio = LocalDateTime.parse(reseFInicioString.replace(" ", " "));
                String reseFSalidaString = request.getParameter("fSalida");
                LocalDateTime reseFSalida = LocalDateTime.parse(reseFSalidaString.replace(" ", " "));
                String valorStr = request.getParameter("valor");
                BigDecimal reseVTotal = new BigDecimal(valorStr);
                Integer habiId = Integer.parseInt(request.getParameter("habitacion"));
                Integer estaId = Integer.parseInt(request.getParameter("estado"));
                Integer perId = Integer.parseInt(request.getParameter("persona"));
                Integer consuId = Integer.parseInt(request.getParameter("consumos"));

                ReservasDao crearReserva = new ReservasDao();
                int resultado = crearReserva.crearReserva(numDias, reseFReserva, reseFInicio, reseFSalida, reseVTotal, habiId, estaId, perId, consuId);

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