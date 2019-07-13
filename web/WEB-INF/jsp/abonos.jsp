<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Abonos de Clientes</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <!--<div class="ui right aligned container">
                <form class="ui form" method="post" action="crearAbonoExcel.html">
                    <button class="ui button grey" type="submit"><i class="file excel icon"></i>Exportar Excel</button>
                </form>
            </div>-->
            <div class="column"><h2 class="ui header">Abonos de Clientes</h2></div>
            <div class="column">
                <a class="ui button grey" href="agregarAbono.html"><i class="box icon"></i>NUEVO ABONO</a>
            </div>
            <div class="column" style="margin-top: 10px">
                <table class="ui selectable very compact table grey">
                    <thead class="full-width">
                        <tr>
                            <th>#</th>
                            <th>CLIENTE</th>
                            <th>ABONO</th>
                            <th>FECHA ABONO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${fn:length(abonos) > 0}">
                            <c:forEach var="abono" items="${abonos}">
                                <tr>
                                    <td>${abono.ID_PAGOFIADO}</td>
                                    <td>${abono.NOMBRE} ${abono.APELLIDO}</td>
                                    <td>${abono.MONTO_ABONO}</td>
                                    <td>${abono.FECHA_ABONO}</td>
                                    <td>
                                        <div class="ui icon buttons">
                                            <a class="mini ui button green" href="editarAbono.html?id=${abono.ID_PAGOFIADO}">
                                                <i class="edit icon"></i>
                                            </a>
                                            <a class="mini ui button red" href="borrarAbono.html?id=${abono.ID_PAGOFIADO}">
                                                <i class="trash icon"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(abonos) == 0}">
                            <tr><td colspan="3">SIN DATOS</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>