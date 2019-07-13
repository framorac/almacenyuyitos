<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Agregar Nueva Venta</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/scripts.js" type="text/javascript"></script>
        <script>
            function calcularMonto() {
                var regex = /(\d+)/g;
                var select = document.getElementById("idProducto");
                var texto = select.options[select.selectedIndex].innerText;
                console.log(texto.match(regex));
                
                var precio = Number(texto.match(regex));
                var cantidad = document.getElementById("cantidad").value;
                var total = cantidad * precio;
                document.getElementById("total").value = total;
            }
        </script>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column">
                <form class="ui form" method="post" action="editarVenta.html">
                    <h4 class="ui dividing header">Editar Venta</h4>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="idUsuario">Vendedor</label>
                            <select name="idUsuario" required>
                                <option value="">-- SELECCIONAR VENDEDOR --</option>
                                <c:forEach var="vendedor" items="${vendedores}">
                                    <option value="${vendedor.ID_USUARIO}">${vendedor.NOMBRE} ${vendedor.APELLIDO}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="idTipoVenta">Tipo Venta</label>
                            <select name="idTipoVenta" required>
                                <option value="">-- SELECCIONAR TIPO VENTA --</option>
                                <c:forEach var="tipoVenta" items="${tipoVentas}">
                                    <option value="${tipoVenta.ID_TIPOVENTA}">${tipoVenta.TIPO_VENTA}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="idCliente">Cliente</label>
                            <select name="idCliente" required>
                                <option value="">-- SELECCIONAR CLIENTE --</option>
                                <c:forEach var="cliente" items="${clientes}">
                                    <option value="${cliente.ID_CLIENTE}">${cliente.NOMBRE} ${cliente.APELLIDO}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="fechaVenta">Fecha Venta</label>
                            <input type="date" name="fechaVenta" value="${venta[0].FECHA_VENTA}" required>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="descripcion">Observaci&oacute;n</label>
                            <input type="text" name="descripcion" value="${venta[0].DESCRIPCION}" required>
                        </div>
                        <div></div>
                    </div>
                    <div class="three fields">
                        <div class="field">
                            <label for="idProducto">Producto</label>
                            <select name="idProducto" id="idProducto" required>
                                <option value="">-- SELECCIONAR PRODUCTO --</option>
                                <c:forEach var="producto" items="${productos}">
                                    <option value="${producto.ID_PRODUCTO}">${producto.DESCRIPCION} Valor &dollar;${producto.PRECIO_VENTA}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="field">
                            <label for="cantidad">Cantidad</label>
                            <input type="number" name="cantidad" id="cantidad" value="${venta[0].CANTIDAD}" onchange="calcularMonto();" min="1">
                        </div>
                        <div class="field">
                            <label for="total">Monto Venta</label>
                            <input type="number" name="total" id="total" value="${venta[0].TOTAL}" min="1" readonly>
                        </div>
                    </div>
                    <div class="field">
                        <button class="ui button grey" type="submit">EDITAR VENTA</button>
                    </div>
                </form>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>