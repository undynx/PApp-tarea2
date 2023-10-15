<!-- @format -->

<!-- Este caso de uso permite a un visitante del sitio iniciar sesión mediante
el ingreso de su nickname y contraseña. El Sistema verifica que los
datos sean válidos e inicia la sesión para el Profesor/Socio. En caso de
que no sean válidos, se mostrará una advertencia al Visitante para que
pueda reingresar sus datos o cancelar el inicio. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>EntrenamosUy</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="./assets/styles/index.css" />
	</head>
	<body>
		<header>
			<nav
				class="navbar navbar-expand-lg bg-body-tertiary"
				data-bs-theme="dark"
			>
				<div class="container-fluid">
					<a class="navbar-brand" href="index.jsp">
						<img src="./assets/images/logo.png" width="40" alt="logo" />
					</a>
					
					<% String nickname = (String) session.getAttribute("nickname"); 
						if (nickname != null) { 
					%>

					<button
						class="navbar-toggler"
						type="button"
						data-bs-toggle="collapse"
						data-bs-target="#navbarNav"
						aria-controls="navbarNav"
						aria-expanded="false"
						aria-label="Toggle navigation"
					>
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item dropdown">
								<a
									class="nav-link dropdown-toggle"
									href="#"
									id="clasesDropdown"
									role="button"
									data-bs-toggle="dropdown"
									aria-haspopup="true"
									aria-expanded="false"
								>
									Clases
								</a>
								
									
								<div class="dropdown-menu" aria-labelledby="clasesDropdown">
								<% String tipo = (String) session.getAttribute("tipo");
								
									if (tipo.equals("Profesor")) { %>
									<a class="dropdown-item" href="AltaDictadoClases.jsp"
										>Alta Dictado de Clases
									</a>
									<a class="dropdown-item" href="ConsultaDictadoClases.jsp"
										>Consulta Dictado de Clases</a
									>
									<form  action="RankingDictadoClases" method="post">
        								<button type="submit" class="dropdown-item" >
        									Ranking de Clases
        								</button>
    								</form>
									<% } else { %>
										<form 
											action="ObtenerInstituciones" 
											method="post"
										>
											<button type="submit" class="dropdown-item">
												Registro Dictado de Clases
											</button>
										</form>
										
										<a class="dropdown-item" href="EliminarRegistroClase.jsp"
										>Eliminar Registro de Clase</a
									>
									<% } %>
								</div>
							</li>
							<li class="nav-item dropdown">
								<a
									class="nav-link dropdown-toggle"
									href="#"
									id="actividadesDropdown"
									role="button"
									data-bs-toggle="dropdown"
									aria-haspopup="true"
									aria-expanded="false"
								>
									Actividades
								</a>
								<div
									class="dropdown-menu"
									aria-labelledby="actividadesDropdown"
								>
								<form  action="ConsultaActividadDeportiva" method="get">
        								<button type="submit" class="dropdown-item" >
        									Consulta de Actividades
        								</button>
    								</form>
    								
								<%if (tipo.equals("Profesor")) { %>
									<form  action="RankingActividades" method="post">
        								<button type="submit" class="dropdown-item" >
        									Ranking de Actividades
        								</button>
    								</form>
								<% } %>
								</div>
							</li>
							<li class="nav-item dropdown">
								<a
									class="nav-link dropdown-toggle"
									href="#"
									id="usuariosDropdown"
									role="button"
									data-bs-toggle="dropdown"
									aria-haspopup="true"
									aria-expanded="false"
								>
									Usuario
								</a>
								<div class="dropdown-menu" aria-labelledby="usuariosDropdown">
									<form 
										action="ConsultaUsuario" 
										method="post"
									>
										<button type="submit" class="dropdown-item">
											Consulta de Usuarios
										</button>
									</form>
									
									<form
										action="ObtenerUsuario"
										method="post"
									>
										<button type="submit" class="dropdown-item">
											Modificar Usuario
										</button>
									</form>
								</div>
							</li>
							
							<li class="user-icon">
								<form
									action="CierreSesion"
									method="get"
								>
									<button type="submit" value="Cerrar sesión" class="logout-btn">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-power logout-svg" viewBox="0 0 16 16">
										  <path d="M7.5 1v7h1V1h-1z"/>
										  <path d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z"/>
										</svg>
									</button>
								</form>
							</li>
							
							<% } else { %>

							<li class="user-icon">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item dropdown">
										<a
											class="nav-link dropdown-toggle"
											href="#"
											id="navbarDropdown"
											role="button"
											data-bs-toggle="dropdown"
											aria-haspopup="true"
											aria-expanded="false"
										>
											Iniciar Sesión
										</a>
										<div
											class="dropdown-menu navBar"
											aria-labelledby="navbarDropdown"
										>
											<form
												class="px-4 py-3"
												action="InicioSesion"
												method="post"
											>
												<div class="mb-3">
													<label class="form-label">Nickname</label>
													<input
														type="text"
														class="form-control"
														id="unNickname"
														name="unNickname"
														placeholder="Tu nickname"
													/>
												</div>
												<div class="mb-3">
													<label class="form-label">Contraseña</label>
													<input
														type="password"
														class="form-control"
														id="unaPassword"
														name="unaPassword"
														placeholder="Contraseña"
													/>
												</div>
												<input
													type="submit"
													class="btn btn-primary"
													value="Iniciar sesion"
												/>
											</form>
										</div>
									</li>
								</ul>
							</li>
							<% } %>
						</ul>
					</div>
				</div>
			</nav>
		</header>
	</body>
</html>
