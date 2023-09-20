<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modificacion de Usuario</title>
<link rel="stylesheet" type="text/css" href="./assets/styles/index.css" />
</head>
<body class="body">
 <!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>

    <!-- Contenido de la página principal -->
    <div class="container mt-4">
        <h3>Modificacion de Usuario</h3>
        
        <table class="table table-sm">
        	<tr>
		        <td class="fw-bold">Tipo de Usuario</td>
		        <td>${tipoUsuarioObtenido}</td>
		    </tr>
        	<tr>
		        <td class="fw-bold">Nickname</td>
		        <td>${usuarioObtenido.nickname}</td>
		    </tr>
		    <tr>
		        <td class="fw-bold">Nombre</td>
		        <td>${usuarioObtenido.nombre}</td>
		    </tr>
		    <tr>
		        <td class="fw-bold">Apellido</td>
		        <td>${usuarioObtenido.apellido}</td>
		    </tr>
		    <tr>
		        <td class="fw-bold">Correo Electronico</td>
		        <td>${usuarioObtenido.correoElectronico}</td>
		    </tr>
		    <tr>
		        <td class="fw-bold">Fecha de Nacimiento</td>
		        <td>${usuarioObtenido.fechaNacimiento}</td>
		    </tr>
		    
		    <% String tipo = (String) request.getAttribute("tipoUsuarioObtenido"); %>
		    <% if (request.getAttribute("tipoUsuarioObtenido").equals("Profesor")) { %>
		    	<tr>
			        <td class="fw-bold">Biografia</td>
			        <td>${usuarioObtenido.biografia}</td>
			    </tr>
			    <tr>
			        <td class="fw-bold">Descripción General</td>
			        <td>${usuarioObtenido.descripcionGeneral}</td>
			    </tr>
			    <tr>
			        <td class="fw-bold">Sitio Web</td>
			        <td>${usuarioObtenido.sitioWeb}</td>
			    </tr>
		    <% } %>
		</table>
    </div>

    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>