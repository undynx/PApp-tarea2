<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ranking de actividades</title>
</head>
<body>
<!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>
    <%@ page import="java.util.List" %>
	<%@ page import="datatypes.DtActividad" %>
	 <!-- que ejecute la logica primero -->

    <!-- Contenido de la página principal -->
    <div class="container mt-4">
           <h1>Ranking de Actividades</h1>
			
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Duración (minutos)</th>
            <th>Costo</th>
            <th>Fecha de Registro</th>
        </tr>

        <% 
            List<DtActividad> actividades = (List<DtActividad>) request.getAttribute("reqClasesOrdenadas");
            for (DtActividad actividad : actividades) {
        %>
        <tr>
            <td><%= actividad.getNombre() %></td>
            <td><%= actividad.getDescripcion() %></td>
            <td><%= actividad.getDuracionMinutos() %></td>
            <td><%= actividad.getCosto() %></td>
            <td><%= actividad.getFechaRegistro() %></td>
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