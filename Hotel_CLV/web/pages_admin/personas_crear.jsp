<%-- 
    Document   : registro_admin
    Created on : 20-jul-2023, 12:13:12
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombres = document.getElementById("nombres").value.trim();
        var apellidos = document.getElementById("apellidos").value.trim();
        var cedula = document.getElementById("cedula").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var correo = document.getElementById("correo").value.trim();
        var usuario = document.getElementById("usuario").value.trim();
        var clave = document.getElementById("clave").value.trim();
        var perfil = document.getElementById("perfil").value.trim();

        // Validar campos obligatorios
        if (nombres === "" || apellidos === ""|| cedula === ""|| telefono === ""|| correo === ""|| usuario === ""|| clave === ""|| perfil === "") {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>


<!DocumentHTML>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Registro Nuevo</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3>Nuevo</h3>
                    </div>
                    <div class="panel-body">
                        <form action="Mantenimiento_admin/crudadmin_crear.jsp" method="POST" onsubmit="return validarFormulario();" >
                            <!--<label>Letra: </label><input type="text" class="form-control" name="letra"  placeholder="Ingrese dos letras de abreviatura"maxlength="2" required/>-->                            
                            <label>Nombres Completos: </label><input type="text" class="form-control" name="nombres" id="nombres" placeholder="Ingrese sus dos nombres" maxlength="100" required />
                            <label>Apellidos Completos: </label><input type="text" class="form-control" name="apellidos" id="apellidos" placeholder="Ingrese sus dos nombres" maxlength="100" required />
                            <label>Cedula de Identidad: </label><input type="text" class="form-control" name="cedula" id="cedula" placeholder="Ingrese sus cedula de identidad" maxlength="13" required />
                            <label>Telefono: </label><input type="text" class="form-control" name="telefono" id="telefono" placeholder="Ingrese sus dos nombres" maxlength="10" required />
                            <label>Correo Electronico: </label><input type="email" class="form-control" name="correo" id="correo" placeholder="Ingrese sus dos nombres" maxlength="100" required />
                            <label>Usuario: </label><input type="text" class="form-control" name="usuario" id="usuario" placeholder="Ingrese sus dos nombres" maxlength="40" required />
                            <label>Contraseña: </label><input type="password" class="form-control" name="clave" id="clave" placeholder="Ingrese sus dos nombres" maxlength="16" required />
                            <label>Perfil: </label>
                            <select name="perfil" id="perfil" class="form-control" required>
                                <option> </option>                                
                                <option value="1">Administrador</option>
                                <option value="2">Supervisor</option>
                                <option value="3">Recepcionista</option>
                                <option value="4">Cliente</option>
                            </select>
                            <br>
                            <a href="menu_admin.jsp" class="btn btn-danger" >Regresar</a>
                            <input type="submit" class=" btn btn-primary" value="Registrar" name="nuevo_persona" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer_admin.jsp" %>