<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Lista de Clientes</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column"><h2 class="ui header">Lista de Clientes</h2></div>
            <div class="column">
                <a class="ui button blue" href="agregarCliente.html">
                    <i class="user plus icon"></i>NUEVO CLIENTE
                </a>
            </div>
            <div class="column" style="margin-top: 10px">
                <table class="ui selectable very compact table red">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>RUT</th>
                            <th>NOMBRE</th>
                            <th>APELLIDO</th>
                            <th>DIRECCI&Oacute;N</th>
                            <th>COMUNA</th>
                            <th>TEL&Eacute;FONO</th>
                            <th>EMAIL</th>
                            <th>D&Iacute;A PAGO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${fn:length(listaClientes) > 0}">
                            <c:forEach var="cliente" items="${listaClientes}">
                                <tr>
                                    <td>${cliente.ID_CLIENTE}</td>
                                    <td>${cliente.RUT}</td>
                                    <td>${cliente.NOMBRE}</td>
                                    <td>${cliente.APELLIDO}</td>
                                    <td>${cliente.DIRECCION}</td>
                                    <td>${cliente.COMUNA_NOMBRE}</td>
                                    <td>${cliente.TELEFONO}</td>
                                    <td>${cliente.EMAIL}</td>
                                    <td>${cliente.DIA_PAGO}</td>
                                    <td>
                                        <div class="ui icon buttons">
                                            <a class="mini ui button green" href="editarCliente.html?id=${cliente.ID_CLIENTE}">
                                                <i class="edit icon"></i>
                                            </a><br/>
                                            <a class="mini ui button red" href="borrarCliente.html?id=${cliente.ID_CLIENTE}">
                                                <i class="trash icon"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(listaClientes) == 0}">
                            <tr><td colspan="10">SIN DATOS</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>