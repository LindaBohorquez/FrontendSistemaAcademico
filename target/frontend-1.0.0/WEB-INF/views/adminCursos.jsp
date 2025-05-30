<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Administración de Cursos y Asignaturas</title>
</head>
<body>

<h2>Gestión de Materias</h2>

<form method="post" action="/admin/cursos/materia/guardar">
  <input type="hidden" name="id" value="${materia.id}" />
  <label>Nombre:</label>
  <input type="text" name="nombre" value="${materia.nombre}" required />
  <label>Estado:</label>
  <input type="text" name="estado" value="${materia.estado}" required />
  <button type="submit">${materia.id == null ? 'Crear' : 'Actualizar'}</button>
</form>

<table border="1">
  <tr>
    <th>ID</th>
    <th>Nombre</th>
    <th>Estado</th>
    <th>Acción</th>
  </tr>
  <c:forEach var="m" items="${materias}">
    <tr>
      <td>${m.id}</td>
      <td>${m.nombre}</td>
      <td>${m.estado}</td>
      <td>
        <form method="get" action="/admin/cursos" style="display:inline;">
          <input type="hidden" name="materiaId" value="${m.id}" />
          <button type="submit">Modificar</button>
        </form>
        <form method="post" action="/admin/cursos/materia/eliminar" style="display:inline;">
          <input type="hidden" name="id" value="${m.id}" />
          <button type="submit">Eliminar</button>
        </form>
      </td>
    </tr>
  </c:forEach>
</table>

<hr/>

<h2>Gestión de Asignaturas</h2>

<form method="post" action="/admin/cursos/asignatura/guardar">
  <input type="hidden" name="id" value="${asignatura.id}" />
  <label>Nombre:</label>
  <input type="text" name="nombre" value="${asignatura.nombre}" required />
  <label>ID Materia:</label>
  <input type="number" name="materiaId" value="${asignatura.materiaId}" required />
  <button type="submit">${asignatura.id == null ? 'Crear' : 'Actualizar'}</button>
</form>

<table border="1">
  <tr>
    <th>ID</th>
    <th>Nombre</th>
    <th>ID Materia</th>
    <th>Acción</th>
  </tr>
  <c:forEach var="a" items="${asignaturas}">
    <tr>
      <td>${a.id}</td>
      <td>${a.nombre}</td>
      <td>${a.materiaId}</td>
      <td>
        <form method="get" action="/admin/cursos" style="display:inline;">
          <input type="hidden" name="asignaturaId" value="${a.id}" />
          <button type="submit">Modificar</button>
        </form>
        <form method="post" action="/admin/cursos/asignatura/eliminar" style="display:inline;">
          <input type="hidden" name="id" value="${a.id}" />
          <button type="submit">Eliminar</button>
        </form>
      </td>
    </tr>
  </c:forEach>
</table>

</body>
</html>
