<%-- 
    Document   : categorias_crear
    Created on : 28/08/2023, 13:43:46
    Author     : Ruben Dario
--%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var catNombre = document.getElementById("catNombre").value.trim();
        var catDescripcion = document.getElementById("catDescripcion").value.trim();


        // Validar campos obligatorios
        if (catNombre === "" || catDescripcion === "") {
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
                <h1 class="page-header">Categoria</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Registro Nuevo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudcategorias_crear.jsp" method="POST" onsubmit="return  validarFormulario()">
                            <label>Nombre: </label><input type="text" name="catNombre" id="nombre" class="form-control" placeholder="Ingrese el nombre de la categoria" maxlength="30" autocomplete="true" required/>
                            <br>
                            <label>Descripción: </label><input type="text" name="catDescripcion" id="descripcion" class="form-control" placeholder="Ingrese la descripción de la categoria" maxlength="200" autocomplete="true" required/>
                            <br>
                            <a href="categorias_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Registrar" name="nueva_categoria" class=" btn btn-success"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>   



