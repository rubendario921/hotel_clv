<%-- 
    Document   : crear_perfil
    Created on : 13-ago-2023, 14:51:25
    Author     : Ruben Dario 921
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../../template/admin/header_admin.jsp" %>
<!DOCTYPE html>
<form  method="POST" >
    <div>
        <label for="letra">Abreviatura</label>
        <input type="text" name="letra" pacleholde="Ingrese 2 letras de abreviatura" requerid=""/>
    </div>
    <div>
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre" pacleholde="Ingrese el nombre del perfil" requerid=""/>
    </div>
    <div>
        <button type="submit" value="nuevo_perfil" name="nuevo_perfil">Enviar</button>
    </div>
</form>

<%@include file="../../template/admin/footer_admin.jsp" %>