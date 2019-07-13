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
        <script src="js/chartjs.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        <div class="ui three column doubling stackable grid container" style="margin-top: 50px">
            <div class="column">
                <div class="ui huge floating message">
                    <p>Bienvenido <strong>${usuario[0].NOMBRE} ${usuario[0].APELLIDO}</strong> !!!</p>
                </div>
            </div>
        </div>
        <div class="ui one column grid container" style="margin-top: 50px">
            <div class="column">
                <div class="ui fluid ordered steps">
                    <div class="completed step">
                        <div class="content">
                            <div class="title">CLIENTE</div>
                            <div class="description">El cliente es nuestro fin.</div>
                        </div>
                    </div>
                    <div class="completed step">
                        <div class="content">
                            <div class="title">Satisfacci&oacute;n</div>
                            <div class="description">Nuestro lema.</div>
                        </div>
                    </div>
                    <div class="active step">
                        <i class="smile outline icon"></i>
                        <div class="content">
                            <div class="title">Fidelizaci&oacute;n</div>
                            <div class="description">Nuestra mejora continua.</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>