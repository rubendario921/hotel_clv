<%-- 
    Document   : consumos_crear
    Created on : 28/08/2023, 18:15:05
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>

    //Optener valores de los campos
    function validar formulario() {
        var nombre = document.getElementById("nombre").value.trim();
        var detalle = document.getElementById("detalle").value.trim();
        var cantidad = document.getElementById("cantidad").value.trim();
        var valor = document.getElementById("valor").value.trim();
        var consu_dimg = document.getElementById("consu_dimg").value.trim();
        var estados_esta_id = document.getElementById("estados_esta_id").value.trim();

        //Validar campos obligatorios

        if (nombre === " " || detalle === "" || cantidad === "" || valor === "" || consu_dimg === "" || estados_esta_id === "") {
            alert("Por favor, completar todos los campos.");
            return false;
        }
        return true;
    }

</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Registro Consumo</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Nuevo Consumo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudconsumos_crear.jsp" method="POST"onsubmit="return validarFormulario();">
                            <label> Nombre: </label><input type="text" class="form-control" name="nombre"  placeholder="Ingrese el nombre del consumo. " maxlength="50" autocomplete="off" required />
                            <label> Detalle: </label><input type="text" class="form-control" name="detalle"  placeholder="Ingrese el detalle consumo. " maxlength="500" autocomplete="off" required/>
                            <label> Cantidad: </label><input type="text" class="form-control" name="cantidad"  placeholder="Ingrese la cantidad del consumo. " maxlength="20" autocomplete="off" required/>
                            <label> Valor: </label><input type="text" class="form-control" name="valor"  placeholder="Ingrese el valor del consumo. " maxlength="" autocomplete="off" required/>
                            <label> Imagen: </label><input type="text" class="form-control" name="consu_dimg"  placeholder="Ingrese la imagen del consumo. " maxlength="255" autocomplete="off" required/>
                            <label> Estado: </label><input type="text" class="form-control" name="estados_esta_id"  placeholder="Ingrese el estado del consumo. " maxlength="" autocomplete="off" required/>
                            <br>
                            <a href="consumos_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Registrar" name="nuevo_consumo" class="btn bg-primary"/>
                        </form>
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo -->
<%@include file="template/footer_admin.jsp" %>