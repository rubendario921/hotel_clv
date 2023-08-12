<%-- 
    Document   : listado_habitaciones
    Created on : 11-ago-2023, 19:01:23
    Author     : Ruben Dario 921
--%>

<%@page import="java.util.*"%>
<%@page import="Controller.Habitaciones"%>
<%@page import="Controller.HabitacionesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../template/admin/header_admin.jsp" %>

<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div>
                    <!--Inicio de la pagina-->
                    <h1 class="page-header">Listado de Habitaciones </h1>
                    <table>
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Tipo</th>
                                <th>Piso</th>
                                <th>Departamento</th>
                                <th>Descripcion</th>
                                <th>Valor Diario</th>
                                <th>Imagen</th>                                
                                <th>Estado</th>
                            </tr>
                        </thead>                    
                        <tbody>
                            <%
                                HabitacionesDao mostrar_habi = new HabitacionesDao();
                                List<Habitaciones> habitaciones = mostrar_habi.mostrarAdminHabi();
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
                                            out.print("Disponible");
                                            break;
                                        case 4:
                                            out.print("Ocupado");
                                            break;
                                        case 5:
                                            out.print("Reservado");
                                            break;
                                        case 6:
                                            out.print("Limpieza");
                                            break;
                                        default:
                                            out.print("Activo - Sin Asignars");
                                            break;
                                    }%>
                                </td>
                                <td><img class="img-fluid" src="../<%=habitacion.getHabiImg()%>"></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <!--Fin Cuerpo pagina -->
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../template/admin/footer_admin.jsp" %>