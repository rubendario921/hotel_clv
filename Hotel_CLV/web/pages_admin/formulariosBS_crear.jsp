<%-- 
    Document   : formulariosBS_crear
    Created on : 24/08/2023, 0:28:42
    Author     : Wladimir Campaña
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    //Optener valores de los campos
    function validarFormulario() {
        var nombre = document.getElementById("nombre").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var asunto = document.getElementById("asunto").value.trim();
        var mensaje = document.getElementById("mensaje").value.trim();
        var ciudad = document.getElementById("ciudad").value.trim();
        var estados_esta_id = document.getElementById("estados_esta_id").value.trim();

        //Validar campos obligatorios

        if (nombre === " " || correo === ""|| telefono === ""|| asunto === ""|| mensaje === ""|| ciudad === ""|| estados_esta_id === "") {
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
                <h1 class="page-header">Buzón de Sugerencias</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Nuevo mensaje</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudformulariosBS_crear.jsp" method="POST"onsubmit="return validarFormulario();">
                            <label> Nombre: </label><input type="text" class="form-control" name="nombre"  placeholder="Ingrese su nombre. " maxlength="50" autocomplete="off" required />
                            <label> Correo: </label><input type="text" class="form-control" name="correo"  placeholder="Ingrese su email. " maxlength="50" autocomplete="off" required/>
                            <label> Teléfono: </label><input type="text" class="form-control" name="telefono"  placeholder="Ingrese su número de teléfono." maxlength="10" autocomplete="false" required/>
                            <label> Asunto: </label><input type="text" class="form-control" name="asunto"  placeholder="Ingrese su asunto. " maxlength="25" autocomplete="off" required/>
                            <label> Mensaje: </label><input type="text" class="form-control" name="mensaje"  placeholder="Ingrese su mensaje." maxlength="800" autocomplete="off" required/>
                            <label> Ciudad: </label><input type="text" class="form-control" name="ciudad"  placeholder="Ingrese nombre de la Ciudad." maxlength="50" autocomplete="off" required/>
                            <label> Estado: </label><input type="text" class="form-control" name="estados_esta_id"  placeholder="Ingrese el estado. " maxlength="" autocomplete="off" required/>
                            <br>
                            <a href="formulariosBS_lista.jsp" class="btn btn-danger">Regresar</a>
                            <input type="submit" value="Registrar" name="nuevo_Sugerencia" class="btn bg-primary"/>
                        </form>
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo -->
<%@include file="template/footer_admin.jsp" %>

