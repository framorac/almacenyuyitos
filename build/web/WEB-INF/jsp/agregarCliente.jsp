<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Agregar Nuevo Cliente</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column">
                <form class="ui form" method="post" action="agregarCliente.html" id="agregaCliente">
                    <h4 class="ui dividing header">Agregar Nuevo Cliente</h4>
                    <div class="two fields">
                        <div class="field">
                            <label for="nombre">Nombre</label>
                            <input type="text" name="nombre" id="nombre">
                        </div>
                        <div class="field">
                            <label for="apellido">Apellido</label>
                            <input type="text" name="apellido" id="apellido">
                        </div>
                    </div>
                    <div class="field">
                        <label for="rut">R.U.N</label>
                        <input type="text" name="rut" id="rut">
                    </div>
                    <div class="field">
                        <label for="direccion">Direcci&oacute;n</label>
                        <input type="text" name="direccion" id="direccion">
                    </div>
                    <div class="three fields">
                        <div class="field">
                            <label for="region">Regi&oacute;n</label>
                            <select required>
                                <option value="">Seleccionar Regi&oacute;n</option>
                                <c:forEach var="region" items="${regiones}">
                                    <option value="${region.REGION_ID}">${region.REGION_NOMBRE}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="field">
                            <label for="provincia">Provincia</label>
                            <select required>
                                <option value="">Seleccionar Provincia</option>
                                <c:forEach var="provincia" items="${provincias}">
                                    <option value="${provincia.PROVINCIA_ID}">${provincia.PROVINCIA_NOMBRE}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="field">
                            <label for="comuna">Comuna</label>
                            <select name="idComuna" required>
                                <option value="">Seleccionar Comuna</option>
                                <c:forEach var="comuna" items="${comunas}">
                                    <option value="${comuna.COMUNA_ID}">${comuna.COMUNA_NOMBRE}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label for="telefono">Telefono</label>
                            <input type="text" name="telefono" id="telefono">
                        </div>
                        <div class="field">
                            <label for="Email">Email</label>
                            <input type="text" name="email" id="email">
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label for="diaPago">D&iacute;a De Pago</label>
                            <input type="number" name="diaPago" id="diaPago" min="1" max="31">
                        </div>
                        <div class="field">
                            <label for="fechaCreacion">Fecha Creaci&oacute;n</label>
                            <input type="date" name="fechaCreacion" id="fechaCreacion">
                        </div>
                    </div>
                    <div class="field">
                        <button class="fluid ui button blue" type="submit">REGISTRAR CLIENTE</button>
                    </div>
                </form>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>