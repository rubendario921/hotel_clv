<%-- 
    Document   : metodoPagos_crear
    Created on : 21/08/2023, 15:30:06
    Author     : Wladimir Campaña
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var letra = document.getElementById("letra").value.trim();
        var nombre = document.getElementById("nombre").value.trim();

        // Validar campos obligatorios
        if (letra === "" || nombre === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<!--Cuerpo de la pag -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Registro Nuevo</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Método de Pago Nuevo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudmetodoPagos_crear.jsp" method="POST" onsubmit="return validarFormulario();">
                            <label>Letra: </label><input type="text" name="letra" id="letra" class="form-control" placeholder="Ingrese 2 letras de abreviatura" maxlength="2" autocomplete="off" required />
                            <label>Nombre: </label><input type="text" name="nombre" id="nombre" class="form-control" placeholder="Ingrese el método de pago" maxlength="20" autocomplete="off" required/>
                            <br>
                            <a href="metodoPagos_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Registrar" name="nuevo_metodo" class=" btn btn-success"/>
                        </form>                           
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo -->
<%@include file="template/footer_admin.jsp" %>
