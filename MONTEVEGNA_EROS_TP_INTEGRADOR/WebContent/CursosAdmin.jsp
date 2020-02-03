<%@page import="entidad.EntCurso"%>
<%@page import="negocio.NegCurso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="accesoDatos.DatosManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="entidad.EntAlumno"%>
<%@page import="negocio.NegAlumno"%>

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
						<button class="btn btn-outline-success my-1 mr-2" type="search">Buscar</button>
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

		<table id="tblCursos" class="table table-striped">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Materia</th>
					<th scope="col">Semestre</th>
					<th scope="col">Año</th>
					<th scope="col">Profesor</th>
					<th scope="col">Estado</th>
<!-- 					<th scope="col">Cantidad Alumnos</th> -->
<!-- 					<th scope="col">Cantidad Aprobados</th> -->
<!-- 					<th scope="col">Cantidad Desaprobados</th> -->
					<th></th>
					<!--       <th scope="col">Estado</th> -->
				</tr>
			</thead>
			<tbody>
			
			  				  			  <%
			  			  List<EntCurso> cursos=new ArrayList<EntCurso>();
							NegCurso.listarCursos(cursos);
							    		for(EntCurso c : cursos)
							    		{%> 
				<tr>	
				<form action="SvltEliminarEditarCursosAdmin" method="get">
					<td scope="row"><%=c.getId_curso()%> <input value="<%=c.getId_curso()%>" type="hidden" name="hfIdCurso" id="hfIdCurso"/></td>
					<td><%=c.getMateria() %> <input value="<%=c.getId_materia()%>" type="hidden" name="hfIdMateria" id="hfIdMateria"/></td>
					<td><%=c.getSemestre() %> <input value="<%=c.getId_semestre() %>" type="hidden" name="hfIdSemestre" id="hfIdSemestre"/></td>
					<td><%=c.getAnio()%> <input value="<%=c.getAnio() %>" type="hidden" name="hfAnio" id="hfAnio"/> </td>
					<td><%=c.getProfesor() %> <input value="<%=c.getDni_profesor() %>" type="hidden" name="hfIdProfesor" id="hfIdProfesor"/></td>
					<td><%=c.getEstado()%></td>
					<td>
					<button id="btnAsignar" name="btnAsignar" type="submit" ><i class="fas fa-user-plus"></i></button> 
					<button id="btnEditar" name="btnEditar" type="submit"  > <i class="fas fa-user-edit"></i></button> 
					<button id="btnEliminar" name="btnEliminar" type="submit" >  <i class="fas fa-trash-alt"></i></button>
					</td>
				</form>
				</tr>
				<%}%>			
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
			<form method="post" action="SvltGuardarCurso">
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
					
					
							<input name="hfEditar" id="hfEditar" type="hidden"/>
							<input type="hidden" id="hfIdCursoAux" name="hfIdCursoAux" />
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="txtMateria">Materia</label> 
								<select id="txtMateria"  name="txtMateria" class="form-control">
									 <%
			    		HashMap <String,String> Materias=new HashMap<String,String>();
				 		try{
					 		DatosManager db=new DatosManager();
					    	if(db.executeQuery("SELECT id_materia,descripcion FROM universidad.tbl_materias;"))
					    	{
								while (db.getRs().next()) {									 
									Materias.put(db.getRs().getString("descripcion"),db.getRs().getString("id_materia"));								
								}
					 		
					 		}
				 		}
				 		catch(Exception ex)
				 		{ex.printStackTrace();}
						
						//recorro cada clave del hash map
								for ( String key : Materias.keySet() ) {

					        %><option value="<%=Materias.get(key).toString()%>"><%=key%></option><%					
						}
				 		
				 		%>
<!-- 									<option>Metodologia de Sistemas</option> -->
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="txtSemestre">Semestre</label> <select name="txtSemestre"
									id="txtSemestre" class="form-control">
									<%
			    		HashMap <String,String> Semestres=new HashMap<String,String>();
				 		try{
					 		DatosManager db=new DatosManager();
					    	if(db.executeQuery("SELECT id_semestre,descripcion FROM universidad.tbl_semestres;"))
					    	{
								while (db.getRs().next()) {									 
									Semestres.put(db.getRs().getString("descripcion"),db.getRs().getString("id_semestre"));								
								}
					 		
					 		}
				 		}
				 		catch(Exception ex)
				 		{ex.printStackTrace();}
						
						//recorro cada clave del hash map
								for ( String key : Semestres.keySet() ) {

					        %><option value="<%=Semestres.get(key).toString()%>"><%=key%></option><%					
						}
				 		
				 		%>
<!-- 									<option>Segundo Semestre</option> -->
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="txtAnio">Año</label> <input class="form-control"
									placeholder="2019" name="txtAnio" id="txtAnio" name="txtAnio" type="number"
									max="3000" min="2019" required>
							</div>
							<div class="form-group col-md-6">
								<label for="txtProfesor">Profesor</label> <select
									id="txtProfesor" name="txtProfesor" class="form-control">
									<%
			    		HashMap <String,String> Profesores=new HashMap<String,String>();
				 		try{
					 		DatosManager db=new DatosManager();
					    	if(db.executeQuery("SELECT dni,nombre,apellido FROM universidad.tbl_profesores where estado=true;"))
					    	{
								while (db.getRs().next()) {									 
									Profesores.put(db.getRs().getString("dni")+" "+db.getRs().getString("nombre")+" "+db.getRs().getString("apellido"),db.getRs().getString("dni"));								
								}
					 		
					 		}
				 		}
				 		catch(Exception ex)
				 		{ex.printStackTrace();}
						
						//recorro cada clave del hash map
								for ( String key : Profesores.keySet() ) {

					        %><option value="<%=Profesores.get(key).toString()%>"><%=key%></option><%					
						}
				 		
				 		%>
								</select>
							</div>
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cerrar</button>
					<button type="submit" id="btnGuardar"  name="btnGuardar" class="btn btn-primary">Guardar</button>
				</div>
				</form>
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
								<th scope="col">Dni</th>
								<th scope="col">Legajo</th>
								<th scope="col">Nombre</th>
								<th scope="col">Apellido</th>
								<th scope="col">Inscripto</th>
								<th></th>
								
							</tr>
						</thead>
						<tbody>
						  				  			  <%
						  if(request.getAttribute("cursoAlumno")!=null){
						
			  			  List<EntAlumno> alumnos=new ArrayList<EntAlumno>();
							NegAlumno.listarAlumnosXCurso(alumnos,request.getAttribute("cursoAlumno").toString());
							    		for(EntAlumno a : alumnos)
							    		{%> 
							<tr>
	  <form action="SvltAgregarAlumnoCursoAdmin" method="post">
      <td scope="row"><%=a.getDni()%> <input name="hfDni" id="hfDni" value="<%=a.getDni()%>" type="hidden"/></td>
      <td ><%=a.getLegajo()%> <input name="hfLegajo" id="hfLegajo" value="<%=a.getLegajo()%>" type="hidden"/></td>
      <td><%=a.getNombre()%> <input name="hfNombre" id="hfNombre" value="<%=a.getNombre()%>" type="hidden"/></td>
      <td><%=a.getApellido()%> <input name="hfApellido" id="hfApellido" value="<%=a.getApellido()%>" type="hidden"/></td>
      <td><%=a.getEstado()%></td>
      <td>
      <input name="hfIdCursoAlumno"  type="hidden" id="hfIdCursoAlumno" value="<%=request.getAttribute("cursoAlumno")%>" />
      <button type="submit" id="btnAgregarAlumno" name="btnAgregarAlumno" ><i class="fas fa-user-plus"></i></button>
      <button type="submit" id="btnEliminarAlumno" name="btnEliminarAlumno" ><i class="fas fa-user-times"></i></button>     
      </td>      
      </form>
							</tr>
							    <%}}%>
							
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

<script type="text/javascript">

$( document ).ready(function() {
	
	//Al cargar un curso con exito se muestra una alerta si fue ok o no
	if('<%=request.getAttribute("cargarCurso")%>'!="null" )
		{
		var error='<%=request.getAttribute("cargarCurso")%>'
		if(error=='ok')
			{
			sweetAlert("Buen trabajo","Curso cargado con exito","success");
			<%request.removeAttribute("cargarCurso");%>
			$('#hfEditar').val(null);
			}
		else
			{
			sweetAlert("Algo anduvo mal",error,"error")	;	
			<%request.removeAttribute("cargarCurso");%>
			$('#hfEditar').val(null);
			}
		
		
		}
	
	//Al asignar un alumno a un curso con exito se muestra una alerta si fue ok o no
	if('<%=request.getAttribute("cargarInscripcion")%>'!="null" )
		{
		var error='<%=request.getAttribute("cargarInscripcion")%>'
		if(error=='true')
			{
			sweetAlert("Buen trabajo","Alumno inscripto con exito","success");
			<%request.removeAttribute("cargarInscripcion");%>
			}
		else
			{
			sweetAlert("Algo anduvo mal",error,"error")	;	
			<%request.removeAttribute("cargarInscripcion");%>
			}
		}
	
	//Al desasignar un alumno a un curso con exito se muestra una alerta si fue ok o no
	if('<%=request.getAttribute("eliminarInscripcion")%>'!="null" )
		{
		var error='<%=request.getAttribute("eliminarInscripcion")%>'
		if(error=='true')
			{
			sweetAlert("Buen trabajo","Alumno desinscripto con exito","success");
			<%request.removeAttribute("eliminarInscripcion");%>
			}
		else
			{
			sweetAlert("Algo anduvo mal",error,"error")	;	
			<%request.removeAttribute("eliminarInscripcion");%>
			}
		}
	
	//Al no cargar el Curso correctamente se recarga el form con los datos ingresados
	if("<%=request.getAttribute("Curso")%>"!="null")
		{
		$('#btnAgregar').click();
		<%
		try
		{	
			
			EntCurso Curso=(EntCurso)request.getAttribute("Curso");
			if(Curso!=null)
			{
				%>
				$('#txtProfesor').val('<%=Curso.getDni_profesor()%>');
				$('#txtMateria').val('<%=Curso.getId_materia()%>');
				$('#txtAnio').val('<%=Curso.getAnio()%>');
				$('#txtSemestre').val('<%=Curso.getId_semestre()%>');
				<%
				request.removeAttribute("Curso");
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		%>
		}
	
	//Cuando se elimina un Curso se muestra una alerta
	if('<%=request.getAttribute("eliminado")%>'=='true')
		{
		sweetAlert("Buen trabajo","Curso eliminado con exito","success");
		<%request.removeAttribute("eliminado");%>
		}
	else if('<%=request.getAttribute("eliminado")%>'=='false')
		{
		sweetAlert("Error","El Curso no pudo ser eliminado","error");
		<%request.removeAttribute("eliminado");%>
		}
	
	//abre el modal al presionar editar curso, carga sus datos y pone el hf editando en true(para if del svlt guardar)
	if('<%=request.getAttribute("editando")%>'=='true')
		{		
		$('#modalAbm').modal('show');
		$('#hfEditar').val('true');
		
		$('#hfIdCursoAux').val('<%=request.getAttribute("CursoSelected")%>');
		
		$('#txtProfesor').val('<%=request.getAttribute("profesorSelected")%>');
		$('#txtMateria').val('<%=request.getAttribute("materiaSelected")%>');
		$('#txtAnio').val('<%=request.getAttribute("anioSelected")%>');
		$('#txtSemestre').val('<%=request.getAttribute("semestreSelected")%>');
		
		<%request.removeAttribute("editando");%>
		}
	
	//abre el modal al presionar asignar alumno, carga sus datos y pone el hf asignando en true(para if del svlt guardar)
	if('<%=request.getAttribute("asignando")%>'=='true')
		{		
		$('#modalAsignarAlumno').modal('show');			
		
		<%request.removeAttribute("asignando");%>
		}
	
	//presiona el boton de asignacion al asignar exitosamente
	if('<%=request.getAttribute("asignadoExito")%>'=='true')
		{		
		setTimeout(function(){
			$('#btnAsignar').click();			
			
			<%request.removeAttribute("asignadoExito");%>

		}, 2000); 

		}
	
	
	
	
});

function sleep(milliseconds) {
	  var start = new Date().getTime();
	  for (var i = 0; i < 1e7; i++) {
	    if ((new Date().getTime() - start) > milliseconds){
	      break;
	    }
	  }
	}

</script>


</body>
</html>