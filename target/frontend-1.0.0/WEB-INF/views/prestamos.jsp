<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Préstamos</title></head>
<body>
<h2>Préstamos</h2>
<form method="post" action="/frontend/prestamos/guardar">
  Recurso: <select name="recurso.id">
  <c:forEach var="r" items="${recursos}">
    <option value="${r.id}">${r.nombre}</option>
  </c:forEach>
</select><br/>
  Solicitante ID: <input type="text" name="solicitante.id" /><br/>
  Fecha devolución estimada: <input type="datetime-local" name="fechaDevolucionEstimada" /><br/>
  <button type="submit">Prestar</button>
</form>
<table border="1">
  <tr><th>ID</th><th>Recurso</th><th>Estado</th><th>Acciones</th></tr>
  <c:forEach var="p" items="${prestamos}">
    <tr>
      <td>${p.id}</td>
      <td>${p.recurso.nombre}</td>
      <td>${p.estado}</td>
      <td>
        <a href="/frontend/prestamos/devolver/${p.id}">Devolver</a> |
        <a href="/frontend/prestamos/mantenimiento/${p.id}">Mantenimiento</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>