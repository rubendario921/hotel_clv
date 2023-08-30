<%-- 
    Document   : insumos_lista
    Created on : 16/08/2023, 9:44:21
    Author     : Wladimir Campaña
--%>

<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="Controller.Insumos"%>
<%@page import="java.util.*"%>
<%@page import="Controller.InsumosDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario(){
    var codigo = document.getElementById("codigo").value.trim();
    var nombre = document.getElementById("nombre").value.trim();
    var detalle = document.getElementById("detalle").value.trim();
    var cantidad = document.getElementById("cantidad").value.trim();
    var valor = document.getElementById("valor").value.trim();
    var imagen = document.getElementById("imagen").value.trim();
    var estados = document.getElementById("estados").value.trim();
    var accion = document.getElementById("accion").value.trim();
    if (codigo === "" || nombre === "" || detalle === "" || cantidad === "" || valor === "" || imagen === "" || estados === "" || accion === "" || ) {

    alert("Por favor, complete todos los campos.");
    return false; // Detener el envío del formulario
    }
    return true; // Permitir el envío del formulario si todos los campos están llenos
    }

</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Insumos del Hotel</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista de Insumos</h3></td>
                                <td aling="rigth"><a href="insumos_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Detalle</th>
                                    <th>Cantidad</th>
                                    <th>Valor</th>
                                    <th>Imagen</th>
                                    <th>Estados</th>
                                    <th>Accion</th>                                        
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    InsumosDao lista_insumos = new InsumosDao();
                                    List<Insumos> insumos = lista_insumos.mostrarListaInsumos();
                                    for (Insumos insumo : insumos) {%>
                                <tr>
                                    <td><%=insumo.getInsuId()%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(insumo.getInsuNombre())%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(insumo.getInsuDetalle())%></td>
                                    <td><%=insumo.getInsuCantidad()%></td>
                                    <td><%=insumo.getInsuValor()%></td>
                                    <td><%=StringEscapeUtils.escapeHtml4(insumo.getInsuImagen())%></td>
                                    <td><%=insumo.getEstaId()%></td>
                                    <td>
                                        <!--Modificar Insumo-->
                                        <a href="insumos_editar.jsp?editar=true&id=<%=insumo.getInsuId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--Eliminar Insumo-->
                                        <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudinsumos_eliminar.jsp?eliminar=true&id=<%=insumo.getInsuId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar" disable="true"></i></a>
                                            <% }%>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>                
                </div>
                <a href="menu_admin.jsp" class="btn btn-block btn-primary" >Menu Principal</a>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>
