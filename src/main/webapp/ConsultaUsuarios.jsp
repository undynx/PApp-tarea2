<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="./assets/styles/index.css" />
    <title>Consulta usuario</title>
  </head>

<body class="body">
    <!-- Incluye el encabezado desde header.jsp -->
    <%@ include file="header.jsp" %>
      <%@ page import="java.util.List" %>
        <%@ page import="datatypes.DtProfesor" %>
          <%@ page import="datatypes.DtSocio" %>
            <%@ page import="datatypes.DtClase" %>
              <%@ page import="datatypes.DtActividad" %>
                <%@ page import="datatypes.DtRegistro" %>
                  <!-- 
		<form action="ConsultaUsuario" method="post">
        
        <input type="submit" value="ver usuario">
    </form>
    -->



                  <!-- Contenido de la página principal -->
   <div class="container mt-4">
   
   	<div>
      <h3>Consulta de Usuarios</h3>
    </div>

       <div class="container-fluid">

         <% String nick=(String) session.getAttribute("nickname"); if (nick !=null) { %>
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
       </div>
       <div class="container-fluid" aria-labelledby="datosEspecificos">

        <% String tipo=(String) session.getAttribute("tipo"); 
        if ("Profesor".equals(tipo)) { %>

          <div class="row">
            <div class="col-sm-6">Institución:</div>
            <div class="col-sm-6">
              <%= request.getAttribute("nombreIntitusion") %>
            </div>
            <div class="col-sm-6">Descripcion:</div>
            <div class="col-sm-6">${usuario.descripcionGeneral}</div>
            <div class="col-sm-6">Biografia:</div>
            <div class="col-sm-6">${usuario.biografia}</div>
            <div class="col-sm-6">Sitio Web:</div>
            <div class="col-sm-6">${usuario.sitioWeb}</div>
            <div class="col-sm-6">Lista de clases dictadas:</div>
            <!-- De esta forma se me ocurrió para mostrarlo lindo con bootstrap, pero no se si va a andar
Noté intentando mostrar las actividades deportivas asociadas a la DtClase, que no tenemos 
actividades deportivas guardadas en DtClase (sí en Clase) entonces opté por fingir 
demencia respecto a ese requisito

Esta forma es la que he logrado para que ande. Con la tabla no lo logro, pero capaz me ayudan con eso y queda más bonito.
-->

        <div class="container" aria-labelledby="datosEspecificos">
         <div style="display: flex; justify-content: space-evenly; flex-wrap: wrap;" class="mt-2">
          <% List<DtClase> clases = (List<DtClase>) request.getAttribute("listaClasesProf");
          if (clases.size() == 0) { %>
		<div>No existen clases para esta actividad</div>
		
	   <% } else { 
		   
          for (DtClase clase : clases) {
          %>
          
          <div class="card m-2" style="width: 250px;">
			<div class="card-body" style="display: flex; flex-direction: column; justify-content: space-between;">
				<h5 class="card-title"><%= clase.getNombre() %></h5>
				<p class="card-text">
					<span style="font-weight: 600;">Actividad Deportiva:</span> <%= clase.getActividadDeportiva().getNombre() %>
					<br>
					<span style="font-weight: 600;">Hora de inicio:</span> <%= clase.getHoraInicio() %>
					<br>
					<span style="font-weight: 600;">URL:</span> <%= clase.getUrl() %>
				</p>
			
			   <form
				   	action="ConsultaDictadoClase"
					method="post"
			   >
			   		<input type="hidden" id="clase" name="clase" value="<%= clase.getNombre() %>">
               		<input type="submit" value="Consultar Clase" class="btn btn-primary">
			   </form>
			   
			   <form
				   	action="ConsultaActividadDeportiva"
					method="post"
			   >
			   		<input type="hidden" id="clase" name="unaActividad" value="<%= clase.getActividadDeportiva().getNombre() %>">
               		<input type="submit" value="Consultar Actividad" class="btn btn-primary mt-2">
			   </form>
			</div>
			</div>
         <% } } %>
     </div>


    <% } else { %>
      <div class="col-sm-6">Clases a las cuales está registrado:</div>
      <form
		id="form"
		action="ConsultaDictadoClase"
		method="post"
	  >	
		<input type="hidden" id="claseSeleccionada" name="claseSeleccionada" value="">
		
		<div style="display: flex; justify-content: space-evenly; flex-wrap: wrap;" class="mt-2">
			<% List<DtClase> clasesS = (List<DtClase>) request.getAttribute("listaClasesSoc"); %>
			<% if (clasesS.size() == 0) { %>
				<div>No existen clases para esta actividad</div>
			<% } else { %>
				<% for (DtClase clase : clasesS) { %>
					<div class="card m-2" style="width: 250px;">
						<div class="card-body" style="display: flex; flex-direction: column; justify-content: space-between;">
							<h5 class="card-title"><%= clase.getNombre() %></h5>
							<p class="card-text">
								<span style="font-weight: 600;">Actividad Deportiva:</span> <%= clase.getActividadDeportiva().getNombre() %>
								<br>
								<span style="font-weight: 600;">Hora de inicio:</span> <%= clase.getHoraInicio() %>
								<br>
								<span style="font-weight: 600;">URL:</span> <%= clase.getUrl() %>
							</p>
						
						<input type="hidden" id="clase" name="clase" value="<%= clase.getNombre() %>">
                        <input type="submit" value="Consultar Clase" class="btn btn-primary">
					</div>
				</div>
				<% } %>
			<% } %>
		</div>
	</form>

       <!-- ------------------------------------------------------------------------------------------- -->
       <!-- DtSocios tiene una Lista de Registros. Los Registros tienen la siguiente información:
		private	Date fechaRegistro;
		private Socio socio;
		private Clase clase;
	
	Los DtRegistros por su parte tienen la siguiente información:
	    private Date fechaRegistro;
	    private DtSocio socio;
	    private DtClase clase;
	
	Funcion de DtSocio que podria ser util:
		List<DtRegistro> getRegistros();
-->

            <% } %>
        </div>

        <% } else { %>

          <div class="display-1">HA OCURRIDO UN ERROR Y USTÉ NO DEVERÍA ESTAR BIENDO ESSTO MISHISHO
          </div>
          <% } %>
     </div>
   
   </div>

    <!-- Incluye el pie de página desde footer.jsp -->
    <%@ include file="footer.jsp" %>
 </body>

  </html>