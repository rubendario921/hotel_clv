<%-- 
    Document   : consumos_crear
    Created on : 28/08/2023, 18:15:05
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
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
                <h1 class="page-header">Lista de Consumos</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Datos de Consumos</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudconsumos_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                            <label> Nombre: </label><input type="text" class="form-control" name="nombre" placeholder="Ingrese su Nombre " maxlength="50" autocomplete="off" required="" />
                            <label> Detalle: </label><input type="text" class="form-control" name="detalle" placeholder="Ingrese el detalle del consumo " maxlength="300" autocomplete="off" required="" />
                            <label> Cantidad: </label><input type="number" class="form-control" name="cantidad" placeholder="Ingrese la cantidad " maxlength="10" autocomplete="off" required="" />
                            <label> Valor: </label><input type="number" class="form-control" name="valor" placeholder="Valor a Págar " maxlength="50" autocomplete="off" required="" />
                            <label> Imagen: </label><input type="text" class="form-control" name="Imagen" placeholder="Imagen " maxlength="" autocomplete="off" required="" />
                            <label> Estado: </label><input type="text" class="form-control" name="estados_esta_id"  placeholder="Ingrese el estado. " maxlength="" autocomplete="off" required/>
                            <br>
                            <a href="consumos_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Registrar" name="Nuevo_Consumo" class="btn bg-primary" />
                        </form>
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo -->
<%@include file="template/footer_admin.jsp" %>
