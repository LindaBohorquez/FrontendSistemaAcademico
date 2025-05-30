<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Asignación de Cursos a Docentes</title>
</head>
<body>

<h2>Asignar Docente a Asignatura</h2>

<form method="post" action="/asignaciones/asignar">
    <label>Asignatura:</label>
    <select name="asignaturaId" required>
        <c:forEach var="a" items="${asignaturas}">
            <option value="${a.id}">${a.nombre} (Docente actual: ${a.docenteId != null ? a.docenteId : 'Ninguno'})</option>
        </c:forEach>
    </select><br/>

    <label>Docente:</label>
    <select name="docenteId" required>
        <c:forEach var="d" items="${docentes}">
            <option value="${d.id}">${d.correoInstitucional}</option>
        </c:forEach>
    </select><br/>

    <button type="submit">Asignar</button>
</form>

<hr/>

<h2>Asignaturas y sus Docentes</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>ID Docente Asignado</th>
        <th>ID Materia</th>
    </tr>
    <c:forEach var="a" items="${asignaturas}">
        <tr>
            <td>${a.id}</td>
            <td>${a.nombre}</td>
            <td>${a.docenteId != null ? a.docenteId : 'No asignado'}</td>
            <td>${a.materiaId}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
