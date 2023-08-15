<%-- 
    Document   : perfil_crear_
    Created on : 13-ago-2023, 14:51:25
    Author     : Ruben Dario 921
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombre = document.getElementById("letra").value.trim();
        var letra = document.getElementById("nombre").value.trim();

        // Validar campos obligatorios
        if (nombre === "" || letra === "" ) {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }

        // Puedes agregar más validaciones si es necesario (por ejemplo, verificar el formato del correo, etc.)

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
                        <h3>Perfil Nuevo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudperfil_registrar.jsp" method="POST" onsubmit="return validarFormulario();">
                            <label>Letra: </label><input type="text" class="form-control" name="letraE"  placeholder="Ingrese 2 letras de abreviatura"maxlength="2" required/>
                            <label>Nombre: </label><input type="text" class="form-control" name="nombre" placeholder="Ingrese el nombre del perfil" maxlength="20" required/>
                            <br>
                            <a href="perfil_lista.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" value="Registrar" name="nuevo_perfil" class=" btn btn-primary"/>
                        </form>                           
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo -->
<%@include file="template/footer_admin.jsp" %>