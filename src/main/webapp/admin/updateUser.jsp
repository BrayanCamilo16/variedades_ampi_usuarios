<%-- 
    Document   : updateUser
    Created on : 6/08/2022, 7:26:53 p. m.
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.UsuarioDAO"%>
<%@page import="vo.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VariedadesAmpi|Actualizar</title>
    </head>
    <%
        UsuarioVO VO = (UsuarioVO) request.getAttribute("UsuarioConsultado");
    %>
    <body>
        <form method="post" action="${pageContext.request.contextPath}/Usuario">
            <h1>Actualizar Usuario</h1>

            <input type="hidden" name="codigoId" value="${UsuarioConsultado.idUsuario}">


            <label>Nombre</label>
            <input type="text" disabled name="nombre"  value="${UsuarioConsultado.nombreUsuario}">

            <label>Apellido</label>
            <input type="text" disabled  name="apellido" value="${UsuarioConsultado.apellidoUsuario}">

            <label>Email</label>
            <input type="text" disabled  name="email" value="${UsuarioConsultado.emailUsuario}">

            <label>Contraseña</label>
            <input type="password" disabled  name="pass" value="${UsuarioConsultado.passUsuario}">


            <label>Tipo Documento</label>
            <select name="tipoDocu" disabled>
                <option <%=VO.getTipoDocumento().equals("1") ? "selected" : " "%> value="1">Cedula de Ciudadania</option>
                <option <%=VO.getTipoDocumento().equals("2") ? "selected" : " "%> value="2">Cedula de Extranjeria</option>
                <option <%=VO.getTipoDocumento().equals("3") ? "selected" : " "%> value="3">Tarjeta Identidadad</option>
                <option <%=VO.getTipoDocumento().equals("4") ? "selected" : " "%> value="4">Pasaporte</option>
                <option <%=VO.getTipoDocumento().equals("5") ? "selected" : " "%> value="5">NIT</option>
            </select>

            <label>Numero Documento</label>
            <input type="text" name="numDocu" disabled value="${UsuarioConsultado.numDocumentoUsuario}">

            <label>Telefono</label>
            <input type="text" name="telefono" disabled value="${UsuarioConsultado.telefonoUsuario}">

            <label>Direccion</label>
            <input type="text" name="direccion" disabled value="${UsuarioConsultado.direccionUsuario}">

            <label>Sexo</label>
            <select name="sexo" disabled>
                <option <%=VO.getSexoUsuario().equals("1") ? "selected" : " "%> value="1">Masculino</option>
                <option <%=VO.getSexoUsuario().equals("2") ? "selected" : " "%> value="2">Femenino</option>
                <option <%=VO.getSexoUsuario().equals("3") ? "selected" : " "%> value="3">Otro</option>
            </select>

            <label>Estado</label>
            <input type="text" name="estado" disabled value="${UsuarioConsultado.estadoUsuario}">

            <label>Rol</label>
            <select name="rol">
                <option <%=VO.getIdRol().equals("1") ? "selected" : " "%> value="1">Administrador</option>
                <option <%=VO.getIdRol().equals("2") ? "selected" : " "%> value="2">Empleado</option>
                <option <%=VO.getIdRol().equals("3") ? "selected" : " "%> value="3">Cliente</option>
            </select>

            <button>Actualizar Usuario</button>
            <input type="hidden" value="3" name="action">
            <%
                //cuando es diferente a nulo es que si hubo un error
                if (request.getAttribute("mensajeError") != null) {%>
            ${mensajeError}
            <% } else {%>
            ${mensajeExito}
            <%}%>
        </form>
    </body>
</html>
