<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Información estudiantil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" />
    <link href="https://fonts.googleapis.com/css?family=Inter:400,700" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="frame">
    <button id="menuButton" class="menu-button">
        <i class="fas fa-bars"></i>
    </button>

    <div class="main-layout">
        <!-- ASIDE -->
        <aside class="aside aside-hidden" id="sidebar">
            <div class="horizontal-border">
                <div class="foto-de-perfil"></div>
                <div class="heading"><div class="text-wrapper">User</div></div>
            </div>
            <div class="div-wrapper">
                <div class="text-wrapper-2">NAVEGACIÓN PRINCIPAL</div>
            </div>
            <div class="list">
                <div class="item"><div class="symbol"><i class="fas fa-user"></i></div><div class="text-wrapper-3">Información Estudiantil</div></div>
                <div class="item"><div class="symbol"><i class="fas fa-info-circle"></i></div><div class="text-wrapper-3">Información Académica</div></div>
                <div class="item"><div class="symbol"><i class="fas fa-book"></i></div><div class="text-wrapper-3">Matrícula Académica</div></div>
                <div class="item"><div class="symbol"><i class="fas fa-book-open"></i></div><div class="text-wrapper-3">Consulta Académica</div></div>
                <div class="item"><div class="symbol"><i class="fas fa-heart"></i></div><p class="p">Reserva de Aulas y Laboratorios</p></div>
                <div class="item"><div class="symbol"><i class="fas fa-bell"></i></div><div class="text-wrapper-4">Notificaciones</div></div>
                <div class="item"><div class="symbol"><i class="fas fa-cogs"></i></div><div class="text-wrapper-5">Configuración</div></div>
            </div>
        </aside>

        <!-- CONTENIDO PRINCIPAL -->
        <div class="container">
            <header class="header">
                <div class="heading"><div class="text-wrapper">Información estudiantil</div></div>
                <div class="div-wrapper"><p class="div">Domingo 18 de Mayo de 2025</p></div>
            </header>

            <div class="section">
                <div class="heading-2">
                    <div class="symbol"><i class="fas fa-graduation-cap"></i></div>
                    <div class="proceso-de-matricula">Proceso de Matrícula</div>
                </div>
                <div class="container-2">
                    <p class="p">Para la realización del proceso de matrícula la Universidad ha dispuesto los siguientes requisitos:</p>
                </div>
                <div class="list">
                    <div class="item"><div class="text-wrapper-2">Pago de liquidación</div><div class="div-wrapper"><div class="symbol-2"><i class="fas fa-check"></i></div></div></div>
                    <div class="item"><div class="text-wrapper-3">Actualización Encuesta M.E.N</div><div class="div-wrapper"><div class="symbol-2"><i class="fas fa-check"></i></div></div></div>
                    <div class="item"><div class="text-wrapper-4">Examen de Serología</div><div class="div-wrapper"><div class="symbol-2"><i class="fas fa-check"></i></div></div></div>
                    <div class="item"><p class="text-wrapper-3">Paz y Salvo con las dependencias</p><div class="div-wrapper"><div class="symbol-2"><i class="fas fa-check"></i></div></div></div>
                </div>
            </div>

            <div class="section-2">
                <div class="background-border"><div class="container-3"><div class="text-wrapper-5"><i class="fas fa-file-invoice-dollar"></i></div></div><div class="container-4"><div class="text-wrapper-6">Liquidación Reportada</div></div></div>
                <div class="background-border"><div class="container-3"><div class="text-wrapper-5"><i class="fas fa-clipboard-list"></i></div></div><div class="container-4"><div class="text-wrapper-7">Encuesta M.E.N Diligenciada</div></div></div>
                <div class="background-border"><div class="container-3"><div class="text-wrapper-5"><i class="fas fa-vial"></i></div></div><div class="container-5"><div class="text-wrapper-8">Serología reportada</div><div class="container-6"><div class="text-wrapper-9">Div. Servicios Asistenciales (B.U)</div></div></div></div>
                <div class="background-border"><div class="container-3"><div class="text-wrapper-5"><i class="fas fa-dollar-sign"></i></div></div><div class="container-4"><div class="text-wrapper-10">No tiene deudas vigentes</div></div></div>
            </div>
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
