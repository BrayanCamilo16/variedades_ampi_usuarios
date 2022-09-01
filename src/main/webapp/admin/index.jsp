<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cache.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>VariedadesAmpi|Administrador</title>

        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../js/funciones.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">


        <!--datatable-->
        <link href="DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="DataTables/DataTables-1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">

        <jsp:include page="/WEB-INF/paginas/comunes/head.jsp" />
    </head>
    <body>

        <!-- Navbar  -->
        <jsp:include page="/WEB-INF/paginas/comunes/navbar.jsp" />
        <!-- /Navbar  -->

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Bienvenido ${usuarioVo.nombreUsuario}</h1>
                        <p><a href="categorias.jsp">Gestionar categor&#237;as</a></p>
                        <p><a href="productos.jsp">Gestionar productos</a></p>
                    </div>
                </div>
            </div>
        </section>

        <div class="ms-auto">
                <ul class="navbar-nav mb-2 mb-lg-0 d-flex align-self-auto">
                    <li class="nav-item">
                        <a class="nav-link btn btn-secondary text-white me-1" href="" data-bs-toggle="modal" data-bs-target="#signup"><i class="fas fa-user-plus me-1"></i></i>Crear usuario</a>
                    </li>
                </ul>
            </div>

<table id="datatable" class="table table-sm table-dark" style="width:100%">
    <thead>
        <tr class="table-primary">
            <th>#</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Email</th>
            <th>Contraseña</th>
            <th>Tipo Documento</th>
            <th>Numero Documento</th>
            <th>Estado</th>
            <th>Telefono</th>
            <th>Direccion</th>
            <th>Sexo</th>
            <th>Rol/Cargo</th>

            <th colspan="3">Acciones</th>
        </tr>
    </thead>

    <tfoot> 
        <tr class="table-primary">
            <th>#</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Email</th>
            <th>Contraseña</th>
            <th>Tipo Documento</th>
            <th>Numero Documento</th>
            <th>Estado</th>
            <th>Telefono</th>
            <th>Direccion</th>
            <th>Sexo</th>
            <th>Rol/Cargo</th>

            <th colspan="3">Acciones</th>
        </tr>
    </tfoot>
    <%UsuarioDAO usuDAO = new UsuarioDAO();
        ArrayList<UsuarioVO> listarUsuarios = usuDAO.listar();
        request.setAttribute("lista", listarUsuarios);
    %>

    <c:forEach items="${lista}" var="u">
        <tbody>
            <tr>
                <td>${u.getIdUsuario()}</td>
                <td>${u.getNombreUsuario()}</td>
                <td>${u.getApellidoUsuario()}</td>
                <td>${u.getEmailUsuario()}</td>
                <td>${u.getPassUsuario()}</td>
                <td>${u.getTipoDocumento()}</td>
                <td>${u.getNumDocumentoUsuario()}</td>

                <td>
                    <c:if test="${u.isEstadoUsuario() == true}">
                        <button class="btn btn-success rounded-pill">${u.isEstadoUsuario()}</button>
                    </c:if>
                    <c:if test="${u.isEstadoUsuario() == false}">
                        <button class="btn btn-danger rounded-pill">${u.isEstadoUsuario()}</button>
                    </c:if>
                </td>
                <td>${u.getTelefonoUsuario()}</td>
                <td>${u.getDireccionUsuario()}</td>
                <td>${u.getSexoUsuario()}</td>
                <% //if(request.getParameter("estado").equals(true))%>
                <td>${u.getIdRol()}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/Usuario"  method="POST" >
                        <input type="hidden" name="codigoId" value="${u.getIdUsuario()}">
                        <a><button type="submit" class="btn btn-secondary">Editar</button></a>
                        <input type="hidden" name="action" value="4">
                    </form>
                </td>
                <c:if test="${u.isEstadoUsuario() == true}">
                    <td>
                        <input type="hidden" name="codigoId" value="${u.getIdUsuario()}">
                        <button onclick="alertaInactivar(${u.getIdUsuario()}, true)"><i class="bi bi-person-check-fill fa-x5 text-success" style="font-size: 50px;"></i></button>
                    </td>
                </c:if>


                <c:if test="${u.isEstadoUsuario() == false}">
                    <td>
                        <input type="hidden" name="codigoId" value="${u.getIdUsuario()}">
                        <button onclick="alertaActivar(${u.getIdUsuario()}, false)"><i class="bi bi-person-x-fill fa-x5 text-danger" style="font-size: 50px;"></i></button>
                    </td>
                </c:if>
            </tr>
        </tbody>
    </c:forEach>
</table>
<%//cuando es diferente a nulo es que si hubo un error
    if (request.getAttribute("titleerror") != null) {%>
${titleerror}
<%} else {%>
${titleexito}
<%}%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>



<script src="DataTables/datatables.min.js" type="text/javascript"></script>
<script src="DataTables/DataTables-1.12.1/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="DataTables/jquery.min.js" type="text/javascript"></script>
<script src="js/main.js" type="text/javascript"></script>

<script src="https://kit.fontawesome.com/bdbed0aafa.js" crossorigin="anonymous"></script>
<!-- footer  -->
<jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
<!-- /footer  -->

<!-- File js  -->
<jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
<!-- /File js  -->

<jsp:include page="/WEB-INF/paginas/comunes/alerta-modal.jsp" />
</body>
<script>
                            $(document).ready(function () {
                                $('datatable').DataTable();
                            });

</script>
</html>
