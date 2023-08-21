<%-- 
    Document   : listado_habitaciones
    Created on : 11-ago-2023, 19:01:23
    Author     : Ruben Dario 921
--%>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>

<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">  <h1 class="page-header">Habitaciones</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista de Habitaciones</h3></td>
                                <td align="rigth"><a href="habitaciones_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>                    
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Tipo</th>
                                    <th>Piso</th>
                                    <th>Departamento</th>
                                    <th>Descripcion</th>
                                    <th>Valor Diario</th>                                    
                                    <th>Estado</th>
                                    <th>Imagen</th>       
                                    <th>Acciones</th>
                                </tr>
                            </thead>                    
                            <tbody>
                                <%
                                    HabitacionesDao mostrar_habi = new HabitacionesDao();
                                    List<Habitaciones> habitaciones = mostrar_habi.mostrarListaHabi();
                                    for (Habitaciones habitacion : habitaciones) {%>
                                <tr>
                                    <td><%=habitacion.getHabiId()%></td>
                                    <td><%=habitacion.getHabiNombre()%></td>
                                    <td><%=habitacion.getHabiTipo()%></td>
                                    <td><%=habitacion.getHabiPiso()%></td>
                                    <td><%=habitacion.getHabiDepar()%></td>
                                    <td><%=habitacion.getHabiDescripcion()%></td>
                                    <td><%=habitacion.getHabiValorD()%></td>
                                    <td><%
                                        int estado = habitacion.getEstaId();
                                        switch (estado) {
                                            case 3:
                                                out.print("<b class='btn btn-success''>Disponible</b>");
                                                break;
                                            case 4:
                                                out.print("<b class='btn btn-danger''>Ocupado</b>");
                                                break;
                                            case 5:
                                                out.print("<b class='btn btn-warning''>Reservado</b>");
                                                break;
                                            case 6:
                                                out.print("<b class='btn btn-info''>Reservado</b>");
                                                break;
                                            default:
                                                out.print("<b class='btn btn-default''>Sin Asignar</b>");
                                                break;
                                        }
                                        %>
                                    </td>
                                    <td><img class="img-fluid" src="../<%= habitacion.getHabiImg()%>" height="200" width="200"></td>
                                    <td>
                                        <!--modificar update=":tabMostrar"-->
                                        <a href="habitaciones_editar.jsp?editar=true&id=<%= habitacion.getHabiId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <!--eliminar update=":tabMostrar"-->
                                        <a href="Mantenimiento_admin/crudperfil_eliminar.jsp?eliminar=true&id=<%= habitacion.getHabiId()%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
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