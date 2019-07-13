<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Editar Sub Familia Producto</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column">
                <form class="ui form" method="post">
                    <h4 class="ui dividing header">Editar Sub Familia</h4>
                    <div class="two fields">
                        <div class="field">
                            <label for="idFamiliaProd">Familia</label>
                            <select name="idFamiliaProd" required>
                                <option value="">Seleccionar Familia</option>
                                <c:forEach var="familia" items="${listaFamilia}">
                                    <option value="${familia.ID_FAMILIAPROD}">${familia.FAMILIA_PRODUCTO}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="field">
                            <label for="subFamilia">Sub Familia</label>
                            <input type="text" name="subFamilia" id="subFamilia" value="${subfamilia[0].SUB_FAMILIA}">
                        </div>
                    </div>
                    <div class="field">
                        <button class="ui button blue" type="submit">ACTUALIZAR FAMILIA</button>
                    </div>
                </form>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>