<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Lista de Proveedores</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column"><h2 class="ui header">Lista de Proveedores</h2></div>
            <div class="column">
                <a class="ui button blue" href="agregarProveedor.html">
                    <i class="user plus icon"></i>NUEVO PROVEEDOR
                </a>
            </div>
            <div class="column" style="margin-top: 10px">
                <table class="ui selectable very compact table blue">
                    <thead class="full-width">
                        <tr>
                            <th>#</th>
                            <th>RUT</th>
                            <th>RAZ&Oacute;N SOCIAL</th>
                            <th>DIRECCI&Oacute;N</th>
                            <th>COMUNA</th>
                            <th>TEL&Eacute;FONO</th>
                            <th>EMAIL</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${fn:length(listaProveedores) > 0}">
                            <c:forEach var="proveedor" items="${listaProveedores}">
                                <tr>
                                    <td>${proveedor.ID_PROVEEDOR}</td>
                                    <td>${proveedor.RUT}</td>
                                    <td>${proveedor.RAZON_SOCIAL}</td>
                                    <td>${proveedor.DIRECCION}</td>
                                    <td>${proveedor.COMUNA_NOMBRE}</td>
                                    <td>${proveedor.TELEFONO}</td>
                                    <td>${proveedor.EMAIL}</td>
                                    <td>
                                        <div class="ui icon buttons">
                                            <a class="mini ui button green" href="editarProveedor.html?id=${proveedor.ID_PROVEEDOR}">
                                                <i class="edit icon"></i>
                                            </a><br/>
                                            <a class="mini ui button red" href="borrarProveedor.html?id=${proveedor.ID_PROVEEDOR}">
                                                <i class="trash icon"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(listaProveedores) == 0}">
                            <tr><td colspan="11">SIN DATOS</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>