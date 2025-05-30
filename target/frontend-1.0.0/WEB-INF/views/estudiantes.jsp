<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Estudiantes</title></head>
<body>
<h2>Listado de Estudiantes</h2>
<table border="1">
    <tr>
        <th>ID</th><th>Correo</th><th>Becas</th><th>Créditos</th><th>Estado</th>
    </tr>
    <c:forEach var="e" items="${estudiantes}">
        <tr>
            <td>${e.id}</td>
            <td>${e.correoEstudiantil}</td>
            <td>${e.becas}</td>
            <td>${e.creditosAprobados}</td>
            <td>${e.estado}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
