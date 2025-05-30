<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Gestión de Docentes</title>
</head>
<body>

<h2>Docentes Registrados</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Correo Institucional</th>
        <th>Tipo</th>
        <th>Carga Horaria</th>
        <th>ID Persona</th>
        <th>Acción</th>
    </tr>
    <c:forEach var="d" items="${docentes}">
        <tr>
            <td>${d.id}</td>
            <td>${d.correoInstitucional}</td>
            <td>${d.tipo}</td>
            <td>${d.cargaHoraria}</td>
            <td>${d.personaId}</td>
            <td>
                <!-- Botón Modificar -->
                <form method="get" action="/docentes" style="display:inline;">
                    <input type="hidden" name="id" value="${d.id}" />
                    <button type="submit">Modificar</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<hr/>

<h2>Registrar/Modificar Docente</h2>
<form action="/docentes/guardar" method="post">
    <input type="hidden" name="id" value="${docente.id}" />

    <label>Correo Institucional:</label>
    <input type="text" name="correoInstitucional" value="${docente.correoInstitucional}" required /><br/>

    <label>Tipo:</label>
    <input type="text" name="tipo" value="${docente.tipo}" required /><br/>

    <label>Carga Horaria:</label>
    <input type="number" name="cargaHoraria" value="${docente.cargaHoraria}" min="0" max="40" /><br/>

    <label>ID Persona:</label>
    <input type="number" name="personaId" value="${docente.personaId}" required /><br/>

    <button type="submit">Guardar</button>
</form>

</body>
</html>
