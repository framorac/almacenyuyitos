<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Listado Familia de Productos</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column"><h2 class="ui header">Lista Familia de Productos</h2></div>
            <div class="column">
                <a class="ui button blue" href="agregarFamilia.html"><i class="box icon"></i>NUEVA FAMILIA PRODUCTO</a>
            </div>
            <div class="column" style="margin-top: 10px">
                <table class="ui selectable very compact table yellow">
                    <thead class="full-width">
                        <tr>
                            <th>#</th>
                            <th>NOMBRE FAMILIA</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${fn:length(listaFamilias) > 0}">
                            <c:forEach var="familia" items="${listaFamilias}">
                                <tr>
                                    <td>${familia.ID_FAMILIAPROD}</td>
                                    <td>${familia.FAMILIA_PRODUCTO}</td>
                                    <td>
                                        <div class="ui icon buttons">
                                            <a class="mini ui button green" href="editarFamilia.html?id=${familia.ID_FAMILIAPROD}">
                                                <i class="edit icon"></i>
                                            </a>
                                            <a class="mini ui button red" href="borrarFamilia.html?id=${familia.ID_FAMILIAPROD}">
                                                <i class="trash icon"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(listaFamilias) == 0}">
                            <tr><td colspan="3">SIN DATOS</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>