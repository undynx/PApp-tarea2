<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ranking de Actividades</title>
</head>
<body data-bs-theme="dark">
<!-- Incluye el encabezado desde header.jsp -->
<%@ include file="header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="datatypes.DtActividad" %>
	 <!-- que ejecute la logica primero -->

    <!-- Contenido de la página principal -->
    <div class="container mt-4">
   <h1>Ranking de Actividades</h1>
			
     <table class="table table-sm table-dark">
  		<thead>
        <tr>
            <th>Nombre</th>
            <th>Descripción</th>        
            <th>Costo</th>

        </tr>
		</thead>
        <% 
            List<DtActividad> actividades = (List<DtActividad>) request.getAttribute("reqClasesOrdenadas");
            for (DtActividad actividad : actividades) {
        %>
        <tr>
            <td><%= actividad.getNombre() %></td>
            <td><%= actividad.getDescripcion() %></td>
            <td><%= actividad.getCosto() %></td>
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