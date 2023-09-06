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
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col col-auto">
                <h1 class="page-header"> </h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Facturación</h3></td>                                
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>Número de Factura</th>
                                    <th>Fecha Emisión</th>
                                    <th>Valor Cancelado</th>
                                    <th>Número de transacción</th>
                                    <th>Codigo de Reserva</th>          
                                    <th>Metodo de Pago</th>
                                    <th>Estado del Pago</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <% String id_perfil = String.valueOf(session.getAttribute("perId"));
                                    int id = Integer.parseInt(id_perfil);

                                    //Metodo de Pago
                                    MetodoPagosDao mostrarMetodoP = new MetodoPagosDao();
                                    List<MetodoPagos> metodoPagos = mostrarMetodoP.mostrarListaMetodoPago();
                                    //Estados
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
                                        }%>
                                <tr>
                                    <td><%= factura.getFactId()%></td>
                                    <td><%= factura.getFactFEmision()%></td>
                                    <td><%= factura.getFactVTotal()%></td>
                                    <td><%= factura.getFactNTransaccion()%></td>
                                    <td><%= factura.getReservaId()%></td>
                                    <td><%= nombreMetodoP%></td>
                                    <td><%= nombreEstado%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/cliente/footer_cliente.jsp" %>