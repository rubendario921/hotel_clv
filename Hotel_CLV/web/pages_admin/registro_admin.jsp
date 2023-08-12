<%-- 
    Document   : registro_admin
    Created on : 20-jul-2023, 12:13:12
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../template/admin/header_admin.jsp" %>
<!DocumentHTML>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div>
                    <h2 class="page-header">Registro de Nuevo Colaborador </h2>
                </div>

                <form action="../Mantenimiento/crudregistrar_admin.jsp" method="POST" class="align-items-center">

                    <div class="row">
                        <div class="col">
                            <input type="text" class="form-control" placeholder="Nombres Completos" aria-label="First name" id="nombre" name="nom">
                        </div>
                        <br>
                        <div class="col">
                            <input type="text" class="form-control" placeholder="Apellidos Completos" aria-label="Last name" id="apellido" name="ape">
                        </div>                
                    </div>
                    <br>
                    <div class="row">
                        <div class="col">
                            <input type="text" class="form-control" placeholder="Cédula de Identidad" aria-label="First name" id="cedula" name="cedu">
                        </div>
                        <br>
                        <div class="col">
                            <input type="text" class="form-control" placeholder="Teléfono de Contacto" aria-label="Last name" id="contacto" name="cont">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col">
                            <input type="email" class="form-control" placeholder="Correo Electronico" aria-label="First name" id="correo" name="corr">
                        </div>
                        <div class="col">
                            <br>
                            <input type="text" class="form-control" placeholder="Usuario" aria-label="First name" id="usuario" name="usu">
                        </div>
                        <br>
                        <div class="col">
                            <input type="password" class="form-control" placeholder="Contraseña" aria-label="Last name" id="clave" name="pass">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col">
                            <label>Rol: </label>
                            <select name="perfil" id="perfil" class="form-control">
                                <option>Seleccionar una Opción</option>
                                <option value="1">Administrador</option>
                                <option value="2">Supervisor</option>
                                <option value="3">Recepcionista</option>
                                <option value="4">Cliente</option>
                            </select>
                        </div>
                    </div>
                    <br>    
                    <div class="align-items-center">
                        <button type="submit" class="btn btn-primary" value="nuevo" name="nuevo">Registrar</button>    
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../template/admin/footer_admin.jsp" %>