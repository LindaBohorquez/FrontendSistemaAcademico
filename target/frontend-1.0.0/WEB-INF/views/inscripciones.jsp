<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Gestión de Inscripciones</title>
  <link rel="stylesheet" href="<c:url value='/css/home.css' />" />
</head>
<body>
<h2>Bienvenido, ${usuario}</h2>

<c:if test="${not empty mensaje}">
  <p style="color: green;">${mensaje}</p>
</c:if>

<h3>Asignaturas Inscritas</h3>
<table border="1">
  <tr>
    <th>Nombre</th>
    <th>Código</th>
    <th>Acción</th>
  </tr>
  <c:forEach var="inscripcion" items="${asignaturasInscritas}">
    <tr>
      <td>${inscripcion.asignatura.nombre}</td>
      <td>${inscripcion.asignatura.codigo}</td>
      <td>
        <form action="<c:url value='/inscripciones/cancelar' />" method="post">
          <input type="hidden" name="idAsignatura" value="${inscripcion.asignatura.id}" />
          <button type="submit">Cancelar</button>
        </form>
      </td>
    </tr>
  </c:forEach>
</table>

<h3>Asignaturas Disponibles para Inscribir</h3>
<form action="<c:url value='/inscripciones/inscribir' />" method="post">
  <select name="idAsignatura" required>
    <option value="" disabled selected>Seleccione asignatura</option>
    <c:forEach var="asig" items="${asignaturasDisponibles}">
      <option value="${asig.id}">${asig.nombre} (${asig.codigo})</option>
    </c:forEach>
  </select>
  <button type="submit">Inscribir</button>
</form>

<br/>
<a href="<c:url value='/logout' />">Cerrar sesión</a>
</body>
</html>
