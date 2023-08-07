<%-- 
    Document   : listado_empleados
    Created on : 20-jul-2023, 9:45:12
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Model.conexion"%>
<%@include file="../template/admin/header_admin.jsp" %>
<!DOCTYPE html>


<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div>
                    <h1 class="page-header">Listado de Empleados 
                        <a href="registro_admin.jsp" class="btn btn-success" style="align-items: baseline">Nuevo Registro</a>
                    </h1>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Cédula</th>
                                    <th>Contacto</th>
                                    <th>Usuario</th> 
                                    <th>Perfil</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    conexion cn = new conexion();
                                    String sql = "SELECT * FROM personas INNER JOIN perfiles ON personas.per_perfil = perfiles.perfil_id WHERE personas.per_perfil  NOT IN ('4');";
                                    Statement st = cn.getConexion().createStatement();
                                    ResultSet rs = st.executeQuery(sql);

                                    while (rs.next()) {%>

                                <tr>
                                    <td><%=rs.getInt("per_id")%></td>
                                    <td><%=rs.getString("per_nombres")%></td>
                                    <td><%=rs.getString("per_apellidos")%></td>
                                    <td><%=rs.getString("per_cedula")%></td>
                                    <td><%=rs.getString("per_telefono")%></td>
                                    <td><%=rs.getString("per_usuario")%></td>
                                    <td><%=rs.getString("perfil_nombre")%></td>
                                    <td><%=rs.getString("per_estado")%></td>
                                    <td>
                                        <a href="editar_admin.jsp?editar=true&id=<%=rs.getInt("per_id")%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <a href="../Mantenimiento/crudeliminar_admin.jsp?eliminar=true&id=<%=rs.getInt("per_id")%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>

                        </table>
                    </div>
                </div>
 <a href="menu_admin.jsp" class="btn btn-primary"><i class="fa fa-arrow-left" title="Regresar" name="regresar"></i> Regresar al menú principal</a>
            </div>  
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

<%@include file="../template/admin/footer_admin.jsp" %>

