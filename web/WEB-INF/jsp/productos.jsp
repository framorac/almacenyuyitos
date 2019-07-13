<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Listado Productos</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column"><h2 class="ui header">Lista de Productos</h2></div>
            <div class="column">
                <a class="ui button orange" href="agregarProducto.html"><i class="box icon"></i>NUEVO PRODUCTO</a>
            </div>
            <div class="column" style="margin-top: 10px">
                <table class="ui selectable small very compact table orange">
                    <thead class="full-width">
                        <tr>
                            <th>#</th>
                            <th>PRODUCTO</th>
                            <th>PROVEEDOR</th>
                            <th>SUB FAMILIA</th>
                            <th>PRECIO COMPRA</th>
                            <th>PRECIO VENTA</th>
                            <th>STOCK</th>
                            <th>STOCK CRITICO</th>
                            <th>MARCA</th>
                            <th>CODIGO PRODUCTO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${fn:length(listaProductos) > 0}">
                            <c:forEach var="producto" items="${listaProductos}">
                                <tr>
                                    <td>${producto.ID_PRODUCTO}</td>
                                    <td>${producto.DESCRIPCION}</td>
                                    <td>${producto.RAZON_SOCIAL}</td>
                                    <td>${producto.SUB_FAMILIA}</td>
                                    <td>${producto.PRECIO_COMPRA}</td>
                                    <td>${producto.PRECIO_VENTA}</td>
                                    <td>${producto.STOCK}</td>
                                    <td>${producto.STOCK_CRITICO}</td>
                                    <td>${producto.MARCA}</td>
                                    <td>${producto.CODIGO_PROD}</td>
                                    <td>
                                        <div class="ui icon buttons">
                                            <a class="ui button green" href="editarProducto.html?id=${producto.ID_PRODUCTO}">
                                                <i class="edit icon"></i>
                                            </a>
                                            <a class="ui button red" href="borrarProducto.html?id=${producto.ID_PRODUCTO}">
                                                <i class="trash icon"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(listaProductos) == 0}">
                            <tr><td colspan="11">SIN DATOS</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>