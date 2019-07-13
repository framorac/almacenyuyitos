<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Editar Proveedor</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column">
                <form class="ui form" method="post">
                    <h4 class="ui dividing header">Editar Proveedor</h4>
                    <div class="two fields">
                        <div class="field">
                            <label for="razonSocial">Raz&oacute;n Social</label>
                            <input type="text" name="razonSocial" id="razonSocial" value="${proveedor[0].RAZON_SOCIAL}">
                        </div>
                        <div class="field">
                            <label for="rut">R.U.T</label>
                            <input type="text" name="rut" id="rut" value="${proveedor[0].RUT}">
                        </div>
                    </div>
                    <div class="field">
                        <label for="direccion">Direcci&oacute;n</label>
                        <input type="text" name="direccion" id="direccion" value="${proveedor[0].DIRECCION}">
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
                            <input type="text" name="telefono" id="telefono" value="${proveedor[0].TELEFONO}">
                        </div>
                        <div class="field">
                            <label for="Email">Email</label>
                            <input type="text" name="email" id="email" value="${proveedor[0].EMAIL}">
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <label for="fechaCreacion">Fecha Creaci&oacute;n</label>
                            <input type="date" name="fechaCreacion" id="fechaCreacion" value="${proveedor[0].FECHA_CREACION}">
                        </div>
                        <div class="field">
                        </div>
                    </div>
                    <div class="field">
                        <button class="fluid ui button blue" type="submit">ACTUALIZAR PROVEEDOR</button>
                    </div>
                </form>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>