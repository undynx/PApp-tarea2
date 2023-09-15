<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados de la Consulta</title>
</head>
<body>
    <h1>Resultados de la Consulta</h1>
    <!-- Acceso a los atributos de DtActividad -->
    <p>Nombre: ${reqActividad.nombre}</p>
    <p>Descripción: ${reqActividad.descripcion}</p>
    <p>Duración (minutos): ${reqActividad.duracionMinutos}</p>
    <p>Costo: ${reqActividad.costo}</p>
    <p>Fecha de Registro: ${reqActividad.fechaRegistro}</p>
</body>
</html>

