<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Consulta dictado de clases</title>
</head>
<body data-bs-theme="dark">
<!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>
    
    <%@ page import="java.util.List" %>
	<%@ page import="datatypes.DtClase" %>
	
     <!-- Contenido de la página principal -->
      <div class="container mt-5">
	    <h1>Consulta dictado de clases</h1>
		 <table class="table table-sm table-dark">
  			<thead>
		    <tr>
		        <th>Atributo</th>
		        <th>Valor</th>  
		    </tr>
		    </thead>
		    <tr>
		        <td>Nombre de Clase</td>
		        <td>${setCla.nombre}</td>
		    </tr>
		    <tr>
		        <td>Fecha de Clase</td>
		        <td>${setCla.fechaClase}</td>
		    </tr>
		    <tr>
		        <td>Hora de Inicio</td>
		        <td>${setCla.horaInicio}</td>
		    </tr>
		    <tr>
		        <td>URL</td>
		        <td>${setCla.url}</td>
		    </tr>
		    <tr>
		        <td>Fecha de Registro</td>
		        <td>${setCla.fechaRegistro}</td>
		    </tr>
		</table>
		
		<% String tipo=(String) session.getAttribute("tipo"); 
        if ("Profesor".equals(tipo)) { %>
			<h1>Socios asociados a la clase ${setCla.nombre}</h1>
			<table class="table table-sm table-dark">
			    <thead>
			        <tr>
			            <th>Nombre del Socio</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach var="socio" items="${listaSocios}">
			            <tr>
			                <td>${socio}</td>
			            </tr>
			        </c:forEach>
			    </tbody>
			</table>
			<% } %>	
    </div>
    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>

