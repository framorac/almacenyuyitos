<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Listado Usuarios</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column"><h2 class="ui header">Lista de Usuarios</h2></div>
            <div class="column">
                <a class="ui button red" href="agregarUsuario.html"><i class="box icon"></i>NUEVO USUARIO</a>
            </div>
            <div class="column" style="margin-top: 10px">
                <table class="ui very compact table red selectable">
                    <thead class="full-width">
                        <tr>
                            <th>#</th>
                            <th>NOMBRE</th>
                            <th>APELLIDO</th>
                            <th>EMAIL</th>
                            <th>USERNAME</th>
                            <th>PERF&Iacute;L</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${fn:length(listaUsuarios) > 0}">
                            <c:forEach var="usuarios" items="${listaUsuarios}">
                                <tr>
                                    <td>${usuarios.ID_USUARIO}</td>
                                    <td>${usuarios.NOMBRE}</td>
                                    <td>${usuarios.APELLIDO}</td>
                                    <td>${usuarios.EMAIL}</td>
                                    <td>${usuarios.USERNAME}</td>
                                    <c:choose>
                                        <c:when test="${usuarios.ID_PERFIL=='1'}">
                                            <td>ADMINISTADOR</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>VENTAS</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>
                                        <div class="ui icon buttons">
                                            <a class="mini ui button green" href="editarUsuario.html?id=${usuarios.ID_USUARIO}">
                                                <i class="edit icon"></i>
                                            </a>
                                            <a class="mini ui button red" href="borrarUsuario.html?id=${usuarios.ID_USUARIO}">
                                                <i class="trash icon"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(listaUsuarios) == 0}">
                            <tr><td colspan="11">SIN DATOS</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>