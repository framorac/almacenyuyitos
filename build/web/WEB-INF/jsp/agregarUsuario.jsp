<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Yuyitos - Agregar Nuevo Usuario</title>
        <link href="semantic/semantic.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="ui container" style="margin-top: 100px">
            <div class="column">
                <form class="ui form" method="post" action="agregarUsuario.html">
                    <h4 class="ui dividing header">Agregar Nuevo Usuario</h4>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="idPerfil">Perfil</label>
                            <select name="idPerfil" required>
                                <option value="">-- SELECCIONAR PERFIL --</option>
                                <option value="1">ADMINISTRADOR</option>
                                <option value="2">VENTA</option>
                            </select>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="nombre">Nombre</label>
                            <input type="text" name="nombre" required>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="apellido">Apellido</label>
                            <input type="text" name="apellido" required>
                        </div>
                        <div></div>
                    </div>
                    <div class="fields">
                        <div class="three wide field">
                            <label for="username">Username</label>
                            <div class="ui left icon input">
                                <input type="text" name="username" required>
                                <i class="user icon"></i>
                            </div>
                        </div>
                        <div class="three wide field">
                            <label for="password">Password</label>
                            <div class="ui left icon input">
                                <input type="password" name="password" required>
                                <i class="lock icon"></i>
                            </div>
                        </div>
                    </div>
                    <div class="fields">
                        <div class="six wide field">
                            <label for="email">Email</label>
                            <input type="email" name="email" required>
                        </div>
                        <div></div>
                    </div>
                    <div class="field">
                        <button class="ui button red" type="submit">REGISTRAR USUARIO</button>
                    </div>
                </form>
            </div>
        </div>        
        <jsp:include page="footer.jsp" />
    </body>
</html>