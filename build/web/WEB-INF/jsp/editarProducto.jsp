<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Agregar Nuevo Producto</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column">
                <form class="ui form" method="post" action="editarProducto.html">
                    <h4 class="ui dividing header">Agregar Nuevo Producto</h4>
                    <div class="three fields">
                        <div class="field">
                            <label for="familia">Familia Producto</label>
                            <select id="familia" onchange="ObtenerIdFam();" required>
                                <option value="">Seleccionar Familia Producto</option>
                                <c:forEach var="familia" items="${listaFamilias}">
                                    <option value="${familia.ID_FAMILIAPROD}">${familia.FAMILIA_PRODUCTO}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="field">
                            <label for="subFamilia">Sub-Familia</label>
                            <select name="idSubFamilia" id="idSubFamilia" onchange="ObtenerIdSub();" required>
                                <option value="">Seleccionar Sub-Familia</option>
                                <c:forEach var="subfamilia" items="${listaSubfamilias}">
                                    <option value="${subfamilia.ID_SUBFAMILIA}">${subfamilia.SUB_FAMILIA}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="field">
                            <label for="idProveedor">Proveedor</label>
                            <select name="idProveedor" id="idProveedor" onchange="ObtenerIdPro();" required>
                                <option value="">Seleccionar Proveedor</option>
                                <c:forEach var="proveedores" items="${listaProveedores}">
                                    <option value="${proveedores.ID_PROVEEDOR}">${proveedores.RAZON_SOCIAL}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="field">
                        <label for="descripcion">Descripci&oacute;n</label>
                        <input type="text" name="descripcion" id="descripcion" value="${producto[0].DESCRIPCION}">
                    </div>
                    <div class="five fields">
                        <div class="field">
                            <label for="fechaVencimiento">Fecha Vencimiento</label>
                            <input type="date" name="fechaVencimiento" id="fechaVencimiento" onchange="ObtenerFechaVen();" value="${producto[0].FECHA_VENCIMIENTO}">
                        </div>
                        <div class="field">
                            <label for="marca">Marca</label>
                            <input type="text" name="marca" id="marca" value="${producto[0].MARCA}">
                        </div>
                        <div class="field">
                            <label for="codigoProd">C&oacute;digo Producto</label>
                            <input type="text" name="codigoProd" id="codigoProd" value="${producto[0].CODIGO_PROD}" readonly>
                        </div>
                        <div class="field">
                            <label for="codigoBarra">Generar Código Barra</label>
                            <div class="fluid ui button green" id="btnBarra">GENERAR COD. BARRA</div>
                        </div>
                        <div class="field">
                            <div class="ui medium image">
                                <label for="imgBarra">&nbsp;</label>
                                <svg width="100" height="100" id="codBarra"></svg>
                            </div>
                        </div>
                    </div>
                    <div class="four fields">
                        <div class="field">
                            <label for="precioCompra">Precio Compra</label>
                            <input type="number" name="precioCompra" id="precioCompra" min="1" value="${producto[0].PRECIO_COMPRA}">
                        </div>
                        <div class="field">
                            <label for="precioVenta">Precio Venta</label>
                            <input type="number" name="precioVenta" id="precioVenta" min="1" value="${producto[0].PRECIO_VENTA}">
                        </div>
                        <div class="field">
                            <label for="stock">Stock</label>
                            <input type="number" name="stock" id="stock" min="1" value="${producto[0].STOCK}">
                        </div>
                        <div class="field">
                            <label for="stockCritico">Stock Cr&iacute;tico</label>
                            <input type="number" name="stockCritico" id="stockCritico" min="1" value="${producto[0].STOCK_CRITICO}">
                        </div>
                    </div>
                    <div class="field">
                        <button class="fluid ui button blue" type="submit">REGISTRAR PRODUCTO</button>
                    </div>
                </form>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
        <script>
            var codigo = document.getElementById("codigoProd").value;
            JsBarcode("#codBarra", codigo);
        </script>
    </body>
</html>