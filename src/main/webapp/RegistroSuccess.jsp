<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exito</title>
<link rel="stylesheet" type="text/css" href="./assets/styles/index.css" />
</head>
<body class="body">
<!-- Incluye el encabezado desde header.jsp -->
	<%@ include file="header.jsp" %>
	 <div class="container mt-5">
	<h1>Se registro al usuario ${nombreUsuario} a la clase ${nombreClase} con exito</h1>
	</div>
<!-- Incluye el pie de página desde footer.jsp -->
	<%@ include file="footer.jsp" %>
</body>
</html>