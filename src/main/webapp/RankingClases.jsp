<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ranking de Dictado de Clases</title>
</head>
<body>
<body data-bs-theme="dark">
<!-- Incluye el encabezado desde header.jsp -->
<%@ include file="header.jsp" %>
<!-- Contenido de la página principal -->
<div class="container mt-4">
    <h1>Ranking de Dictado de Clases</h1>

    <form id="rankingForm" action="RankingDictadoClases" method="post">
        <input type="submit" value="Ver Ranking">
    </form>

	</div>

    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>