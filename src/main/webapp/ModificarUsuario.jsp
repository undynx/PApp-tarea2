<%@page import="org.hibernate.internal.build.AllowSysOut"%>
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
 <%@ page import="datatypes.DtUsuario" %>
 <%@ page import = "java.util.Date" %>
  <%@ page import = "java.text.DateFormat" %>
   <%@ page import = "java.text.SimpleDateFormat" %>
    <%@ include file="header.jsp" %>

    <!-- Contenido de la página principal -->
    <div class="container mt-4">
        <h3>Modificacion de Usuario</h3>
        <% DtUsuario usuario = (DtUsuario) request.getAttribute("usuarioObtenido"); %>
        <% DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
           String strDate = dateFormat.format(usuario.getFechaNacimiento());
        %>
        
        <form
        	action="ModificarUsuario"
        	method="post"
        	id="form"
        >
        	<input type="hidden" id="campoEditar" name="campoEditar" value="">
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
			        <td>
			        	<input
			        		value="<%= usuario.getNombre() %>"
			        		id="input-nombre"
			        		name="input-nombre"
			        		disabled="<%= true %>"
			        	>
			        	
			        	<button
			        		style="background-color: transparent; border: 0;"
			        		id="edit-nombre"
			        		type="button"
			        		onclick="setEdit('nombre')"
			        	>
			        		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
							  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
							</svg>
			        	</button>
			        	
			        	<button
			        		style="background-color: transparent; border: 0; display: none;"
			        		id="check-nombre"
			        		type="button"
			        		onclick="procesar('nombre')"
			        	>
			        		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
							  <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
							</svg>
			        	</button>
			        </td>
			    </tr>
			    <tr>
			        <td class="fw-bold">Apellido</td>
			        <td>
			        	<input
			        		value="<%= usuario.getApellido() %>"
			        		id="input-apellido"
			        		name="input-apellido"
			        		disabled="<%= true %>"
			        	>
			        	
			        	<button
			        		style="background-color: transparent; border: 0;"
			        		id="edit-apellido"
			        		type="button"
			        		onclick="setEdit('apellido')"
			        	>
			        		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
							  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
							</svg>
						
			        	</button>
			        	
			        	<button
			        		style="background-color: transparent; border: 0; display: none;"
			        		id="check-apellido"
			        		type="button"
			        		onclick="procesar('apellido')"
			        	>
			        		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
							  <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
							</svg>
			        	</button>
			        </td>
			    </tr>
			    <tr>
			        <td class="fw-bold">Correo Electronico</td>
			        <td>${usuarioObtenido.correoElectronico}</td>
			    </tr>
			    <tr>
			        <td class="fw-bold">Fecha de Nacimiento</td>
			        <td>
			        	<input
			        		value="<%= strDate %>"
			        		id="input-fecha"
			        		name="input-fecha"
			        		type="date"
			        		disabled="<%= true %>"
			        	>
			        	
			        	<button
			        		style="background-color: transparent; border: 0;"
			        		id="edit-fecha"
			        		type="button"
			        		onclick="setEdit('fecha')"
			        	>
			        		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
							  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
							</svg>
			        	</button>
			        	
			        	<button
			        		style="background-color: transparent; border: 0; display: none;"
			        		id="check-fecha"
			        		type="button"
			        		onclick="procesar('fecha')"
			        	>
			        		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
							  <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
							</svg>
			        	</button>
			        </td>
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
        </form>
    </div>

    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>

<script type="text/javascript">
	function setEdit(btn) {
		if(btn === "nombre") {
			document.getElementById("edit-nombre").style.display = "none";
			document.getElementById("input-nombre").disabled = false;
			document.getElementById("check-nombre").style.display = "inline";
		} else if (btn === "apellido") {
			document.getElementById("edit-apellido").style.display = "none";
			document.getElementById("input-apellido").disabled = false;
			document.getElementById("check-apellido").style.display = "inline";
		} else if (btn === "fecha"){
			document.getElementById("edit-fecha").style.display = "none";
			document.getElementById("input-fecha").disabled = false;
			document.getElementById("check-fecha").style.display = "inline";
		}
	}
</script>

<script type="text/javascript">
	function procesar(campo) {
		console.log(campo);
		document.getElementById("campoEditar").value = campo;
		document.getElementById("form").submit();
	}
</script>
</html>