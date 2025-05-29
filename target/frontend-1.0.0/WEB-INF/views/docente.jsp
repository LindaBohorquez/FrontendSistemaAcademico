<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Docentes</title></head>
<body>
<h2>Listado de Docentes</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Correo Institucional</th>
        <th>Tipo</th>
        <th>Carga Horaria</th>
        <th>ID Persona</th>
    </tr>
    <c:forEach var="d" items="${docentes}">
        <tr>
            <td>${d.id}</td>
            <td>${d.correoInstitucional}</td>
            <td>${d.tipo}</td>
            <td>${d.cargaHoraria}</td>
            <td>${d.personaId}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
