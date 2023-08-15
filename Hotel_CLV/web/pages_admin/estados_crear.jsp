<%-- 
    Document   : estado_crear
    Created on : 15/08/2023, 11:12:30
    Author     : Ruben Dario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var letrav = document.getElementById("letra").value.trim();
        var descripcionv = document.getElementById("descripcion").value.trim();

        // Validar campos obligatorios
        if (letrav === "" || descripcionv === "" ) {
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
                <h1 class="page-header">Registro Nuevo</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Estado Nuevo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudestado_crear.jsp" method="POST" onsubmit="return validarFormulario()">
                            <label>Letra: </label><input type="text" class="form-control" name="letra"  placeholder="Ingrese 2 letras de abreviatura"maxlength="2" required/>
                            <label>Descripción: </label><input type="text" class="form-control" name="descripcion" placeholder="Ingrese el nombre del perfil" maxlength="20" required/>
                            <br>
                            <a href="estados_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Registrar" name="nuevo_estado" class=" btn btn-primary"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin del Cuerpo -->
<%@include file="template/footer_admin.jsp" %>