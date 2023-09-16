<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado de la Consulta</title>
</head>
<body data-bs-theme="dark">
<!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>
    
    <%@ page import="java.util.List" %>
	<%@ page import="datatypes.DtClase" %>
	
	
     <!-- Contenido de la página principal -->
      <div class="container mt-5">
	    <h1>Resultados de la Consulta</h1>
	    <!-- Acceso a los atributos de DtActividad -->
			  <table class="table table-sm table-dark">
  			<thead>
		    <tr>
		        <th>Atributo</th>
		        <th>Valor</th>
		    </tr>
		    </thead>
		    <tr>
		        <td>Nombre</td>
		        <td>${reqActividad.nombre}</td>
		    </tr>
		    <tr>
		        <td>Descripción</td>
		        <td>${reqActividad.descripcion}</td>
		    </tr>
		    <tr>
		        <td>Duración (minutos)</td>
		        <td>${reqActividad.duracionMinutos}</td>
		    </tr>
		    <tr>
		        <td>Costo</td>
		        <td>${reqActividad.costo}</td>
		    </tr>
		    <tr>
		        <td>Fecha de Registro</td>
		        <td>${reqActividad.fechaRegistro}</td>
		    </tr>
		</table>
	
    </div>
    
    <div class="container mt-5">
    	<h1>Clases Asociadas</h1>
    	<table class="table table-sm table-dark">
  		<thead>
        <tr>
            <th>Nombre de Clase</th>
            <th>URL</th>
        </tr>
        <thead>
        <%
            List<DtClase> clases = (List<DtClase>) request.getAttribute("reqClases");
            for (DtClase clase : clases) {
        %>
        <tr>
            <td><%= clase.getNombre() %></td>
            <td><%= clase.getUrl() %></td>
        </tr>
        <%
            }
        %>
    </table>

    </div>
    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>

