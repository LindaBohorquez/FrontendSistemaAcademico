<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Recursos Académicos</title></head>
<body>
<h2>Recursos</h2>
<table border="1">
    <tr><th>Nombre</th><th>Ubicación</th><th>Tipo</th><th>Disponible</th></tr>
    <c:forEach var="r" items="${recursos}">
        <tr>
            <td>${r.nombre}</td>
            <td>${r.ubicacionRecurso}</td>
            <td>${r.tipoRecurso}</td>
            <td>${r.disponible}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
