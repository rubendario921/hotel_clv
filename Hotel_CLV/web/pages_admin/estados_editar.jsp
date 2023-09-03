<%-- 
    Document   : estados_editar
    Created on : 15/08/2023, 11:50:51
    Author     : Ruben Dario
--%>


<%@page import="Controller.Categorias"%>
<%@page import="Controller.CategoriasDao"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="java.util.*"%>s
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var letra = document.getElementById("letra").value.trim();
        var descripcion = document.getElementById("descripcion").value.trim();
        var categoria = document.getElementById("categoria").value.trim();

        // Validar campos obligatorios
        if (letra === "" || descripcion === "" || categoria === "") {
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
                <h1 class="page-header">Estados</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Estado</h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudestado_editar.jsp" method="POST" onsubmit="return validarFormulario();">
                            <%
                                if (request.getParameter("editar") != null) {
                                    int id = Integer.parseInt(request.getParameter("id"));

                                    EstadosDao mostrarEstado = new EstadosDao();
                                    Estados estado = mostrarEstado.mostrarEstado(id);
                                    if (estado != null) {%>
                            <label>Código:</label><input type="text" name="codigo" id="codigo" value="<%= estado.getEstaId()%>" class="form-control"  readonly="false"/>
                            <br>
                            <label>Letra: </label><input type="text" name="letra" id="letra" value="<%= StringEscapeUtils.escapeHtml4(estado.getEstaLetra())%>" class="form-control"   placeholder="Ingrese 2 letras de abreviatura" maxlength="2"  autocomplete="off" required/>
                            <br>
                            <label>Nombre: </label><input type="text" name="descripcion" id="descripcion" value="<%= StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion())%>" class="form-control"  placeholder="Ingrese el nombre del perfil" maxlength="20"  autocomplete="off" required/>
                            <br>
                            <label>Categoría: </label>
                            <select name="categoria" id="categoria" class="form form-control" required>
                                <option> </option>
                                <%
                                    CategoriasDao mostrarCategoria = new CategoriasDao();
                                    List<Categorias> categorias = mostrarCategoria.mostrarListaCategorias();
                                    for (Categorias categoria : categorias) {%>
                                <option value="<%= categoria.getCatId()%>"><%= StringEscapeUtils.escapeHtml4(categoria.getCatNombre())%></option>
                                <% }%>
                            </select> 
                            <br>
                            <% }
                                }%>
                            <a href="estados_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Modificar" name="editar" class=" btn btn-warning"/>  
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>