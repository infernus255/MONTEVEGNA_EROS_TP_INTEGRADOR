<%@page import="entidad.EntAlumno"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.NegProfesor"%>
<%@page import="entidad.EntCurso"%>
<%@page import="entidad.EntEstadoAcademico"%>
<%@page import="negocio.NegCurso"%>

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
			  			  <form method="post" action="SvltFiltrarGuardar">
			     		<div class="form-row">
			     			<div class="col-lg-3"></div>
				     		<div class="col-lg-3 form-group">
				     				<label  for="ddlCursos">Seleccione un curso </label>
				     				<%HashMap<String, String> cursos= new HashMap<String, String>();
				     						String dni=NegProfesor.obtenerDniProfesor(session.getAttribute("usuario").toString());
				     						NegCurso.listarCursosFiltro(cursos,dni);
				     						%>
									<select id="ddlCursos" name="ddlCursos" class="form-control ">
								       	<%		for ( String key : cursos.keySet() ) {%>
								       	<option value="<%=cursos.get(key)%>"><%=key%></option>
								       	<%} %>
									</select>
				     		</div>
				     		<div class="col-lg-3 form-group " style="padding-top:32px;">
				     			<button id="btnFiltrar" name="btnFiltrar" type="submit" class="btn btn-primary" >Filtrar</button>										
<!-- 								<button id="btnGuardar" name="btnGuardar" type="submit" class="btn btn-primary">Guardar</button>	 -->
				     		</div>
							<div class="col-lg-3"></div>
			     		</div>
			     		</form>

			     		<hr/>
			     		<form class="form-row">
			     		<div class="col-12">
			     			<div class="form-inline text-center">   
							  	<input class="form-control my-1 mr-2" type="search" placeholder="Buscar" aria-label="Search">
							    <button class="btn btn-outline-success my-1 mr-2" type="search">Buscar</button>
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
<form method="post" action="SvltFiltrarGuardar">
<table class="table table-striped table-responsive-lg">
  <thead>
    <tr>
      <th scope="col">Dni</th>
      <th scope="col">Legajo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Nota 1</th>
      <th scope="col">Nota 2</th>
      <th scope="col">Recuperatorio 1</th>
      <th scope="col">Recuperatorio 2</th>
      <th scope="col">Estado</th>
      
    </tr>
  </thead>
  <tbody>

  <% 
  List<EntAlumno> alumnos=(List<EntAlumno>)request.getAttribute("alumnos");
							    		if(alumnos!=null){
  for(EntAlumno a : alumnos)
  {
  
  %>
    <tr>

		<td scope="row"><%=a.getDni()%> <input name="hfDni" id="hfDni" value="<%=a.getDni()%>" type="hidden"/></td>
      <td ><%=a.getLegajo()%> <input name="hfLegajo" id="hfLegajo" value="<%=a.getLegajo()%>" type="hidden"/></td>
      <td><%=a.getNombre()%> <input name="hfNombre" id="hfNombre" value="<%=a.getNombre()%>" type="hidden"/></td>
      <td><%=a.getApellido()%> <input name="hfApellido" id="hfApellido" value="<%=a.getApellido()%>" type="hidden"/></td>
      <td> <input name="txtNota1" id="txtNota1" value="<%=a.getEstadoAcademico().getNota1()%>" type="text"/></td>
      <td> <input name="txtNota2" id="txtNota2" value="<%=a.getEstadoAcademico().getNota2()%>" type="text"/></td>
      <td> <input name="txtRecuperatorio1" id="txtRecuperatorio1" value="<%=a.getEstadoAcademico().getRecuperatorio1()%>" type="text"/></td>
      <td> <input name="txtRecuperatorio2" id="txtRecuperatorio2" value="<%=a.getEstadoAcademico().getRecuperatorio2()%>" type="text"/></td>
      <td>      	<select name="txtEstado" id="txtEstado" class="form-control">
      <%if(a.getEstadoAcademico().getEstado()=="1"){%>
	        <option value="0">Libre</option>
	        <option value="1" selected>Regular</option>
	        <%
      } 
      else
      {%>
      <option value="0" selected>Libre</option>
      <option value="0" >Regular</option>
      <%
		} %>
	    </select>
	    </td>

    </tr>
  <%}
							    		}
  %>

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
	<div class="col-md-4">
	<button id="btnGuardar" name="btnGuardar" type="submit" class="btn btn-primary my-1 mr-2">Guardar</button>	
	</div>
</div>
</div>
        </form>
<script>

$( document ).ready(function() {
	
	if('<%=request.getAttribute("error")%>'!='null')
		{
		var error='<%=request.getAttribute("error")%>';
		if(error=='true')
			{
			sweetAlert("Buen trabajo","Notas cargadas con exito","success");
		<%request.removeAttribute("error");%>
			}
		else
		{
			sweetAlert("Algo anduvo mal",error,"error")	;	
			<%request.removeAttribute("error");%>
		}
		}
	
	if('<%=request.getAttribute("idCursoAux")%>'!='null')
	{
	$('#ddlCursos').val('<%=request.getAttribute("idCursoAux")%>');
	}

	
});

</script>

</body>
</html>