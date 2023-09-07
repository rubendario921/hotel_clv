<%-- 
    Document   : crudfactura_crear
    Created on : 04-sep-2023, 20:36:01
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.ReservasDao"%>
<%@page import="Controller.FacturasDao"%>
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
            if (request.getParameter("nuevo_pago") != null) {
                LocalDateTime factFEmision = LocalDateTime.now();
                String valorStr = request.getParameter("valorT");
                BigDecimal factVTotal = new BigDecimal(valorStr);
                int factNTransaccion = Integer.parseInt(request.getParameter("transaccion"));
                int reservaId = Integer.parseInt(request.getParameter("codigo"));
                int metodoPagoId = Integer.parseInt(request.getParameter("metodoP"));
                int personaId = Integer.parseInt(request.getParameter("perId"));
                FacturasDao crearFactura = new FacturasDao();
                int resultado = crearFactura.crearFactura(factFEmision, factVTotal, factNTransaccion, reservaId, metodoPagoId, personaId);
                switch (resultado) {
                    case 1:
                        int reseId = Integer.parseInt(request.getParameter("codigo"));

                        ReservasDao cambioEstado = new ReservasDao();
                        int resultadoCambioEstado = cambioEstado.reservadoReserva(reseId);
                        if (resultadoCambioEstado == 1) {
                            String observacion = "Aprobación de Reservas";
                        }

                        String informacion = "La transaccion esta siendo revisada en nuestro sistema. Será notificado de la manera inmediata";
                        String redireccion = "../facturacion_lista.jsp";%>
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