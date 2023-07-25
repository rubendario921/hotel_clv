<%-- 
    Document   : listado_empleados
    Created on : 20-jul-2023, 9:45:12
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
                <div>
                    <h1 class="page-header">Listado de Empleados <button><a href="registro_admin.jsp" class="btn btn-success">Nuevo Registro</a>
                        </button></h1>

                </div>
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Cedula</th>
                                    <th>Usuario</th>
                                    <th>Contacto</th>
                                    <th>Perfil</th>                                    
                                    <th>Estado</th>                      
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    conexion cn = new conexion();
                                    String sql = "SELECT * FROM empleados";
                                    Statement st = cn.getConexion().createStatement();
                                    ResultSet rs = st.executeQuery(sql);

                                    while (rs.next()) {%>

                                <tr>
                                    <td><%=rs.getInt("emp_id")%></td>
                                    <td><%=rs.getString("emp_nombres")%></td>
                                    <td><%=rs.getString("emp_apellidos")%></td>
                                    <td><%=rs.getString("emp_cedula")%></td>
                                    <td><%=rs.getString("emp_usuario")%></td>
                                    <td><%=rs.getInt("emp_contacto")%></td>
                                    <td><%=rs.getInt("emp_perfil")%></td>
                                    <td><%=rs.getString("emp_estado")%></td>
                                    <td>
                                        <a href="editar_admin.jsp?editar=true&id=<%=rs.getInt("emp_id")%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                        <a href="../Mantenimiento/crudeliminar_admin.jsp?eliminar=true&id=<%=rs.getInt("emp_id")%>" class="btn btn-danger"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
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

