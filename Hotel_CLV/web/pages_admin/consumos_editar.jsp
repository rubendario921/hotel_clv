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


<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Editar Consumos</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Aqui tu consumo</h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudconsumos_editar.jsp.jsp" method="POST" onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    ConsumosDao mostrarConsumo = new ConsumosDao();
                                    Consumos consumo = mostrarConsumo.mostrarConsumo(id);
                                    if (consumo != null) {%>
                            <label>Codigo: </label><input type="text" name="codigo" id="codigo" value="<%= consumo.getConsuId()%>" class="form form-control"  maxlength="2" readonly="false"/>
                            <br>
                            <label>Nombre: </label><input type="text" name="nombre" id="nombre" value="<%= StringEscapeUtils.escapeHtml4(consumo.getConsuNombre())%>" class="form form-control"  maxlength="20" readonly="false"/>
                            <br>
                            <label>Detalle: </label><input type="text" name="detalle" id="detalle" value="<%= StringEscapeUtils.escapeHtml4(consumo.getConsuDetalle())%>" class="form form-control"  maxlength="20" readonly="false"/>
                            <br>
                            <label>Cantidad: </label><input type="number" name="cantidad" id="cantidad" value="<%= consumo.getConsuCantidad()%>" class="form form-control"  maxlength="" readonly="false"/>
                            <br>
                            <label>Valor: </label><input type="number" name="valor" id="cantidad" value="<%= consumo.getConsuValor()%>" class="form form-control"  maxlength="" readonly="false"/>
                            <br>
                            <label>Imagen: </label><input type="text" name="imagen" id="detalle" value="<%= StringEscapeUtils.escapeHtml4(consumo.getConsuImagen())%>" class="form form-control"  maxlength="" readonly="false"/>
                            <br>
                           
                            <% }
                                }%>
                            <label>Accion: </label>
                            <select name="estados_esta_id" id="estados_esta_id" class="form form-control" required>
                                <option> </option>
                                <option value="1">Recepción</option>
                                <option value="2">Evaluación</option>
                                <option value="3">implementación</option>
                            </select>
                            <br>
                            <a href="consumos_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Editar" name="editar" class=" btn btn-primary"/>                            
                        </form>                           
                    </div>                    
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo-->
<%@include file="template/footer_admin.jsp" %>
