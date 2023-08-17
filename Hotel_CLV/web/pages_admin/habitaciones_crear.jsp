<%-- 
    Document   : habitaciones_crear
    Created on : 17/08/2023, 13:47:01
    Author     : Ruben Dario
--%>

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

        // Validar campos obligatorios
        if (nombre === "" || tipo === ""|| piso === ""|| departamento === "" ||descripcion === ""|| valor === ""|| imagen === "" ) {
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
                <h1 class="page-header">Nuevo Registro</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Nueva Habitacion</h3>
                    </div>
                    <div class="panel-body">
                        <form action="#" method="POST" onsubmit="return validarFormulario();">
                            <label>Nombre: </label><input type="text" class="form-control" name="nombre" placeholder="Ingrese el nombre de la habitacion" maxlength="20" required/>
                            <label>Tipo: </label><input type="text" class="form-control" name="tipo" placeholder="Ingrese el tipo de habitacion" maxlength="20" required/>
                            <label>Piso </label><input type="number" class="form-control" name="piso" placeholder="Ingrese el psio donde se encuentra la habitacion" maxlength="2" required/>
                            <label>Departamento: </label><input type="number" class="form-control" name="departamento" placeholder="Ingrese el numero de la habitacion" maxlength="3" required/>
                            <label>Descripcion: </label><input type="text" class="form-control" name="descripcion" placeholder="Ingrese la descripcion de la habitacion" maxlength="40" required/>
                            <label>Valor: </label><input type="number" class="form-control" name="valor" placeholder="Ingrese el valor" step="000.01" required/>
                            <label>Imagen: </label><input type="text" class="form-control" name="imagen" placeholder="Ingrese la direccion de la imagen" required/>
                            <label>Insumo: </label>
                            <select name="insumo" id="insumo" class="form form-control" required>
                                <option> </option>
                                <option value="1">Pack Basico</option>
                                <option value="2">Pack Matrimonial</option>
                                <option value="3">Pack VIP</option>
                            </select>                            
                            <br>
                            <a href="habitaciones_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Registrar" name="nueva_habitacion" class=" btn btn-primary"/>
                        </form>                           
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<%@include file="template/footer_admin.jsp" %>
