<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Roles</title>
    <link rel="stylesheet" href="<c:url value='/css/home.css' />" />
</head>
<body>
<div class="dashboard-container">
    <h2>Gestión de Roles</h2>
    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>
    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Rol Actual</th>
                <th>Nuevo Rol</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="persona" items="${personas}">
            <tr>
                <form action="/gestion-roles/cambiar-rol" method="post">
                    <td>${persona.nombre}</td>
                    <td>${persona.correo}</td>
                    <td>${persona.rolId}</td>
                    <td>
                        <select name="nuevoRol">
                            <option value="1">ADMINISTRADOR</option>
                            <option value="2">DOCENTE</option>
                            <option value="3">ESTUDIANTE</option>
                        </select>
                        <input type="hidden" name="personaId" value="${persona.id}" />
                    </td>
                    <td>
                        <button type="submit">Cambiar Rol</button>
                    </td>
                </form>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
