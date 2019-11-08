<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="MasterPage.jsp" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<div class="card">
		<div class="card-header text-center">Listado de Cursos</div>

		<div class="card-body">
			<form>
				<div class="form-row">
					<div class="col-lg-1"></div>
					<div class="col-lg-3 form-group">
						<label for="ddlMaterias">Seleccione una materia </label> <select
							id="ddlMaterias" class="form-control ">
							<option selected>Todas</option>
							<option>Laboratorio IV</option>
						</select>
					</div>
					<div class="col-lg-3 form-group">
						<label for="ddlSemestres">Seleccione un semestre </label> <select
							id="ddlSemestres" class="form-control ">
							<option selected>Todos</option>
							<option>Primer Semestre</option>
							<option>Segundo Semestre</option>
						</select>
					</div>
					<div class="col-lg-3 form-group">
						<label for="ddlAnio">Seleccione un año </label> <select
							id="ddlAnio" class="form-control ">
							<option selected>Todos</option>
							<option>2019</option>
						</select>
					</div>
					<div class="col-lg-2 form-group " style="padding-top: 32px;">
						<button id="btnFiltrar" type="submit" class="btn btn-primary">Filtrar</button>
						<button id="btnAgregarCurso" type="button" data-toggle="modal"
							data-target="#modalAbm" class="btn btn-primary">Agregar
							Curso</button>
					</div>
				</div>
			</form>
			<hr />
			<form class="form-row">
				<div class="col-12">
					<div class="form-inline text-center">
						<input class="form-control my-1 mr-2" type="search"
							placeholder="Buscar" aria-label="Search">
						<button class="btn btn-outline-success my-1 mr-2" type="submit">Buscar</button>
						<label class="my-1 mr-2" for="ddlCantReg">Cantidad de
							Registros </label> <select id="ddlCantReg"
							class="form-control my-1 mr-sm-2">
							<option selected>Todos</option>
							<option>5</option>
							<option>10</option>
							<option>20</option>
							<option>50</option>
						</select>
					</div>
				</div>
			</form>
		</div>

		<table id="tblAlumnos" class="table table-striped">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Materia</th>
					<th scope="col">Semestre</th>
					<th scope="col">Año</th>
					<th scope="col">Profesor</th>
					<th scope="col">Cantidad Alumnos</th>
					<th scope="col">Cantidad Aprobados</th>
					<th scope="col">Cantidad Desaprobados</th>
					<th></th>
					<!--       <th scope="col">Estado</th> -->
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Laboratorio IV</td>
					<td>Segundo Semestre</td>
					<td>2019</td>
					<td>Pepe Sota</td>
					<td>30</td>
					<td>20</td>
					<td>10</td>
					<td><a data-toggle="modal" data-target="#modalAsignarAlumno">
							<i class="fas fa-user-plus"></i>
					</a> <a data-toggle="modal" data-target="#modalAbm"> <i
							class="fas fa-user-edit"></i>
					</a> <a> <i class="fas fa-trash-alt"></i>
					</a></td>
					<!--       <td>Activo</td> -->
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Laboratorio IV</td>
					<td>Segundo Semestre</td>
					<td>2019</td>
					<td>Pepe Sota</td>
					<td>40</td>
					<td>30</td>
					<td>10</td>
					<td><a data-toggle="modal" data-target="#modalAbm"><i
							class="fas fa-user-plus"></i></a><a data-toggle="modal"
						data-target="#modalAbm"><i class="fas fa-user-edit"></i></a> <a><i
							class="fas fa-trash-alt"></i></a></td>
					<!--       <td>Activo</td> -->
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Metodologia de Sistemas</td>
					<td>Segundo Semestre</td>
					<td>2019</td>
					<td>Pepe Sota</td>
					<td>35</td>
					<td>30</td>
					<td>5</td>
					<td><a data-toggle="modal" data-target="#modalAbm"><i
							class="fas fa-user-plus"></i></a><a data-toggle="modal"
						data-target="#modalAbm"><i class="fas fa-user-edit"></i></a> <a><i
							class="fas fa-trash-alt"></i></a></td>

					<!--       <td>Inactivo</td> -->
				</tr>
			</tbody>

		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>

	</div>

	<div id="modalAbm" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<div class="container-fluid">
						<div class="row">
							<div class="col-4"></div>
							<div class="col-4">
								<h5 class="modal-title">Curso</h5>
							</div>
							<div class="col-4">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

						</div>
					</div>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="txtMateria">Materia</label> <select id="txtMateria"
									class="form-control">
									<option selected>Laboratorio IV</option>
									<option>Metodologia de Sistemas</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="txtSemestre">Semestre</label> <select
									id="txtSemestre" class="form-control">
									<option selected>Primer Semestre</option>
									<option>Segundo Semestre</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="txtAnio">Año</label> <input class="form-control"
									placeholder="2019" name="txtAnio" id="txtAnio" type="number"
									max="3000" min="2019">
							</div>
							<div class="form-group col-md-6">
								<label for="txtProfesor">Profesor</label> <select
									id="txtProfesor" class="form-control">
									<option selected>Pepe Sota</option>
									<option>Filipino Aurelio</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cerrar</button>
					<button type="button" class="btn btn-primary">Guardar</button>
				</div>
			</div>
		</div>
	</div>

	<div id="modalAsignarAlumno" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<div class="container-fluid">
						<div class="row">
							<div class="col-3"></div>
							<div class="col-5">
								<h5 class="modal-title">Asignar Alumnos</h5>
							</div>
							<div class="col-4">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

						</div>
					</div>
				</div>
				<div class="modal-body">
					<form class="form-row">
						<div class="col-12">
							<div class="form-group text-center">
								<label for="ddlCantReg">Cantidad de Registros </label> <select
									id="ddlCantReg" class="form-control" style="flex-grow: 4;">
									<option selected>Todos</option>
									<option>5</option>
									<option>10</option>
									<option>20</option>
									<option>50</option>
								</select>

							</div>
						</div>
					</form>

					<form class="form-row">
						<div class="col-12">
							<div class="form-inline text-center">
								<input class="form-control my-1 mr-2" type="search"
									placeholder="Buscar" aria-label="Search" style="flex-grow: 4;">
								<button class="btn btn-outline-success my-1 mr-2" type="submit">Buscar</button>
							</div>
						</div>
					</form>



					<table id="tblAlumnos"
						class="table table-striped table-responsive-sm ">
						<thead>
							<tr>
								<th scope="col">Legajo</th>
								<th scope="col">Nombre</th>
								<th scope="col">Apellido</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Pepe</td>
								<td>Reina</td>
								<td><a><i class="fas fa-user-plus"></i></a></td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td><a><i class="fas fa-user-plus"></i></a></td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry</td>
								<td>the Bird</td>
								<td><a><i class="fas fa-user-plus"></i></a></td>
							</tr>

						</tbody>

					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</nav>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cerrar</button>
					<button type="button" class="btn btn-primary">Guardar</button>
				</div>
			</div>
		</div>
	</div>



</body>
</html>