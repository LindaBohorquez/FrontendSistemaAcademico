<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Reservas</title></head>
<body>
<h2>Reservas</h2>
<form method="post" action="/frontend/reservas/guardar">
    Nombre: <input type="text" name="nombre" /><br/>
    Fecha Inicio: <input type="datetime-local" name="fechaInicio" /><br/>
    Fecha Fin: <input type="datetime-local" name="fechaFin" /><br/>
    Recurso: <select name="recursoAcademico.id">
    <c:forEach var="r" items="${recursos}">
        <option value="${r.id}">${r.nombre}</option>
    </c:forEach>
</select><br/>
    <button type="submit">Reservar</button>
</form>
<table border="1">
    <tr><th>Nombre</th><th>Inicio</th><th>Fin</th><th>Estado</th></tr>
    <c:forEach var="res" items="${reservas}">
        <tr>
            <td>${res.nombre}</td>
            <td>${res.fechaInicio}</td>
            <td>${res.fechaFin}</td>
            <td>${res.estado}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>