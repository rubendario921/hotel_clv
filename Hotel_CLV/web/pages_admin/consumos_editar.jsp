<%-- 
    Document   : consumos_editar
    Created on : 28/08/2023, 18:15:27
    Author     : USUARIO
--%>

<%@page import="Controller.Consumos"%>
<%@page import="Controller.FormulariosDao"%>
<%@page import="Controller.ConsumosDao"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="java.util.*"%>
<%@include file="template/header_admin.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>
    //Para obtener los valores de los pagos//
    
    function validarFormulario() {
        var nombre = document.getElementById("nombre").value.trim();
        var detalle = document.getElementById("detalle").value.trim();
        var cantidad = document.getElementById("cantidad").value.trim();
        var valor = document.getElementById("valor").value.trim();
        var imagen = document.getElementById("imagen").value.trim();
        var estados_esta_id = document.getElementById("estados_esta_id").value.trim();
        
        if (nombre === " " || detalle === " " || cantidad === " " || valor === " " || imagen === " " || estados_esta_id === " " ){
         
        alert("Por favor, completar todos los campos");
        return false;
        }
        return true;   
    }
    
</script>
