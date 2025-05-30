<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Docentes</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/docente.css"/>
</head>
<body>
<div class="container">
    <div class="card">
        <h1 class="title">Lista de Docentes</h1>

        <div class="actions">
            <a href="${pageContext.request.contextPath}/admin/docentes/form" class="button">Registrar Docente</a>
        </div>

        <div class="table">
            <div class="table-header">
                <div class="table-cell">Nombre</div>
                <div class="table-cell">Apellido</div>
                <div class="table-cell">Correo</div>
                <div class="table-cell">Teléfono</div>
                <div class="table-cell">Acciones</div>
            </div>

            <c:forEach var="docente" items="${docentes}">
                <div class="table-row">
                    <div class="table-cell">${docente.nombre}</div>
                    <div class="table-cell">${docente.apellido}</div>
                    <div class="table-cell">${docente.correo}</div>
                    <div class="table-cell">${docente.telefono}</div>
                    <div class="table-cell">
                        <a href="${pageContext.request.contextPath}/admin/docentes/edit/${docente.id}" class="button small">Editar</a>
                        <a href="${pageContext.request.contextPath}/admin/docentes/delete/${docente.id}" class="button small danger">Eliminar</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
