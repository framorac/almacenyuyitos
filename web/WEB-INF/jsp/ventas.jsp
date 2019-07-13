<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Lista de Ventas</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/jspdf.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <!--<div class="ui right aligned container">
                <form class="ui form" method="post" action="crearAbonoExcel.html">
                    <button class="ui button grey" type="submit"><i class="file excel icon"></i>Exportar Excel</button>
                </form>
            </div>-->
            <div class="column"><h2 class="ui header">Listado de Ventas</h2></div>
            <div class="column">
                <a class="ui button grey" href="agregarVenta.html"><i class="box icon"></i>NUEVA VENTA</a>
            </div>
            <div class="column" style="margin-top: 10px">
                <table class="ui selectable very compact table green">
                    <thead class="full-width">
                        <tr>
                            <th>#</th>
                            <th>VENDEDOR</th>
                            <th>TIPO VENTA</th>
                            <th>CLIENTE</th>
                            <th>FECHA VENTA</th>
                            <th>PRODUCTO</th>
                            <th>CANTIDAD</th>
                            <th>TOTAL</th>
                            <th>BOLETA</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${fn:length(ventas) > 0}">
                            <c:forEach var="venta" items="${ventas}">
                                <tr>
                                    <td>${venta.ID_VENTA}</td>
                                    <td>${venta.USUARIO_NOMBRE} ${venta.USUARIO_APELLIDO}</td>
                                    <td>${venta.TIPO_VENTA}</td>
                                    <td>${venta.CLIENTE_NOMBRE} ${venta.CLIENTE_APELLIDO}</td>
                                    <td>${venta.FECHA_VENTA}</td>
                                    <td>${venta.PRODUCTO}</td>
                                    <td>${venta.CANTIDAD}</td>
                                    <td>${venta.TOTAL}</td>
                                    <td>
                                        <button class="ui icon button" id="boletaDetalle${venta.ID_VENTA}">
                                            <i class="file pdf icon"></i>
                                        </button>
                                        <script type="text/javascript">
                                            $("#boletaDetalle${venta.ID_VENTA}").click(function () {
                                                var pdf = new jsPDF('p', 'pt', 'a4');
                                                pdf.text(20, 20, "Almacen Los Yuyitos");
                                                
                                                pdf.text(20, 60, "Boleta N°: ");
                                                pdf.text(180, 60, "${venta.ID_VENTA}");
                                                
                                                pdf.text(20, 80, "Vendedor: ");
                                                pdf.text(180, 80, "${venta.USUARIO_NOMBRE} ${venta.USUARIO_APELLIDO}");
                                                
                                                pdf.text(20, 100, "Tipo Venta: ");
                                                pdf.text(180, 100, "${venta.TIPO_VENTA}");
                                                
                                                pdf.text(20, 120, "Cliente: ");
                                                pdf.text(180, 120, "${venta.CLIENTE_NOMBRE} ${venta.CLIENTE_APELLIDO}");
                                                
                                                pdf.text(20, 140, "Fecha Venta:");
                                                pdf.text(180, 140, "${venta.FECHA_VENTA}");
                                                
                                                pdf.text(20, 160, "Producto: ");
                                                pdf.text(180, 160, "${venta.PRODUCTO}");
                                                
                                                pdf.text(20, 180, "Cantidad (unidades): ");
                                                pdf.text(180, 180, "${venta.CANTIDAD}");
                                                
                                                pdf.text(20, 200, "Monto Venta: ");
                                                pdf.text(180, 200, "${venta.TOTAL}");

                                                pdf.save('boleta_${venta.ID_VENTA}.pdf');
                                            });
                                        </script>
                                    </td>
                                    <td>
                                        <div class="ui icon buttons">
                                            <a class="mini ui button green" href="editarVenta.html?id=${venta.ID_VENTA}">
                                                <i class="edit icon"></i>
                                            </a>
                                            <a class="mini ui button red" href="borrarVenta.html?id=${venta.ID_VENTA}">
                                                <i class="trash icon"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(ventas) == 0}">
                            <tr><td colspan="3">SIN DATOS</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>