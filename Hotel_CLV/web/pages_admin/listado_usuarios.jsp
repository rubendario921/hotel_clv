<%-- 
    Document   : listado_usuarios
    Created on : 20-jul-2023, 0:06:06
    Author     : Ruben Dario 921
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Model.conexion"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>

<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Listado de Usuarios</h1>
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Cedula</th>
                                    <th>Contacto</th>
                                    <th>Correo</th>                                    
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    conexion cn = new conexion();
                                    //String sql = "SELECT * FROM usuarios WHERE usu_estado= 'A'";
                                    String sql = "SELECT * FROM usuarios WHERE usu_estado= 'A'";
                                    Statement st = cn.getConexion().createStatement();
                                    ResultSet rs = st.executeQuery(sql);

                                    while (rs.next()) {%>

                                <tr>
                                    <td><%=rs.getInt("usu_id")%></td>
                                    <td><%=rs.getString("usu_nombres")%></td>
                                    <td><%=rs.getString("usu_apellidos")%></td>
                                    <td><%=rs.getString("usu_cedula")%></td>
                                    <td><%=rs.getInt("usu_contacto")%></td>
                                    <td><%=rs.getString("usu_correo")%></td>
                                    <td>
                                        <a href="editar_usuarios.jsp?editar=true&id=<%=rs.getInt("usu_id")%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <a href="Mantenimiento/crudeliminar_usuario.jsp?eliminar=true&id=<%=rs.getInt("usu_id")%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>

                                    </td>
                                </tr>
                                <%}%>
                            </tbody>

                        </table>
                    </div>


                </div>

            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->






<%@include file="template/footer_admin.jsp" %>
