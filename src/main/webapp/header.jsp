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
					<a class="navbar-brand" href="#">
						<img src="./assets/images/logo.png" width="40" alt="logo" />
					</a>

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
									<a class="dropdown-item" href="AltaDictadoClases.jsp"
										>Alta Dictado de Clases
									</a>
									<a class="dropdown-item" href="RegistroDictadoClases.jsp"
										>Registro Dictado de Clases
									</a>
									<a class="dropdown-item" href="ConsultaDictadoClases.jsp"
										>Consulta Dictado de Clases</a
									>
									<a class="dropdown-item" href="RankingClases.jsp"
										>Ranking de Clases
									</a>
									<a class="dropdown-item" href="EliminarRegistroClase.jsp"
										>Eliminar Registro de Clase</a
									>
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
									<a class="dropdown-item" href="ConsultaActividades.jsp"
										>Consulta de Actividades
									</a>
									<a class="dropdown-item" href="RankingActividades.jsp"
										>Ranking de Actividades
									</a>
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
									Usuarios
								</a>
								<div class="dropdown-menu" aria-labelledby="usuariosDropdown">
									<a class="dropdown-item" href="ConsultaUsuarios.jsp"
										>Consulta de Usuarios
									</a>
									<a class="dropdown-item" href="ModificarUsuario.jsp"
										>Modificar Usuario</a
									>
								</div>
							</li>

							<li>
								<a class="user-icon" href="/index.jsp">
									<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-circle profileSvg"
										viewBox="0 0 16 16">
										<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
										<path fill-rule="evenodd"
											d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
									</svg>
								</a>
							</li>
						</ul>
            
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
								<div class="dropdown-menu navBar" aria-labelledby="navbarDropdown">
									<form class="px-4 py-3" action="InicioSesion" method="post">
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
											<label class="form-label"
												>Contraseña</label
											>
											<input
												type="text"
												class="form-control"
												id="unaPassword"
												name="unaPassword"
												placeholder="Contraseña"
											/>
										</div>
										<input type="submit" class="btn btn-primary" value="Iniciar sesion">
									</form>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="AltaUsuario.jsp"
										>¿Aún no tienes cuenta? Registrarme</a
									>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
	</body>
</html>
