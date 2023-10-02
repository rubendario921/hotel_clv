<%-- 
    Document   : listado_empleados
    Created on : 20-jul-2023, 9:45:12
    Author     : Ruben Dario 921
--%>

<%@page import="Controller.colorNotificaciones"%>
<%@page import="Controller.colorNotificacionesDao"%>
<%@page import="Controller.TipoDocumentoDao"%>
<%@page import="Controller.TipoDocumentos"%>
<%@page import="Controller.Perfiles"%>
<%@page import="Controller.PerfilesDao"%>
<%@page import="Controller.Estados"%>
<%@page import="Controller.EstadosDao"%>
<%@page import="Controller.Personas"%>
<%@page import="java.util.*"%>
<%@page import="Controller.PersonasDao"%>
<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header_admin.jsp" %>
<!DOCTYPE html>
<script>
    function confirmarEliminacion() {
        var confirmacion = confirm("¿Seguro de que deseas eliminar este registro?");
        return confirmacion; // Devolver true si el usuario hace clic en OK, de lo contrario, false
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Nómina de Empleados</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table style="width: 100%">
                            <tr>
                                <td><h3>Lista de Empleados</h3></td>
                                <td aling="rigth"><a href="personas_crear.jsp" class="btn btn-success"><i class="fa fa-edit" title="Nuevo Registro"></i></a></td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-body">
                        <table class="table table">
                            <thead>
                                <tr>                                    
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Número de Documento</th>
                                    <th>Usuario</th> 
                                    <th>Teléfono</th>
                                    <th>Perfil</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    //Lista de TipoIdentificacion
                                    TipoDocumentoDao mostrarTipoDocu = new TipoDocumentoDao();
                                    List<TipoDocumentos> tipodocumentos = mostrarTipoDocu.mostrarListaTipoDocumento();

                                    //Lista de Perfiles
                                    PerfilesDao mostrarPerfil = new PerfilesDao();
                                    List<Perfiles> perfiles = mostrarPerfil.mostrarListaPerfil();

                                    //Lista de Estados
                                    EstadosDao mostrarEsta = new EstadosDao();
                                    List<Estados> estados = mostrarEsta.mostrarListaEstaPersonas();

                                    //Lista de Colores
                                    colorNotificacionesDao mostrarColor = new colorNotificacionesDao();
                                    List<colorNotificaciones> colornotificaciones = mostrarColor.mostrarListaColor();

                                    PersonasDao mostrarLista = new PersonasDao();
                                    List<Personas> personas = mostrarLista.mostrarListaPersonasE();
                                    for (Personas persona : personas) {

                                        //Comparacion de TipoDocumento
                                        int tipoDocumento = persona.getTipoDocumento();
                                        String nombreDocumento = "";
                                        for (TipoDocumentos tipoDocu : tipodocumentos) {
                                            if (tipoDocu.getDocI_id() == tipoDocumento) {
                                                nombreDocumento = StringEscapeUtils.escapeHtml4(tipoDocu.getDocI_letra());
                                            }
                                        }

                                        //Comparacion de Perfil
                                        int perfilId = persona.getPerfilId();
                                        String nombrePerfil = "";
                                        for (Perfiles perfil : perfiles) {
                                            if (perfil.getPerfilId() == perfilId) {
                                                nombrePerfil = StringEscapeUtils.escapeHtml4(perfil.getPerfilNombre());
                                                break;
                                            }
                                        }
                                        //Comparacion de Estado
                                        int estadoId = persona.getEstaId();
                                        String nombreEstado = "";
                                        String colorEstado = "";
                                        for (Estados estado : estados) {
                                            if (estado.getEstaId() == estadoId) {
                                                nombreEstado = StringEscapeUtils.escapeHtml4(estado.getEstaDescripcion());
                                                int colorEstadoId = estado.getColorNotiId();
                                                for (colorNotificaciones colorNoti : colornotificaciones) {
                                                    if (colorNoti.getColorNId() == colorEstadoId) {
                                                        colorEstado = StringEscapeUtils.escapeHtml4(colorNoti.getColorNcodigo());
                                                        break;
                                                    }
                                                }
                                                break;
                                            }
                                        }%>
                                <tr>
                                    <td><%= StringEscapeUtils.escapeHtml4(persona.getPerNombres())%></td>
                                    <td><%= StringEscapeUtils.escapeHtml4(persona.getPerApellidos())%></td>
                                    <td><%= nombreDocumento%> - <%= StringEscapeUtils.escapeHtml4(persona.getPernumDocumento())%></td>                                    
                                    <td><%= StringEscapeUtils.escapeHtml4(persona.getPerUsuario())%></td>                                    
                                    <td><%= StringEscapeUtils.escapeHtml4(persona.getPerTelefono())%></td>
                                    <td><%= nombrePerfil%></td>
                                    <td style="color: <%= colorEstado%>"><b><%= nombreEstado%></b></td>                                        
                                    <td>
                                        <a href="personas_editar.jsp?editar=true&id=<%= persona.getPerId()%>" class="btn btn-warning"><i class="fa fa-edit" title="Editar" name="editar"></i></a>
                                            <% if ("ADMINISTRATIVO".equals((String) session.getAttribute("perfil"))) {%>
                                        <a href="Mantenimiento_admin/crudpersonas_eliminar.jsp?eliminar=true&id=<%= persona.getPerId()%>" class="btn btn-danger" onclick="return confirmarEliminacion();"><i class="fa fa-trash" title="Eliminar" name="eliminar"></i></a>
                                            <% }%>
                                    </td>
                                </tr>
                                <% }%>
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