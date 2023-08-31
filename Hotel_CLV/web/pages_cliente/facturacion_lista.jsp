<%-- 
    Document   : facturacion_lista
    Created on : 26-ago-2023, 12:21:02
    Author     : Ruben Dario 921
--%>
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
                                <td><h3>Reservaciones</h3></td>                                
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>Número de Factura</th>
                                    <th>Fecha Emisión</th>
                                    <th>Código de Reserva</th>
                                    <th>Habitación</th>
                                    <th>Consumo Adicionales</th>
                                    <th>Metodo de Pago</th>
                                    <th>Valor Cancelado</th>                                    
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    
                                %>
                                
                                <tr>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/cliente/footer_cliente.jsp" %>