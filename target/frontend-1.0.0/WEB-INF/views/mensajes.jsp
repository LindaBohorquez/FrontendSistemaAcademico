<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mensajería Privada</title>
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

    <!-- Barra lateral -->
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
            <a href="${pageContext.request.contextPath}/mensajes" class="item">
                <span class="symbol">💬</span>
                <span class="text-wrapper-5">Mensajes</span>
            </a>
        </div>
    </div>

    <!-- Contenido principal -->
    <div class="main-layout">
        <div class="container">
            <div class="header">
                <div class="heading">
                    <div class="text-wrapper">Mensajería Interna</div>
                    <div class="div">Chats y comunicación con otros usuarios</div>
                </div>
            </div>

            <div class="section">
                <c:set var="usuarioId" value="${sessionScope.usuarioId}" />
                <c:set var="usuarioNombre" value="${sessionScope.usuarioNombre}" />

                <div class="heading-2">
                    <span class="symbol">📨</span>
                    <span class="proceso-de-matricula">Bienvenido, ${usuarioNombre}</span>
                </div>

                <div class="container-2">
                    <h3 class="text-wrapper-3">Iniciar nuevo chat</h3>
                    <form action="${pageContext.request.contextPath}/mensajes/crear-chat" method="post">
                        <label for="destinatarioId" class="text-wrapper-2">ID del usuario:</label>
                        <input type="number" id="destinatarioId" name="destinatarioId" required />
                        <input type="submit" value="Crear Chat" />
                    </form>
                </div>

                <div class="container-2">
                    <h3 class="text-wrapper-3">Tus chats</h3>
                    <ul>
                        <c:forEach var="chat" items="${chats}">
                            <li class="text-wrapper-2">
                                <c:choose>
                                    <c:when test="${chat.participante1Id == usuarioId}">
                                        Chat con ${chat.nombreParticipante2}
                                    </c:when>
                                    <c:otherwise>
                                        Chat con ${chat.nombreParticipante1}
                                    </c:otherwise>
                                </c:choose>
                                -
                                <a href="${pageContext.request.contextPath}/mensajes/chat/${chat.id}" class="text-wrapper-4">
                                    Ver mensajes
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <c:if test="${not empty chatId}">
                    <hr/>
                    <h3 class="text-wrapper-3">Mensajes en el chat</h3>

                    <c:choose>
                        <c:when test="${not empty mensajes}">
                            <ul>
                                <c:forEach var="m" items="${mensajes}">
                                    <li class="text-wrapper-2">
                                        <strong>${m.nombreEmisor}</strong>: ${m.contenido}
                                        <c:if test="${m.editado}">(editado)</c:if>
                                        <span style="font-size: small;">[${m.fechaEnvio}]</span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <p class="text-wrapper-2">No hay mensajes aún. ¡Sé el primero en escribir!</p>
                        </c:otherwise>
                    </c:choose>

                    <form action="${pageContext.request.contextPath}/mensajes/chat/${chatId}/enviar" method="post" class="container-2">
                        <input type="hidden" name="destinatarioId" value="${destinatarioId}" />
                        <input type="text" name="contenido" placeholder="Escribe tu mensaje" required />
                        <input type="submit" value="Enviar" />
                    </form>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>
