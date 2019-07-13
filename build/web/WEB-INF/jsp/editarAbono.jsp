<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Agregar Nuevo Abono Cliente</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column">
                <form class="ui form" method="post" action="editarAbono.html">
                    <h4 class="ui dividing header">Editar Abono Cliente</h4>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="idCliente">Cliente</label>
                            <select name="idCliente" required>
                                <option value="">-- SELECCIONAR CLIENTE --</option>
                                <c:forEach var="cliente" items="${listaClientes}">
                                    <option value="${cliente.ID_CLIENTE}">${cliente.NOMBRE} ${cliente.APELLIDO}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="montoAbono">Monto Abono</label>
                            <input type="text" name="montoAbono" value="${abono[0].MONTO_ABONO}" required>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="fechaAbono">Fecha Abono</label>
                            <input type="date" name="fechaAbono" value="${abono[0].FECHA_ABONO}" required>
                        </div>
                        <div></div>
                    </div>
                    <div class="field">
                        <button class="ui button grey" type="submit">ACTUALIZAR ABONO</button>
                    </div>
                </form>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>