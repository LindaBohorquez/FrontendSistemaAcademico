<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Gestión de Calificaciones</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
<h2>Calificaciones Registradas</h2>

<table border="1">
  <tr>
    <th>ID</th>
    <th>Estudiante</th>
    <th>Asignatura</th>
    <th>1er Previo</th>
    <th>2do Previo</th>
    <th>3er Previo</th>
    <th>Examen Final</th>
    <th>Definitiva</th>
    <th>Acción</th>
  </tr>
  <c:forEach var="c" items="${calificaciones}">
    <tr>
      <td>${c.id}</td>
      <td>${c.estudianteId}</td>
      <td>${c.asignaturaId}</td>
      <td>${c.primerPrevio}</td>
      <td>${c.segundoPrevio}</td>
      <td>${c.tercerPrevio}</td>
      <td>${c.examenFinal}</td>
      <td>${c.definitiva}</td>
      <td>
        <form action="/calificaciones/modificar" method="post">
          <input type="hidden" name="id" value="${c.id}" />
          <input type="submit" value="Modificar" />
        </form>
      </td>
    </tr>
  </c:forEach>
</table>

<h3>Registrar/Modificar Calificación</h3>
<form action="/calificaciones/guardar" method="post">
  ID (si se va a modificar): <input type="text" name="id" /><br/>
  Estudiante ID: <input type="text" name="estudianteId" required/><br/>
  Asignatura ID: <input type="text" name="asignaturaId" required/><br/>
  1er Previo: <input type="number" step="0.1" name="primerPrevio" /><br/>
  2do Previo: <input type="number" step="0.1" name="segundoPrevio" /><br/>
  3er Previo: <input type="number" step="0.1" name="tercerPrevio" /><br/>
  Examen Final: <input type="number" step="0.1" name="examenFinal" /><br/>
  Habilitación: <input type="checkbox" name="habilitacion" value="true" /><br/>
  Vacacional: <input type="checkbox" name="vacacional" value="true" /><br/>
  <input type="submit" value="Guardar" />
</form>
</body>
</html>