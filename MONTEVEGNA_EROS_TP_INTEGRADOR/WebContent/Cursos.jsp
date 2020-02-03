<%@page import="entidad.EntCurso"%>
<%@page import="negocio.NegCurso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="accesoDatos.DatosManager"%>
<%@page import="java.util.HashMap"%>
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
	
<table id="tblAlumnos" class="table table-striped">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Materia</th>
      <th scope="col">Semestre</th>
      <th scope="col">Año</th>
       <th scope="col">Estado</th>
<!--       <th scope="col">Cantidad Alumnos</th> -->
<!--       <th scope="col">Cantidad Aprobados</th> -->
<!--       <th scope="col">Cantidad Desaprobados</th> -->
<!--       <th scope="col">Estado</th> -->
    </tr>
  </thead>
			<tbody>
			
			  				  			  <%
			  			  List<EntCurso> cursos=new ArrayList<EntCurso>();
							NegCurso.listarCursosXProfesor(cursos, session.getAttribute("usuario").toString());
							    		for(EntCurso c : cursos)
							    		{%> 
				<tr>	
				<form action="SvltEliminarEditarCursosAdmin" method="get">
					<td scope="row"><%=c.getId_curso()%> <input value="<%=c.getId_curso()%>" type="hidden" name="hfIdCurso" id="hfIdCurso"/></td>
					<td><%=c.getMateria() %> <input value="<%=c.getId_materia()%>" type="hidden" name="hfIdMateria" id="hfIdMateria"/></td>
					<td><%=c.getSemestre() %> <input value="<%=c.getId_semestre() %>" type="hidden" name="hfIdSemestre" id="hfIdSemestre"/></td>
					<td><%=c.getAnio()%> <input value="<%=c.getAnio() %>" type="hidden" name="hfAnio" id="hfAnio"/> </td>
					<td><%=c.getEstado()%></td>
				</form>
				</tr>
				<%}%>			
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

</body>
</html>