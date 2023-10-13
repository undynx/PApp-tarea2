<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%@ page import="java.util.List" %>
<%@ page import="datatypes.DtClase" %>
<!-- Contenido de la página principal -->
<div class="container mt-4">
    <h1>Ranking de Dictado de Clases</h1>

	</div>

    <!-- Contenido de la página principal -->
   <div id="tabla-container" class="container mt-4">			
     <table class="table table-sm table-dark">
  		<thead>
        <tr>
         	<th>Cantidad Clases</th>
            <th>Nombre</th>
            <th>Fecha</th>        
            <th>Url</th>

        </tr>
		</thead>
        <% 
            List<DtClase> actividades = (List<DtClase>) request.getAttribute("reqClasesOrdenadas");
            if (actividades != null) {
        	for (DtClase actividad : actividades) {
        %>
        <tr>
        	<td><%= actividad.getCantidadClases() %></td>
            <td><%= actividad.getNombre() %></td>
            <td><%= actividad.getFechaClase() %></td>
            <td><%= actividad.getUrl() %></td>
        </tr>
        <%
				}
			}
        %>
    </table>
    </div>
  
 
    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
</body>
</html>