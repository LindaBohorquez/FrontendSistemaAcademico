<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head><title>Formulario Docente</title></head>
<body>
<h2>${docente.id == null ? 'Registrar Nuevo Docente' : 'Actualizar Docente'}</h2>

<form action="${docente.id == null ? '/docentes/guardar' : '/docentes/actualizar/' + docente.id}" method="post">
  <label>Correo Institucional:</label>
  <input type="text" name="correoInstitucional" value="${docente.correoInstitucional}" required /><br/>

  <label>Tipo:</label>
  <input type="text" name="tipo" value="${docente.tipo}" required /><br/>

  <label>Carga Horaria:</label>
  <input type="number" name="cargaHoraria" value="${docente.cargaHoraria}" min="0" max="40"/><br/>

  <label>ID Persona:</label>
  <input type="number" name="personaId" value="${docente.personaId}" required /><br/>

  <button type="submit">Guardar</button>
</form>
<a href="/docentes">Volver a la lista</a>
</body>
</html>
