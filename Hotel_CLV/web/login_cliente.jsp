<%-- 
    Document   : login_cliente
    Created on : 23/07/2023, 22:43:49
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="template/menu/header_menu.jsp" %>
<div align="center">
    <h1>Inicio de Sesion</h1>
    <form action="procesos/carga_datos_cliente.jsp" method="POST">

        <div class="input-group mb-3">
            <span class="input-group-text" id="correo">Correo Electronico</span>
            <input type="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="correo" id="correo" placeholder="ejemplo@hoteldeluxe.com">
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text" id="password">Contraseña</span>
            <input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  name="password" id="password" placeholder="Debe tener entre 8 y 20 caracteres.
                   ">
        </div>
        <div>
            <button type="submit"class="btn btn-success">
                <span name="ingreso_cliente" value="ingreso_cliente">Iniciar Sesion</span>
            </button>
        </div>
    </form>
</div>
<%@include file="template/menu/footer_menu.jsp" %>