<%--
Document   : facturacion_lista
Created on : 26-ago-2023, 12:21:02
Author     : Ruben Dario 921
--%>
<%@page import="Controller.Facturas"%>
<%@page import="Controller.FacturasDao"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.MetodoPagos"%>
<%@page import="Controller.MetodoPagosDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@include file="template/cliente/header_cliente.jsp" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Facturación</title>
        <style>
            .nombre-estado {
                background-color: #FFD700; 
            }
        </style>
    </head>
    <body>
        <div id="page-wrapper" class="container-fluid">
            <div class="row">
                <div class="col col-auto mx-auto">
                    <h1 class="page-header text-center">
                        <img class="img-fluid oval-image" src="assets/img/banner_img_logo_opcional.jpg" alt=""> Facturación
                    </h1>

                    <div class="panel panel-primary">
                        <div class="panel-heading ">
                            <h3>Facturas Realizadas</h3>
                            <br>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th># de Factura</th>
                                            <th>Fecha Emisión</th>
                                            <th>Valor Cancelado</th>
                                            <th>Número de transacción</th>
                                            <th>Código de Reserva</th>
                                            <th>Método de Pago</th>
                                            <th  class="nombre-estado">Estado del Pago</th>
                                            <th>Visualizar Factura</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                            String id_perfil = String.valueOf(session.getAttribute("perId"));
                                            int id = Integer.parseInt(id_perfil);

                                            // Metodo de Pago
                                            MetodoPagosDao mostrarMetodoP = new MetodoPagosDao();
                                            List<MetodoPagos> metodoPagos = mostrarMetodoP.mostrarListaMetodoPago();

                                            // Estados
                                            EstadosDao mostrarEstados = new EstadosDao();
                                            List<Estados> estados = mostrarEstados.mostrarListaEstados();

                                            FacturasDao mostrarFacturas = new FacturasDao();
                                            List<Facturas> facturas = mostrarFacturas.mostrarListaFacturasXid(id);

                                            for (Facturas factura : facturas) {
                                                int metodoP = factura.getMetodoPagoId();
                                                String nombreMetodoP = "";
                                                for (MetodoPagos metodoPagoF : metodoPagos) {
                                                    if (metodoPagoF.getPagoId() == metodoP) {
                                                        nombreMetodoP = StringEscapeUtils.escapeHtml4(metodoPagoF.getPagoNombre());
                                                        break;
                                                    }
                                                }

                                                int estadoFactu = factura.getEstadoId();
                                                String nombreEstado = "";
                                                for (Estados estado : estados) {
                                                    if (estado.getEstaId() == estadoFactu) {
                                                        nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                        break;
                                                    }
                                                }
                                        %>
                                        <tr>
                                            <td><%= factura.getFactId()%></td>
                                            <td><input type="datetime-local" value="<%= factura.getFactFEmision()%>" class="form form-control" readonly="off"></td>
                                            <td>$ <%= factura.getFactVTotal()%></td>
                                            <td><%= factura.getFactNTransaccion()%></td>
                                            <td><%= factura.getReservaId()%></td>
                                            <td><%= nombreMetodoP%></td>
                                            <td class="nombre-estado"><%= nombreEstado%></td>
                                            <td>
                                                <%
                                                    if (nombreEstado.equals("PENDIENTE")) {%>
                                                    <a href="facturacion_ver.jsp?aceptar=true&id_factura=<%= factura.getFactId()%>" class="btn btn-success"><i class="fas fa-search" title="Ver Factura" name="ver_factu"></i></a>
                                                    <% }%>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="template/cliente/footer_cliente.jsp" %>
    </body>
</html>
