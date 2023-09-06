<%--
    Document   : habitaciones
    Created on : 23-jul-2023, 21:05:46
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.Habitaciones"%>
<%@page import="java.util.List"%>
<%@page import="Controller.HabitacionesDao"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<%@include file="template/menu/header_menu.jsp" %>
<div class="container">
    <div class="text-center my-5">
        <h2>Nuestras Habitaciones</h2>
        <p>Descubre nuestras cómodas habitaciones y disfruta de una estadía inolvidable en nuestro hotel.</p>
    </div>
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">             
            <%
                HabitacionesDao mostar_habitaciones = new HabitacionesDao();
                List<Habitaciones> habitaciones = mostar_habitaciones.mostrarMenuHabi();
                for (int i = 0; i < habitaciones.size(); i++) {%>
            <li data-target="#carouselExampleCaptions" data-slide-to="<%= i%>" <%= (i == 0) ? "class='active'" : ""%>></li>
                <% }%>
        </ol>
        <div class="carousel-inner">
            <%
                for (int i = 0; i < habitaciones.size(); i++) {
                    Habitaciones habitacion = habitaciones.get(i);
            %>
            <div class="carousel-item <%= (i == 0) ? "active" : ""%>">
                <img src="<%= StringEscapeUtils.escapeHtml4(habitacion.getHabiImg())%>" class="d-block w-100" alt="450" height="450" width="450">
                <div class="carousel-caption d-none d-md-block">
                    <h5><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiNombre())%></h5>
                    <!--<p><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiTipo())%></p>-->
                    <p><%= StringEscapeUtils.escapeHtml4(habitacion.getHabiDescripcion())%></p>
                </div>
            </div>
            <% }%>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Siguiente</span>
        </a>
    </div>
</div>
            <br>
            <br>
<%@include file="template/menu/footer_menu.jsp" %>
