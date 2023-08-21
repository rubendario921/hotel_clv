<%-- 
    Document   : metodoPagos_lista
    Created on : 21/08/2023, 15:37:12
    Author     : Wladimir Campaña
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.MetodoPagos" %>
<%@page import="Controller.MetodoPagosDao"%>
<%@page import="java.util.*"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var letra = document.getElementById("letra").value.trim();
        var nombre = document.getElementById("nombre").value.trim();

        // Validar campos obligatorios
        if (letra === "" || nombre === "" ) {
            alert("Por favor, complete todos los campos.");
            return false; // Detener el envío del formulario
        }      
        return true; // Permitir el envío del formulario si todos los campos están llenos
    }
</script>
<!--Tabla para mostrar el listado de los perfiles-->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Método de Pago</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista Métodos de Pago</h3></td>
                                <td align="rigth"><a href="metodoPagos_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Letra</th>
                                    <th>Nombre</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Extraer la informacion de la java class-->
                                <%
                                    MetodoPagosDao mostrar_metodoPagos = new MetodoPagosDao();
                                    List<MetodoPagos> metodoPagos = mostrar_metodoPagos.mostrarListaMetodoPago();
                                    for (MetodoPagos metodosPagos : metodoPagos) {%>
                                <tr>
                                    <td><%=metodosPagos.getPagoId()%></td>
                                    <td><%=metodosPagos.getPagoLetra()%></td>
                                    <td><%=metodosPagos.getPagoNombre()%></td>
                                  
                                    <td>                        
                                        <!--modificar update=":tabMostrar"-->
                                        <a href="metodoPagos_editar.jsp?editar=true&id=<%=metodosPagos.getPagoId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--eliminar update=":tabMostrar"-->
                                        <a href="Mantenimiento_admin/crudmetodoPagos_eliminar.jsp?eliminar=true&id=<%=metodosPagos.getPagoId()%>"class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
                                    </td>
                                </tr>
                                <% }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <a href="menu_admin.jsp" class="btn btn-block btn-primary" >Menu Principal</a>
            </div>            
        </div>        
    </div>    
</div>
<%@include file="template/footer_admin.jsp" %>

