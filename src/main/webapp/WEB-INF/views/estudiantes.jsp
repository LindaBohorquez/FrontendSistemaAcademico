<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Estudiantes</title>
</head>
<body>
<h2>Lista de Estudiantes</h2>

<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Correo</th>
        <th>Becas</th>
        <th>Créditos</th>
        <th>Estado</th>
        <th>Fecha Inscripción</th>
    </tr>
    <c:forEach var="est" items="${estudiantes}">
        <tr>
            <td><c:out value="${est.id}" /></td>
            <td><c:out value="${est.correoEstudiantil}" /></td>
            <td><c:out value="${est.becas}" /></td>
            <td><c:out value="${est.creditosAprobados}" /></td>
            <td><c:out value="${est.estado}" /></td>
            <td><c:out value="${est.fechaInscripcion}" /></td>
        </tr>
    </c:forEach>
</table>

<a href="/dashboard">Volver al dashboard</a>

</body>
</html>
