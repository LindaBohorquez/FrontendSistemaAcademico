<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Informe Académico</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
  <script>
    function toggleMenu() {
      const layout = document.querySelector('.main-layout');
      layout.classList.toggle('aside-visible');
    }
  </script>
</head>
<body>
<div class="frame">
  <button class="menu-button" onclick="toggleMenu()">☰</button>

  <!-- Barra lateral (idéntica a la de home.jsp) -->
  <div class="aside">
    <div class="horizontal-border">
      <div class="foto-de-perfil"></div>
      <div class="heading">
        <div class="text-wrapper">Menú Principal</div>
      </div>
    </div>

    <div class="list">
      <a href="${pageContext.request.contextPath}/home" class="item">
        <span class="symbol">🏠</span>
        <span class="text-wrapper-2">Inicio</span>
      </a>
      <a href="${pageContext.request.contextPath}/informes" class="item">
        <span class="symbol">📄</span>
        <span class="text-wrapper-3">Informe Académico</span>
      </a>
      <a href="${pageContext.request.contextPath}/asistencias" class="item">
        <span class="symbol">📋</span>
        <span class="text-wrapper-4">Asistencias</span>
      </a>
      <a href="${pageContext.request.contextPath}/reservas" class="item">
        <span class="symbol">📚</span>
        <span class="text-wrapper-5">Recursos</span>
      </a>
    </div>
  </div>

  <!-- Contenido principal -->
  <div class="main-layout">
    <div class="container">
      <div class="header">
        <div class="heading">
          <div class="text-wrapper">Informe Académico</div>
          <div class="div">Consulta de rendimiento del estudiante</div>
        </div>
      </div>

      <div class="section">
        <div class="heading-2">
          <span class="symbol">📘</span>
          <span class="proceso-de-matricula">Consultar Informe</span>
        </div>

        <form action="${pageContext.request.contextPath}/informes/consultar" method="post" class="container-2">
          <label for="estudianteId" class="text-wrapper-2">ID del Estudiante:</label>
          <input type="text" id="estudianteId" name="estudianteId" required />
          <input type="submit" value="Consultar" />
        </form>

        <c:if test="${not empty informe}">
          <hr/>
          <h3 class="text-wrapper-3">Datos del Estudiante</h3>
          <p class="text-wrapper-2"><strong>Nombre:</strong> ${informe.nombreEstudiante}</p>
          <p class="text-wrapper-2"><strong>ID:</strong> ${informe.estudianteId}</p>
          <p class="text-wrapper-2"><strong>Promedio Ponderado:</strong> ${informe.promedioPonderado}</p>
          <p class="text-wrapper-2"><strong>Total Aprobadas:</strong> ${informe.totalAprobadas}</p>
          <p class="text-wrapper-2"><strong>Total Reprobadas:</strong> ${informe.totalReprobadas}</p>
          <p class="text-wrapper-2"><strong>Total en Curso:</strong> ${informe.totalEnCurso}</p>

          <h3 class="text-wrapper-3">Detalle de Asignaturas</h3>
          <c:choose>
            <c:when test="${not empty informe.detalle}">
              <table style="width: 100%; border-collapse: collapse; color: #dbe9f5;">
                <thead style="background-color: #34495e; color: #ffffff;">
                <tr>
                  <th style="padding: 8px;">Asignatura</th>
                  <th style="padding: 8px;">Nota</th>
                  <th style="padding: 8px;">Estado</th>
                  <th style="padding: 8px;">Periodo</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="m" items="${informe.detalle}">
                  <tr style="border-bottom: 1px solid #3e536e;">
                    <td style="padding: 8px;">${m.asignaturaNombre}</td>
                    <td style="padding: 8px;">${m.nota}</td>
                    <td style="padding: 8px;">${m.estado}</td>
                    <td style="padding: 8px;">${m.periodo}</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </c:when>
            <c:otherwise>
              <p class="text-wrapper-2">No hay asignaturas en el informe.</p>
            </c:otherwise>
          </c:choose>

          <br/>
          <a class="text-wrapper-4" href="${pageContext.request.contextPath}/informes/pdf/${informe.estudianteId}">
            Descargar Informe en PDF
          </a>
        </c:if>
      </div>
    </div>
  </div>
</div>
</body>
</html>
