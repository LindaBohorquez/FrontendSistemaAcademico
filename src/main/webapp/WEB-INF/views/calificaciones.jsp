<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Gestión de Calificaciones</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" />
  <link href="https://fonts.googleapis.com/css?family=Inter:400,700" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="frame">
  <button id="menuButton" class="menu-button"><i class="fas fa-bars"></i></button>

  <div class="main-layout">
    <!-- Sidebar -->
    <aside class="aside aside-hidden" id="sidebar">
      <div class="horizontal-border">
        <div class="foto-de-perfil"></div>
        <div class="heading"><div class="text-wrapper">User</div></div>
      </div>
      <div class="div-wrapper">
        <div class="text-wrapper-2">NAVEGACIÓN PRINCIPAL</div>
      </div>
      <div class="list">
        <div class="item" onclick="location.href='${pageContext.request.contextPath}/home'"><div class="symbol"><i class="fas fa-user"></i></div><div class="text-wrapper-3">Información Estudiantil</div></div>
        <div class="item" onclick="location.href='${pageContext.request.contextPath}/calificaciones'"><div class="symbol"><i class="fas fa-star"></i></div><div class="text-wrapper-3">Evaluación y Calificaciones</div></div>
        <!-- Puedes agregar más enlaces aquí -->
      </div>
    </aside>

    <!-- Contenido principal -->
    <div class="container">
      <header class="header">
        <div class="heading"><div class="text-wrapper">Módulo de Evaluación y Calificaciones</div></div>
      </header>

      <div class="section">
        <h2 class="text-wrapper-5">Calificaciones Registradas</h2>
        <table border="1" class="p">
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
                <form action="${pageContext.request.contextPath}/calificaciones/modificar" method="post">
                  <input type="hidden" name="id" value="${c.id}" />
                  <input type="submit" value="Modificar" />
                </form>
              </td>
            </tr>
          </c:forEach>
        </table>
      </div>

      <div class="section">
        <h3 class="text-wrapper-5">Registrar/Modificar Calificación</h3>
        <form action="${pageContext.request.contextPath}/calificaciones/guardar" method="post"
              style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; max-width: 800px; color: #dbe9f5;">

          <div style="grid-column: span 2;">
            <label style="color: #dbe9f5;">ID (si se va a modificar):</label><br/>
            <input type="text" name="id"
                   style="width: 100%; background-color: #1f2a37; color: #dbe9f5; border: 1px solid #76c7f3; border-radius: 4px; padding: 6px;" />
          </div>

          <div>
            <label style="color: #dbe9f5;">Estudiante ID:</label><br/>
            <input type="text" name="estudianteId" required
                   style="width: 100%; background-color: #1f2a37; color: #dbe9f5; border: 1px solid #76c7f3; border-radius: 4px; padding: 6px;" />
          </div>

          <div>
            <label style="color: #dbe9f5;">Asignatura ID:</label><br/>
            <input type="text" name="asignaturaId" required
                   style="width: 100%; background-color: #1f2a37; color: #dbe9f5; border: 1px solid #76c7f3; border-radius: 4px; padding: 6px;" />
          </div>

          <div>
            <label style="color: #dbe9f5;">1er Previo:</label><br/>
            <input type="number" step="0.1" name="primerPrevio"
                   style="width: 100%; background-color: #1f2a37; color: #dbe9f5; border: 1px solid #76c7f3; border-radius: 4px; padding: 6px;" />
          </div>

          <div>
            <label style="color: #dbe9f5;">2do Previo:</label><br/>
            <input type="number" step="0.1" name="segundoPrevio"
                   style="width: 100%; background-color: #1f2a37; color: #dbe9f5; border: 1px solid #76c7f3; border-radius: 4px; padding: 6px;" />
          </div>

          <div>
            <label style="color: #dbe9f5;">3er Previo:</label><br/>
            <input type="number" step="0.1" name="tercerPrevio"
                   style="width: 100%; background-color: #1f2a37; color: #dbe9f5; border: 1px solid #76c7f3; border-radius: 4px; padding: 6px;" />
          </div>

          <div>
            <label style="color: #dbe9f5;">Examen Final:</label><br/>
            <input type="number" step="0.1" name="examenFinal"
                   style="width: 100%; background-color: #1f2a37; color: #dbe9f5; border: 1px solid #76c7f3; border-radius: 4px; padding: 6px;" />
          </div>

          <div style="grid-column: span 2; display: flex; gap: 20px; align-items: center;">
            <label style="color: #c9d6e0;">
              <input type="checkbox" name="habilitacion" value="true" />
              Habilitación
            </label>
            <label style="color: #c9d6e0;">
              <input type="checkbox" name="vacacional" value="true" />
              Vacacional
            </label>
          </div>

          <div style="grid-column: span 2; text-align: center;">
            <input type="submit" value="Guardar"
                   style="padding: 10px 20px; background-color: #76c7f3; border: none; color: #1f2a37; font-weight: bold; border-radius: 5px; cursor: pointer;" />
          </div>
        </form>
      </div>

    </div>
</div>

<script>
  document.getElementById('menuButton').addEventListener('click', function () {
    const aside = document.getElementById('sidebar');
    const layout = document.querySelector('.main-layout');
    aside.classList.toggle('aside-hidden');
    layout.classList.toggle('aside-visible');
  });
</script>

</body>
</html>
