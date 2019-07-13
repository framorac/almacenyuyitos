<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Listado Pedidos</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/jspdf.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column"><h2 class="ui header">Lista de Pedidos</h2></div>
            <div class="column">
                <a class="ui button yellow" href="agregarPedido.html"><i class="box icon"></i>NUEVO PEDIDO</a>
            </div>
            <div class="column" style="margin-top: 10px">
                <table class="ui selectable very compact table yellow">
                    <thead class="full-width">
                        <tr>
                            <th>#</th>
                            <th>USUARIO</th>
                            <th>PROVEEDOR</th>
                            <th>FECHA PEDIDO</th>
                            <th>DETALLE</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${fn:length(listaPedidos) > 0}">
                            <c:forEach var="pedidos" items="${listaPedidos}">
                                <tr>
                                    <td>${pedidos.ID_PEDIDO}</td>
                                    <td>${pedidos.NOMBRE} ${pedidos.APELLIDO}</td>
                                    <td>${pedidos.RAZON_SOCIAL}</td>
                                    <td>${pedidos.FECHA_PEDIDO}</td>
                                    <td>
                                        <button class="ui icon button" id="descargaDetalle${pedidos.ID_PEDIDO}">
                                            <i class="file pdf icon"></i>Descargar Detalle
                                        </button>
                                        <script type="text/javascript">
                                            $("#descargaDetalle${pedidos.ID_PEDIDO}").click(function () {
                                                var pdf = new jsPDF('p', 'pt', 'a4');
                                                pdf.text(20, 20, "Almacen Los Yuyitos");
                                                
                                                pdf.text(20, 60, "ID: ");
                                                pdf.text(180, 60, "${pedidos.ID_PEDIDO}");
                                                
                                                pdf.text(20, 80, "Usuario Solicitante: ");
                                                pdf.text(180, 80, "${pedidos.NOMBRE} ${pedidos.APELLIDO}");
                                                
                                                pdf.text(20, 100, "Proveedor: ");
                                                pdf.text(180, 100, "${pedidos.RAZON_SOCIAL}");
                                                
                                                pdf.text(20, 120, "Fecha Pedido: ");
                                                pdf.text(180, 120, "${pedidos.FECHA_PEDIDO}");
                                                pdf.text(20, 140, "=========================================");
                                                pdf.text(20, 160, "Detalle Pedido: ");
                                                pdf.text(20, 190, "${pedidos.DETALLE}");

                                                pdf.save('detalle_pedido_${pedidos.ID_PEDIDO}.pdf');
                                            });
                                        </script>
                                    </td>
                                    <td>
                                        <div class="ui icon buttons">
                                            <a class="mini ui button green" href="editarPedido.html?id=${pedidos.ID_PEDIDO}">
                                                <i class="edit icon"></i>
                                            </a>
                                            <a class="mini ui button red" href="borrarPedido.html?id=${pedidos.ID_PEDIDO}">
                                                <i class="trash icon"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(listaPedidos) == 0}">
                            <tr><td colspan="6">SIN DATOS</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>