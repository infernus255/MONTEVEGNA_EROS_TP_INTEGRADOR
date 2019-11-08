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
								<button id="btnGuardar" type="submit" class="btn btn-primary">Guardar</button>	
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
		 
<table class="table table-striped table-responsive-lg">
  <thead>
    <tr>
      <th scope="col">Legajo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Materia</th>
      <th scope="col">Semestre</th>
      <th scope="col">Año</th>
      <th scope="col">Nota 1</th>
      <th scope="col">Nota 2</th>
      <th scope="col">Recuperatorio 1</th>
      <th scope="col">Recuperatorio 2</th>
      <th scope="col">Estado</th>
      
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Pepe</td>
      <td>Reina</td>
      <td>Laboratorio IV</td>
      <td>Segundo Semestre</td>
      <td>2019</td>
      <td><input type="text" value="8"></td>
      <td><input type="text" value="8"></td>
      <td><input type="text" value="8"></td>
      <td><input type="text" value="8"></td>
      <td>      	<select class="form-control">
				        <option >Libre</option>
				        <option selected>Regular</option>
	    </select></td>
      
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
            <td>Laboratorio IV</td>
      <td>Segundo Semestre</td>
      <td>2019</td>
      <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
            <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
      <td>      	<select class="form-control">
				        <option selected>Libre</option>
				        <option>Regular</option>
	    </select></td>
      
    </tr>
        <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
            <td>Laboratorio IV</td>
      <td>Segundo Semestre</td>
      <td>2019</td>
      <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
            <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
      <td>      	<select class="form-control">
				        <option selected>Libre</option>
				        <option>Regular</option>
	    </select></td>
      
    </tr>
        <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>Laboratorio IV</td>
      <td>Segundo Semestre</td>
      <td>2019</td>
            <td><input type="text" value="2"> </td>
      <td><input type="text" value="2"></td>
            <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
      <td>      	<select class="form-control">
				        <option selected>Libre</option>
				        <option>Regular</option>
	    </select></td>
      
    </tr>
        <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
            <td>Laboratorio IV</td>
      <td>Segundo Semestre</td>
      <td>2019</td>
      <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
            <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
      <td>      	<select class="form-control">
				        <option selected>Libre</option>
				        <option>Regular</option>
	    </select></td>
      
    </tr>
        <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
            <td>Laboratorio IV</td>
      <td>Segundo Semestre</td>
      <td>2019</td>
      <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
            <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
      <td>      	<select class="form-control">
				        <option selected>Libre</option>
				        <option>Regular</option>
	    </select></td>
      
    </tr>
        <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
            <td>Laboratorio IV</td>
      <td>Segundo Semestre</td>
      <td>2019</td>
      <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
            <td><input type="text" value="2"></td>
      <td><input type="text" value="2"></td>
      <td>
      	<select class="form-control">
				        <option selected>Libre</option>
				        <option>Regular</option>
	    </select>
	  </td>
      
    </tr>
  </tbody>
</table>

<div class="row">

	<div class="col-md-4"></div>
	<div class="col-md-4">
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
	<div class="col-md-4"></div>
</div>
</div>

</body>
</html>