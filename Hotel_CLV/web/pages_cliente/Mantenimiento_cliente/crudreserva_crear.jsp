<%-- 
    Document   : crudreserva_crear
    Created on : 26-ago-2023, 3:28:27
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.ConsumosDao"%>
<%@page import="Controller.HabitacionesDao"%>
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
                int numDias = Integer.parseInt(request.getParameter("numDias"));

                LocalDateTime reseFReserva = LocalDateTime.now();

                String finicioString = request.getParameter("fInicio");
                LocalDateTime reseFInicio = LocalDateTime.parse(finicioString);

                String fSalidaString = request.getParameter("fSalida");
                LocalDateTime reseFSalida = LocalDateTime.parse(fSalidaString);

                int habiId = Integer.parseInt(request.getParameter("habiId"));//Cambio de Estado de la Habitacion

                int perId = Integer.parseInt(request.getParameter("perId"));

                int consuId = Integer.parseInt(request.getParameter("consumoHabi"));

                //Realizar el calculo numDias *(valorHabi + consumoHabi)
                int consumoId = Integer.parseInt(request.getParameter("consumoHabi"));
                ConsumosDao consumoValorHabi = new ConsumosDao();
                BigDecimal consumoValor = consumoValorHabi.mostrarValorConsumo(consumoId);

                BigDecimal habitacionValor = new BigDecimal(request.getParameter("valorHabi"));
                // Calcular reseVTotal
                BigDecimal reseVTotal = habitacionValor.add(consumoValor).multiply(new BigDecimal(numDias));

                int resultado = 0;
                if (reseFSalida.isAfter(reseFInicio)) {
                    ReservasDao crearReserva = new ReservasDao();
                    resultado = crearReserva.crearReserva(numDias, reseFReserva, reseFInicio, reseFSalida, reseVTotal, habiId, perId, consuId);
                } else {
                    resultado = 10;
                }

                switch (resultado) {
                    case 1:
                        HabitacionesDao cambioEstado = new HabitacionesDao();
                        int cambioP = cambioEstado.cambioPendienteHabi(habiId);

                        if (cambioP == 1) {
                            String Observacion = "Cambio de manera exitosa";
                        }
                        String informacion = "Registro Exitoso";
                        String redireccion = "../reserva_lista.jsp";%>
        <script>mostrarMensaje('<%= informacion%>', '<%= redireccion%>');</script>
        <% break;
            case 10:%>
        <script>alert("La fechas entre el CheckIN y el CheckOut no son las correctas. Intente nuevamente");
            window.history.back();
        </script>
        <% break;
            case 1062:%>
        <script>alert("El registro  ya existe en la base de datos, intente nuevamente.");
            window.history.back();
        </script>    
        <% break;
            case 1048:%>
        <script>alert("Los campos no puede estar vacios, intente nuevamente.");
            window.history.back();
        </script>              
        <% break;
            default:%>
        <script>alert("Registro Incorrecto, intente nuevamente");
            window.history.back();
        </script>             
        <% break;
                }
            }%>
    </body>
</html>