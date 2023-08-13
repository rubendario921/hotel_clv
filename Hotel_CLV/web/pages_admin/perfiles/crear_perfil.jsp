<%-- 
    Document   : crear_perfil
    Created on : 13-ago-2023, 14:51:25
    Author     : Ruben Dario 921
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../template/header_admin.jsp" %>
<!DOCTYPE html>
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
                        <form>
                            <label>Letra: </label><input type="text" class="form-control" name="letra" pacleholde="Ingrese 2 letras de abreviatura"requerid/>
                            <label>Nombre: </label><input type="text" class="form-control" name="nombre" pacleholde="Ingrese el nombre del perfil" requerid/>                            
                            <input type="submit" value="Registrar" name="nuevo_perfil" class="btn-primary"/>
                        </form>                           
                    </div>
                </div>
            </div>            
        </div>        
    </div>    
</div>
<!--Fin del Cuerpo -->
<%@include file="../template/footer_admin.jsp" %>