<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Agregar Nuevo Usuario</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column">
                <form class="ui form" method="post" action="editarPedido.html">
                    <h4 class="ui dividing header">Editar Pedido</h4>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="idUsuario">Usuario Solicitante</label>
                            <select name="idUsuario" required>
                                <option value="">-- SELECCIONAR USUARIO --</option>
                                <c:forEach var="usuario" items="${usuarios}">
                                    <option value="${usuario.ID_USUARIO}">${usuario.NOMBRE} ${usuario.APELLIDO}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="idProvedor">Proveedor</label>
                            <select name="idProveedor" required>
                                <option value="">-- SELECCIONAR PROVEEDOR --</option>
                                <c:forEach var="proveedor" items="${proveedores}">
                                    <option value="${proveedor.ID_PROVEEDOR}">${proveedor.RAZON_SOCIAL}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="fechaPedido">Fecha Pedido</label>
                            <input type="date" name="fechaPedido" value="${pedido[0].FECHA_PEDIDO}" required>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="detalle">Detalle</label>
                            <textarea name="detalle">${pedido[0].DETALLE}</textarea>
                        </div>
                        <div></div>
                    </div>
                    <div class="field">
                        <button class="ui button red" type="submit">ACTUALIZAR PEDIDO</button>
                    </div>
                </form>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>