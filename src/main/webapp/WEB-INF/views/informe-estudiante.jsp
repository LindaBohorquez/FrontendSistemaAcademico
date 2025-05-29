<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Informe Académico del Estudiante</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
<h2>Consultar Informe Académico</h2>

<form action="/informes/consultar" method="post">
  <label for="estudianteId">ID del Estudiante:</label>
  <input type="text" id="estudianteId" name="estudianteId" required />
  <input type="submit" value="Consultar" />
</form>

<c:if test="${not empty informe}">
  <hr/>
  <h3>Datos del Estudiante</h3>
  <p><strong>Nombre:</strong> ${informe.nombreEstudiante}</p>
  <p><strong>ID:</strong> ${informe.estudianteId}</p>
  <p><strong>Promedio Ponderado:</strong> ${informe.promedioPonderado}</p>
  <p><strong>Total Aprobadas:</strong> ${informe.totalAprobadas}</p>
  <p><strong>Total Reprobadas:</strong> ${informe.totalReprobadas}</p>
  <p><strong>Total en Curso:</strong> ${informe.totalEnCurso}</p>

  <h3>Detalle de Asignaturas</h3>
  <c:choose>
    <c:when test="${not empty informe.detalle}">
      <table border="1">
        <tr>
          <th>Asignatura</th>
          <th>Nota</th>
          <th>Estado</th>
          <th>Periodo</th>
        </tr>
        <c:forEach var="m" items="${informe.detalle}">
          <tr>
            <td>${m.asignaturaNombre}</td> <!-- CAMBIO AQUÍ -->
            <td>${m.nota}</td>
            <td>${m.estado}</td>
            <td>${m.periodo}</td>
          </tr>
        </c:forEach>
      </table>
    </c:when>
    <c:otherwise>
      <p>No hay asignaturas en el informe.</p>
    </c:otherwise>
  </c:choose>

  <br/>
  <a href="/informes/pdf/${informe.estudianteId}">📄 Descargar Informe en PDF</a>
</c:if>

</body>
</html>
