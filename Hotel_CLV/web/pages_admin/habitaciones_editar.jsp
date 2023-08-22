<%-- 
    Document   : habitaciones_editar
    Created on : 17/08/2023, 14:21:17
    Author     : Ruben Dario
--%>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
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
        var imagen = document.getElementById("imagen").value.trim();
        var insumo = document.getElementById("insumo").value.trim();
        var estado = document.getElementById("estado").value.trim();

        // Validar campos obligatorios
        if (nombre === "" || tipo === "" || piso === "" || departamento === "" || descripcion === "" || valor === "" || imagen === "" || insumo === "" || estado === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }

        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modificar Perfil</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Perfil</h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="#" method="POST" onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    HabitacionesDao mostrarH = new HabitacionesDao();
                                    Habitaciones habitacion = mostrarH.mostrarHabi(id);
                                    if (habitacion != null) {%>
                            <label>Codigo: </label><input type="text" value="<%= habitacion.getHabiId()%>" class="form-control" name="codigo"  maxlength="2" readonly="false"/>
                            <br>
                            <label>Nombre:  </label><input type="text" value="<%= StringEscapeUtils.escapeHtml4(habitacion.getHabiNombre())%>" class="form-control" name="nombre"  placeholder="Ingrese el nombre de la habitacion" maxlength="40" required/>
                            <br>
                            <label>Tipo:  </label><input type="text" value="<%= habitacion.getHabiTipo()%>" class="form-control" name="tipo"  placeholder="Ingrese el tipo de habitacion" maxlength="40" required/>
                            <br>
                            <label>Piso:  </label><input type="number" value="<%= habitacion.getHabiPiso()%>" class="form-control" name="piso"  placeholder="Ingrese el piso de la habitacion" maxlength="2" required/>
                            <br>
                            <label>Departamento:  </label><input type="text" value="<%= habitacion.getHabiDepar()%>" class="form-control" name="departamento"  placeholder="Ingrese el numero de la habitacion" maxlength="3" required/>
                            <br>
                            <label>Descripcion:  </label><input type="text" value="<%= habitacion.getHabiDescripcion()%>" class="form-control" name="descripcion"  placeholder="Ingrese una descripcion de la habitacion" maxlength="40" required/>
                            <br>
                            <label>Valor Diario:  </label><input type="number" value="<%= habitacion.getHabiValorD()%>" class="form-control" name="valor"  placeholder="Ingrese el valor de la habitacion" step="000.01" maxlength="6" required/>
                            <br>
                            <label>Imagen:  </label><input type="text" value="<%= habitacion.getHabiImg()%>" class="form-control" name="imagen"  placeholder="Ingrese el nombre de la habitacion" maxlength="40" required/>                                  

                            <label>Insumo:  </label>
                            <select name="insumo" id="insumo" class="form form-control" required>
                                <option><%= habitacion.getInsuId()%> </option>
                                <option value="1">Pack Basico</option>
                                <option value="2">Pack Matrimonial</option>
                                <option value="3">Pack VIP</option>
                            </select>  
                            <br>
                            <label>Estado  </label>
                            <select name="estado" id="estado" class="form form-control" required>
                                <option></option>
                                <option value="1" class="btn btn-success">Disponible</option>
                                <option value="2"class="btn btn-warning">Reservado</option>
                                <option value="3"class="btn btn-danger">Ocupado</option>
                                <option value="3"class="btn btn-info">Limpieza</option>
                            </select>
                            <br>
                            <%}%>
                            <%}%>
                            <a href="habitaciones_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Editar" name="editar" class=" btn btn-primary"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>