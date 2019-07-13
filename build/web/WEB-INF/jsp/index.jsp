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
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="semantic/semantic.min.js" type="text/javascript"></script>
        <script src="js/scripts.js" type="text/javascript"></script>
        <style type="text/css">
            body {
                background-color: #DADADA;
            }
            body > .grid {
                height: 100%;
            }
            .image {
                margin-top: -100px;
            }
            .column {
                max-width: 450px;
            }
        </style>
        <script>
            $(document)
                    .ready(function () {
                        $('.ui.form')
                                .form({
                                    fields: {
                                        email: {
                                            identifier: 'username',
                                            rules: [
                                                {
                                                    type: 'empty',
                                                    prompt: 'Usuario Obligatorio'
                                                }
                                            ]
                                        },
                                        password: {
                                            identifier: 'password',
                                            rules: [
                                                {
                                                    type: 'empty',
                                                    prompt: 'Ingresar Contraseña'
                                                }
                                            ]
                                        }
                                    }
                                })
                                ;
                    })
                    ;
        </script>
    </head>
    <body>

        <div class="ui middle aligned center aligned grid">
            <div class="column">
                <h2 class="ui teal image header">
                    <div class="content">
                        Iniciar Sesi&oacute;n
                    </div>
                </h2>
                <form class="ui large form" method="post" action="validarLogin.html">
                    <div class="ui stacked segment">
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="username" placeholder="Usuario">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="password" name="password" placeholder="Contraseña">
                            </div>
                        </div>
                        <div class="field">
                            <select name="idPerfil" required>
                                <option value="1">ADMINISTRADOR</option>
                                <option value="2">VENTA</option>
                            </select>
                        </div>
                        <div class="ui fluid large teal submit button">ACCEDER</div>
                    </div>

                    <div class="ui error message"></div>

                </form>

                <div class="ui message">
                    ALMAC&Eacute;N LOS YUYITOS &COPY; 2019
                </div>
            </div>
        </div>
</html>