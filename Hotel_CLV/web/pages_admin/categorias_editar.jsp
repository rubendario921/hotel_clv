<%-- 
    Document   : categorias_editar
    Created on : 28/08/2023, 14:48:47
    Author     : Ruben Dario
--%>

<%@page import="Controller.Categorias"%>
<%@page import="Controller.CategoriasDao"%>
<%@page import="java.util.*"%>s
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombre = document.getElementById("nombre").value.trim();
        var descripcion = document.getElementById("descripcion").value.trim();

        // Validar campos obligatorios
        if (nombre === "" || descripcion === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

        var confirmacion = confirm("¿Está de acuerdo con actualizar el registro?");
        return confirmacion; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Categorías del Sistema</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Editar Categorías</h3>                        
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudcategorias_editar.jsp" method="POST" onsubmit="return validarFormulario()">
                            <%
                                if (request.getParameter("editar") != null) {
                                    Integer id = Integer.parseInt(request.getParameter("id"));
                                    CategoriasDao mostrarCate = new CategoriasDao();
                                    Categorias categoria = mostrarCate.mostrarCategoria(id);
                                    if (categoria != null) {%>
                            <label>Código:</label><input type="text" name="codigo" id="codigo" value="<%= categoria.getCatId()%>" class="form-control" readonly="false" autocomplete="off"/>
                            <br>
                            <label>Nombre:  </label><input type="text" name="nombre" id="nombre" value="<%= StringEscapeUtils.escapeHtml4(categoria.getCatNombre())%>" class="form-control"   placeholder="Ingrese el nombre de la Categoria"maxlength="30" autocomplete="off" required/>
                            <br>
                            <label>Descripción: </label><input type="text" name="descripcion" id="descripcion" value="<%= StringEscapeUtils.escapeHtml4(categoria.getCatDescripcion())%>" class="form-control"   placeholder="Ingrese una breve descripcion"maxlength="200" autocomplete="off" required/>
                            <br>
                            <% }
                                }%>
                            <a href="categorias_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Modificar" name="editar" class=" btn btn-warning"/>  
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>