<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="MasterPage.jsp" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div class="card">
	<div class="card-header text-center">Listado de Alumnos</div>
	
	<div class="card-body">
			  			  <form>
			     		<div class="form-row">
			     			<div class="col-lg-1"></div>
				     		<div class="col-lg-3 form-group">
				     											<label  for="ddlMaterias">Seleccione una materia </label>
									<select id="ddlMaterias" class="form-control ">
										 <option selected>Todas</option>
								       	<option>Laboratorio IV</option>
									</select>
				     		</div>
				     		<div class="col-lg-3 form-group">
				     											<label  for="ddlSemestres">Seleccione un semestre </label>
									<select id="ddlSemestres" class="form-control ">
										 <option selected>Todos</option>
								       	<option>Primer Semestre</option>
								       	<option>Segundo Semestre</option>
									</select>
				     		</div>
				     		<div class="col-lg-3 form-group">
				     		<label  for="ddlAnio">Seleccione un año </label>
									<select id="ddlAnio" class="form-control " >
										 <option selected>Todos</option>
								       	<option>2019</option>
									</select>
				     		</div>
				     		<div class="col-lg-2 form-group " style="padding-top:32px;">
				     			<button id="btnFiltrar" type="submit" class="btn btn-primary" >Filtrar</button>	
						
						<button id="btnAgregar" type="button" data-toggle="modal" data-target="#modalAbm" class="btn btn-primary">Agregar Alumno</button>	
					</div>	
				</div> 				
  </form>
  <hr/>
  			     		<form class="form-row">
			     		<div class="col-12">
			     			<div class="form-inline text-center">   
							  	<input class="form-control my-1 mr-2" type="search" placeholder="Buscar" aria-label="Search">
							    <button class="btn btn-outline-success my-1 mr-2" type="submit">Buscar</button>
							    <label class="my-1 mr-2" for="ddlCantReg">Cantidad de Registros </label>
							    <select id="ddlCantReg" class="form-control my-1 mr-sm-2">
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
	
<table id="tblAlumnos" class="table table-striped table-responsive-lg ">
  <thead>
    <tr>
      <th scope="col">Legajo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Fecha nacimiento</th>
      <th scope="col">Direccion</th>
      <th scope="col">Localidad</th>
      <th scope="col">Provincia</th>
      <th scope="col">Email</th>
      <th scope="col">Telefono</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Pepe</td>
      <td>Reina</td>
      <td>25/02/1997</td>
      <td>Calle falsa 123</td>
      <td>Sprinfield</td>
      <td>Massachusetts</td>
      <td>pepe@gmail.com</td>
      <td>1122334455</td>
      <td> <a data-toggle="modal" data-target="#modalAbm"><i class="fas fa-user-edit"></i></a> <a><i class="fas fa-trash-alt"></i></a></td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>25/02/1997</td>
      <td>Calle falsa 123</td>
      <td>Sprinfield</td>
      <td>Massachusetts</td>
      <td>jacob@gmail.com</td>
      <td>1122334455</td>
      <td> <a data-toggle="modal" data-target="#modalAbm"><i class="fas fa-user-edit"></i></a> <a><i class="fas fa-trash-alt"></i></a></td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>25/02/1997</td>
      <td>Calle falsa 123</td>
      <td>Sprinfield</td>
      <td>Massachusetts</td>
      <td>larry@gmail.com</td>
      <td>1122334455</td>
      <td> <a data-toggle="modal" data-target="#modalAbm"><i class="fas fa-user-edit"></i></a> <a><i class="fas fa-trash-alt"></i></a></td>
    </tr>
  </tbody>

</table>
    <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
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
		      	<div class="col-4"><h5 class="modal-title">Alumno</h5></div>
		      	<div class="col-4">        
			      	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
				      <label for="txtNombre">Nombre</label>
				      <input type="text" class="form-control" id="txtNombre" placeholder="Nombre">
				    </div>
				    <div class="form-group col-md-6">
				      <label for="txtApellido">Apellido</label>
				      <input type="text" class="form-control" id="txtApellido" placeholder="Apellido">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="txtEmail">Email</label>
				    <input type="email" class="form-control" id="txtEmail" placeholder="mail@mail.com">
				  </div>
				  <div class="form-group">
				    <label for="txtDireccion">Direccion</label>
				    <input type="text" class="form-control" id="txtDireccion" placeholder="1234 Main St">
				  </div>
				  <div class="form-row">
				    <div class="form-group col-md-6">
				      <label for="txtLocalidad">Localidad</label>
				 		<select id="txtProvincia" class="form-control">
				        <option selected>Localidad</option>
				        <option>...</option>
				      </select>
				    </div>
				    <div class="form-group col-md-6">
				      <label for="txtProvincia">Provincia</label>
				      <select id="txtProvincia" class="form-control">
				        <option selected>Provincia</option>
				        <option>...</option>
				      </select>
				    </div>
				  </div>
				  <div class="form-row">
				    <div class="form-group col-md-6">
				      <label for="txtTelefono">Telefono</label>
						<input type="tel" class="form-control" id="txtTelefono" placeholder="12345678">
				    </div>
				    <div class="form-group col-md-6">
					      <label for="txtFechaNac">Fecha de Nacimiento</label>
							<input type="date" class="form-control" id="txtFechaNac" placeholder="">
					    </div>				   
				  </div>			  
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary">Guardar</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	
	

</script>

</body>
</html>