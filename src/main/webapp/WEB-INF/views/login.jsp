<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Iniciar Sesión</h2>
    <form action="/login" method="post">

        <label>Correo:</label><br>
        <input type="email" name="correo" required><br><br>

        <label>Contraseña:</label><br>
        <input type="password" name="password" required><br><br>

        <input type="submit" value="Ingresar">
    </form>

    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>
</body>
</html>
