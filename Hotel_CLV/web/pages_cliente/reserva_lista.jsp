<%@page import="Controller.Estados"%>
<%@page import="Controller.Consumos"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
<%@page import="Controller.Reservas"%>
<%@page import="Controller.ReservasDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/cliente/header_cliente.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservaciones</title>
    <style>
        .page-header {
            text-align: center;
        }

        .container-fluid {
            margin-top: 20px;
        }

        .table {
            width: 100%;
        }

        .table th, .table td {
            text-align: center;
        }

        .bg-warning {
            background-color: #FFD700;
        }

        .btn-primary, .btn-danger {
            padding: 6px 12px;
        }
    </style>
</head>
<body>
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Reservaciones</h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3>Reservaciones</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Código</th>
                                        <th>Días</th>
                                        <th>Fecha Registro</th>
                                        <th>Fecha Ingreso</th>
                                        <th>Fecha Salida</th>
                                        <th>Valor a Cancelar</th>
                                        <th>Habitación</th>
                                        <th>Descripción</th>
                                        <th>Consumo Adicionales</th>
                                        <th>Estado</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String id_perId = String.valueOf(session.getAttribute("perId"));
                                        int id = Integer.parseInt(id_perId);

                                        HabitacionesDao mostrarHabi = new HabitacionesDao();
                                        List<Habitaciones> habitaciones = mostrarHabi.mostrarListaHabi();

                                        ConsumosDao mostrarConsu = new ConsumosDao();
                                        List<Consumos> consumos = mostrarConsu.mostrarListaConsumos();

                                        EstadosDao mostrarEsta = new EstadosDao();
                                        List<Estados> estados = mostrarEsta.mostrarListaEstados();

                                        ReservasDao mostrarReservas = new ReservasDao();
                                        List<Reservas> reservas = mostrarReservas.mostrarListaReservaXid(id);
                                        for (Reservas reserva : reservas) {

                                            int habiReserva = reserva.getHabiId();
                                            String nombreHabitacion = "";

                                            for (Habitaciones habitacion : habitaciones) {
                                                if (habitacion.getHabiId() == habiReserva) {
                                                    String depar = StringEscapeUtils.escapeHtml4(habitacion.getHabiDepar());
                                                    String nombre = StringEscapeUtils.escapeHtml4(habitacion.getHabiNombre());
                                                    nombreHabitacion = nombre + ' ' + depar;
                                                    break;
                                                }
                                            }

                                            int consuReserva = reserva.getConsuId();
                                            String nombreConsumo = "";

                                            for (Consumos consumo : consumos) {
                                                if (consumo.getConsuId() == consuReserva) {
                                                    nombreConsumo = StringEscapeUtils.escapeHtml4(consumo.getConsuNombre());
                                                    break;
                                                }
                                            }

                                            int estadoReserva = reserva.getEstaId();
                                            String nombreEstado = "";

                                            for (Estados estado : estados) {
                                                if (estado.getEstaId() == estadoReserva) {
                                                    nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                }
                                            }
                                    %>
                                    <tr>
                                        <td><%= reserva.getReseId()%></td>
                                        <td><%= reserva.getNumDias()%></td>
                                        <td><label><%= reserva.getReseFReserva()%></label></td>
                                        <td><%= reserva.getReseFInicio()%></td>
                                        <td><%= reserva.getReseFSalida()%></td>
                                        <td class="bg-warning"><b>$<%= reserva.getReseVTotal()%></b></td>
                                        <td><%= reserva.getHabiId()%></td>
                                        <td><%= nombreHabitacion%></td>
                                        <td><%= nombreConsumo%></td>
                                        <td class="bg-success"><b><%= nombreEstado%></b></td>
                                        <td>
                                            <%
                                                if (nombreEstado.equals("PENDIENTE")) {%>
                                            <a href="aceptar_pago.jsp?aceptar=true&id_reserva=<%= reserva.getReseId()%>" class="btn btn-primary"><i class="fa fa-tags" title="Aceptar" name="aceptar"></i></a>
                                                <% }%>
                                                <%
                                                    if (nombreEstado.equals("PENDIENTE")) {%>
                                            <a href="Mantenimiento_cliente/crudreserva_anular.jsp?anular=true&id=<%= reserva.getReseId()%>&habiId=<%= reserva.getHabiId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Anular" name="anular"></i></a>
                                                <% }
                                                %>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<%@include file="template/cliente/footer_cliente.jsp" %>
