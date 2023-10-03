<%-- 
    Document   : habitaciones_crear
    Created on : 17/08/2023, 13:47:01
    Author     : Ruben Dario
--%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>

<%@page import="Controller.Insumos"%>
<%@page import="Controller.InsumosDao"%>
<%@page import="java.util.*"%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombre = document.getElementById("nombre").value.trim();
        var tipo = document.getElementById("tipo").value.trim();
        var piso = document.getElementById("piso").value.trim();
        var departamento = document.getElementById("departamento").value.trim();
        var descripcion = document.getElementById("descripcion").value.trim();
        var valor = document.getElementById("valor").value.trim();
        //var insumo = document.getElementById("insumo").value.trim();
        var estado = document.getElementById("estado").value.trim();

        // Validar campos obligatorios
        if (nombre === "" || tipo === "" || piso === "" || departamento === "" || descripcion === "" || valor === "" || insumo === "" || estado === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

        var confirmacion = confirm("¿Desea continuar con la creación del registro?");
        return confirmacion; // Permitir el envío del formulario si todos los campos están llenos    
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Habitaciones</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Nueva Habitación</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudhabitacion_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                            <label>Nombre: </label>
                            <input type="text" name="nombre" id="nombre" class="form-control"  placeholder="Nombre de la habitación" maxlength="50" autocomplete="off" required/><br />
                            <label>Tipo: </label>
                            <input type="text" name="tipo" id="tipo" class="form-control" placeholder="Tipo de habitación" maxlength="50"  autocomplete="off" required/><br />
                            <label>Piso </label>
                            <input type="number" name="piso" id="piso" class="form-control" placeholder="Piso donde se encuentra la habitación" maxlength="2" min="1" autocomplete="off" required/><br />
                            <label>Departamento: </label>
                            <input type="number" name="departamento" id="departamento" class="form-control"  placeholder="Número de la habitación" maxlength="3" min="1" autocomplete="off" required/><br />
                            <label>Descripción: </label>
                            <input type="text" name="descripcion" id="descripcion" class="form-control"  placeholder="Descripción de la habitación" maxlength="255" autocomplete="off" required/><br />
                            <label>Valor: </label>
                            <input type="number" name="valor" id="valor" class="form-control"  placeholder="Valor de la Habitación" step="0.01" min="1" autocomplete="off" required/><br />
                            <label>Insumos: </label>
                            <%
                                InsumosDao mostrarInsu = new InsumosDao();
                                List<Insumos> insumos = mostrarInsu.mostrarListaInsumos();
                                for (Insumos insumo : insumos) {
                            %>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="insumo" name="insumo" value="<%= insumo.getInsuId()%>">
                                <label class="form-check-label" for="insumo"><%= StringEscapeUtils.escapeHtml4(insumo.getInsuNombre())%></label>
                            </div>
                            <% }%>
                            <br />
                            <label>Estado:  </label>
                            <select name="estado" id="estado" class="form form-control" required>
                                <option selected>Seleccione una Opción</option>
                                <%
                                    EstadosDao mostrarEsta = new EstadosDao();
                                    List<Estados> estados = mostrarEsta.mostrarListaEstaHabitaciones();
                                    for (Estados estado : estados) {
                                %>
                                <option value="<%= estado.getEstaId()%>"><%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%> </option>
                                <% }%>
                            </select>                           
                            <br />
                            <a href="habitaciones_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Registrar" name="nueva_habitacion" class=" btn btn-success"/>
                        </form>                           
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>
