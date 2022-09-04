<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cache.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>VariedadesAmpi|Administrador</title>
        <jsp:include page="/WEB-INF/paginas/comunes/head.jsp" />
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../js/funciones.js" type="text/javascript"></script>
        <!-- DATATABLES -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
        <!-- BOOTSTRAP -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
        <link href="../css/StyleAdmin.css" rel="stylesheet" type="text/css"/>
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
        <a href="" data-bs-toggle="modal" data-bs-target="#Create"><i class="fas fa-user-plus me-1"></i>Crear usuario</a>


        <div class="outer-wrapper">
            <div class="table-wrapper">
                <table id="usuario" class="tala">
                    <thead>
                        <tr>
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
                        <tr>
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
                                <td>${u.getIdRol()}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Usuario"  method="POST" >
                                        <input type="hidden" name="codigoId" value="${u.getIdUsuario()}">
                                        <a href="" data-bs-toggle="modal" data-bs-target="#Update"><button type="submit"><i class="fa-square-pen"></i></button></a>
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
            </div>
        </div>
                            <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.4.1.js"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <!-- DATATABLES -->
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
        </script>
        <!-- BOOTSTRAP -->
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
        </script>
        <script>
            $(document).ready(function () {
                $('#usuario').DataTable({
                    language: {
                        processing: "Tratamiento en curso...",
                        search: "Buscar&nbsp;:",
                        lengthMenu: "Agrupar de _MENU_ items",
                        info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                        infoEmpty: "No existen datos.",
                        infoFiltered: "(filtrado de _MAX_ elementos en total)",
                        infoPostFix: "",
                        loadingRecords: "Cargando...",
                        zeroRecords: "No se encontraron datos con tu busqueda",
                        emptyTable: "No hay datos disponibles en la tabla.",
                        paginate: {
                            first: "Primero",
                            previous: "Anterior",
                            next: "Siguiente",
                            last: "Ultimo"
                        },
                        aria: {
                            sortAscending: ": active para ordenar la columna en orden ascendente",
                            sortDescending: ": active para ordenar la columna en orden descendente"
                        }
                    },
                    scrollY: 400,
                    lengthMenu: [[10, 25, -1], [10, 25, "All"]],
                });
            });
        </script>
        <%//cuando es diferente a nulo es que si hubo un error
            if (request.getAttribute("titleerror") != null) {%>
        ${titleerror}
        <%} else {%>
        ${titleexito}
        <%}%>
        <script src="https://kit.fontawesome.com/bdbed0aafa.js" crossorigin="anonymous"></script>
        <!-- footer  -->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp" />
        <!-- /footer  -->

        <!-- File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/archivos-js.jsp" />
        <!-- /File js  -->
        <jsp:include page="/WEB-INF/paginas/comunes/alerta-modal.jsp" />
        <jsp:include page="CreateUser.jsp" />
        <jsp:include page="updateUser.jsp" />
    </body>
</html>
