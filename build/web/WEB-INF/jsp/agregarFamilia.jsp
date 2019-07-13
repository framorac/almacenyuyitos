<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Agregar Nueva Familia Producto</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column">
                <form class="ui form" method="post" action="agregarFamilia.html">
                    <h4 class="ui dividing header">Agregar Nueva Familia</h4>
                    <div class="two fields">
                        <div class="field">
                            <label for="familiaProducto">Familia Producto</label>
                            <input type="text" name="familiaProducto" id="familiaProducto">
                        </div>
                        <div class="field">
                        </div>
                    </div>
                    <div class="field">
                        <button class="ui button blue" type="submit">REGISTRAR FAMILIA</button>
                    </div>
                </form>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>