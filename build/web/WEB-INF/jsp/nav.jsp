<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:choose>
    <c:when test="${sessionScope.perfil == 1}">
        <div class="ui inverted labeled icon menu fixed">
        <a class="active red item" href="home.html"><i class="certificate icon"></i>Almac&eacute;n Yuyitos</a>
        <a class="item" href="ventas.html"><i class="shopping cart icon"></i>Ventas</a>
        <a class="item" href="clientes.html"><i class="address book icon"></i>Clientes</a>
        <a class="item" href="proveedores.html"><i class="shipping fast icon"></i>Proveedores</a>
        <a class="item" href="productos.html"><i class="box icon"></i>Productos</a>
        <a class="item" href="familias.html"><i class="box icon"></i>Familia</a>
        <a class="item" href="subfamilias.html"><i class="box icon"></i>Sub-Familia</a>
        <a class="item" href="usuarios.html"><i class="address book icon"></i>Usuarios</a>
        <a class="item" href="pedidos.html"><i class="dolly icon"></i>Pedidos</a>
        <a class="item" href="abonos.html"><i class="dollar sign icon"></i>Abonos</a>
        
        <div class="right menu">
            <a class="item" href="salir.html"><i class="sign out alternate icon"></i>Salir</a>
        </div>
        </div>
    </c:when>
    <c:when test="${sessionScope.perfil == 2}">
        <div class="ui inverted labeled icon menu fixed">
        <a class="active red item" href="home.html"><i class="certificate icon"></i>Almac&eacute;n Yuyitos</a>
        <a class="item" href="ventas.html"><i class="shopping cart icon"></i>Ventas</a>
        
        <div class="right menu">
            <a class="item" href="salir.html"><i class="sign out alternate icon"></i>Salir</a>
        </div>
        </div>
    </c:when>
</c:choose>
    
    
    
