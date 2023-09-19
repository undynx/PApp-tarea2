<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta usuario</title>
</head>
<body>
 <!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>
    
    
		<form action="ConsultaUsuario" method="post">
        
        <input type="submit" value="ver usuario">
    </form>
    
    
    
    
    <!-- Contenido de la página principal -->
    <div class="container mt-4">
        <p>Consulta de Usuarios</p>
    </div>
    
    <div class="container-fluid">
		
		<% String nick = (String) session.getAttribute("nickname"); 
			if (nick != null) { 
		%>	
		<div class="row">
			<div class="col-sm-6">Nickname</div>
			<div class="col-sm-6">${usuario.nickname}</div>
			<div class="col-sm-6">Nombre</div>
			<div class="col-sm-6">${usuario.nombre}</div>
			<div class="col-sm-6">Apellido</div>
			<div class="col-sm-6">${usuario.apellido}</div>
			<div class="col-sm-6">Correo Electronico</div>
			<div class="col-sm-6">${usuario.correoElectronico}</div>
			<div class="col-sm-6">Fecha de Nacimiento</div>
			<div class="col-sm-6">${usuario.fechaNacimiento}</div>
		</div>

		<div class="container-fluid" aria-labelledby="datosEspecificos">
		
		<% String tipo = (String) session.getAttribute("tipo");
		
		if (tipo == "Profesor") { %>
		<div class="row">
		
			<div class="col-sm-6">Descripcion:</div>
			<div class="col-sm-6">${usuario.descripcionGeneral}</div>
			<div class="col-sm-6">Biografia:</div>
			<div class="col-sm-6">${usuario.biografia}</div>
			<div class="col-sm-6">Sitio Web:</div>
			<div class="col-sm-6">${usuario.sitioWeb}</div>
			<div class="col-sm-6">Lista de clases dictadas:</div>
			<div class="col-sm-6">lista de clases</div>
		</div>


		<% } else { %>
			<div class="col-sm-6">Clases a las cuales está registrado:</div>
			<div class="col-sm-6">Lista de clases</div>

		>
		<% } %>
		</div>
							
		<% } else { %>
		
		<div class="display-1">HA OCURRIDO UN ERROR Y USTÉ NO DEVERÍA ESTAR BIENDO ESSTO MISHISHO</div>
		<% } %>
	</div>


    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>