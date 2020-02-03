<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="negocio.NegProfesor"%>
<%@page import="accesoDatos.DatosManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="entidad.EntProfesor"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="MasterPage.jsp" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div class="card">
	<div class="card-header text-center">Listado de Profesores</div>
	
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
						
						<button id="btnAgregar" type="button" data-toggle="modal" data-target="#modalAbm" class="btn btn-primary">Agregar Profesor</button>	
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
	
<table id="tblProfesores" class="table table-striped table-responsive-lg ">
  <thead>
    <tr>
      <th scope="col">Dni</th>
      <th scope="col">Legajo</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Fecha nacimiento</th>
      <th scope="col">Direccion</th>
      <th scope="col">Localidad</th>
      <th scope="col">Provincia</th>
      <th scope="col">Email</th>
      <th scope="col">Telefono</th>
      <th scope="col">Estado</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
  				  			  <%
			  			  List<EntProfesor> Profesores=new ArrayList<EntProfesor>();
							NegProfesor.listarProfesores(Profesores);
							    		for(EntProfesor a : Profesores)
							    		{%> 
	  <tr>
      <form action="SvltEliminarEditarProfesorAdmin" method="get">
      <td scope="row"><%=a.getDni()%> <input name="hfDni" id="hfDni" value="<%=a.getDni()%>" type="hidden"/></td>
      <td ><%=a.getLegajo()%> <input name="hfLegajo" id="hfLegajo" value="<%=a.getLegajo()%>" type="hidden"/></td>
      <td><%=a.getNombre()%> <input name="hfNombre" id="hfNombre" value="<%=a.getNombre()%>" type="hidden"/></td>
      <td><%=a.getApellido()%> <input name="hfApellido" id="hfApellido" value="<%=a.getApellido()%>" type="hidden"/></td>
      <td><%=a.getFecha_nac()%> <input name="hfFechaNac" id="hfFechaNac" value="<%=a.getFecha_nac()%>" type="hidden"/></td>
      <td><%=a.getDireccion()%> <input name="hfDireccion" id="hfDireccion" value="<%=a.getDireccion()%>" type="hidden"/></td>
      <td><%=a.getLocalidad()%> <input name="hfLocalidad" id="hfLocalidad" value="<%=a.getIdLocalidad()%>" type="hidden"/></td>
      <td><%=a.getProvincia()%> <input name="hfProvincia" id="hfProvincia" value="<%=a.getIdProvincia()%>" type="hidden"/></td>
      <td><%=a.getEmail()%> <input name="hfEmail" id="hfEmail" value="<%=a.getEmail()%>" type="hidden"/></td>
      <td><%=a.getTelefono()%> <input name="hfTelefono" id="hfTelefono" value="<%=a.getTelefono()%>" type="hidden"/></td>
      <td><%=a.getEstado()%></td>
      <td> <button id="linkEditar" type="submit" name="btnEditar"> <i class="fas fa-user-edit"></i></button> <button type="submit" name="btnEliminar" value="eliminar" ><i class="fas fa-trash-alt"></i></button></td>
      
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

<div id="modalAbm" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	       <form name="formModal" method="post" action="SvltGuardarProfesorAdmin">
	      <div class="modal-header">
		      <div class="container-fluid">
		      	<div class="row">
		      	<div class="col-4"></div>
		      	<div class="col-4"><h5 class="modal-title">Profesor</h5></div>
		      	<div class="col-4">        
			      	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			    </div>
		        
				</div>
	        </div>
	      </div>
      <div class="modal-body">
      
				<input name="hfEditar" id="hfEditar" type="hidden"/>
				<input type="hidden" id="hfDniAux" name="hfDniAux" />
				<input type="hidden" id="hfLegajoAux" name="hfLegajoAux" />
				<input type="hidden" id="hfEmailAux" name="hfEmailAux" />
				
				  <div class="form-row">
				    <div class="form-group col-md-6">
				      <label for="txtNombre">Nombre</label>
				      <input type="text" name="txtNombre" class="form-control" id="txtNombre" placeholder="Nombre" required>
				    </div>
				    <div class="form-group col-md-6">
				      <label for="txtApellido">Apellido</label>
				      <input type="text"  name="txtApellido" class="form-control" id="txtApellido" placeholder="Apellido" required>
				    </div>
				  </div>
				  				  <div class="form-row">
				  <div class="form-group col-md-6">
				    <label for="txtDni">Dni</label>
				    <input type="number" class="form-control"  name="txtDni" id="txtDni" placeholder="40362300" required>
				  </div>
					<div class="form-group col-md-6">
				    <label for="txtLegajo">Legajo</label>
				    <input type="number" class="form-control"  name="txtLegajo" id="txtLegajo" placeholder="40362300" required>
				  </div>
				  </div>
				  				  <div class="form-group">
				    <label for="txtEmail">Email</label>
				    <input type="email" class="form-control"  name="txtEmail" id="txtEmail" placeholder="mail@mail.com" required>
				  </div>
				  <div class="form-group">
				    <label for="txtDireccion">Direccion</label>
				    <input type="text" class="form-control"  name="txtDireccion" id="txtDireccion" placeholder="1234 Main St" required>
				  </div>
				  <div class="form-row">
				  	<div class="form-group col-md-6">
				      <label for="txtProvincia">Provincia</label>
				      <select id="txtProvincia" onChange="javascript:document.formModal.submit();" name="txtProvincia" class="form-control">
				      <%
			    		HashMap <String,String> Provincias=new HashMap<String,String>();
				 		try{
					 		DatosManager db=new DatosManager();
					    	if(db.executeQuery("SELECT id,nombre FROM universidad.tbl_provincias;"))
					    	{
								while (db.getRs().next()) {									 
									Provincias.put(db.getRs().getString("nombre"),db.getRs().getString("id"));								
								}
					 		
					 		}
				 		}
				 		catch(Exception ex)
				 		{ex.printStackTrace();}
						
						//recorro cada clave del hash map
								for ( String key : Provincias.keySet() ) {

					        %><option value="<%=Provincias.get(key).toString()%>"><%=key%></option><%					
						}
				 		
				 		%>
<!-- 				        <option value="13" selected>Provincia</option> -->
				      </select>
				    </div>
				    
				    <div class="form-group col-md-6">
				      <label for="txtLocalidad">Localidad</label>
				 		<select id="txtLocalidad"  name="txtLocalidad" class="form-control">
							<%
							if(request.getAttribute("Localidades")!=null){
			    		HashMap <String,String> Localidades=(HashMap <String,String>)request.getAttribute("Localidades");
				    		  if(Localidades!=null)
				    		  {					
						//recorro cada clave del hash map
								for ( String key : Localidades.keySet() ) {

					        %><option value="<%=Localidades.get(key).toString()%>"><%=key%></option><%					
						}
				    		  }
							}
							else
							{
								HashMap <String,String> Localidades=new HashMap<String,String>();
								
						 		try{
							 		DatosManager db=new DatosManager();
							    	if(db.executeQuery("SELECT id,nombre FROM universidad.tbl_localidades where provincia_id="+request.getParameter("hfProvincia")+";"))
							    	{
										while (db.getRs().next()) {									 
											Localidades.put(db.getRs().getString("nombre"),db.getRs().getString("id"));								
										}
							 		
							    		  if(Localidades!=null)
							    		  {					
									//recorro cada clave del hash map
											for ( String key : Localidades.keySet() ) {

								        %><option value="<%=Localidades.get(key).toString()%>"><%=key%></option><%					
									}
							    		  }
										
							 		}
							    	
							}
						 		catch(Exception ex)
						 		{ex.printStackTrace();}
							}
				 		%>
<!-- 				        <option value="1" selected>Localidad</option> -->

				      </select>
				    </div>
				    
				  </div>
				  <div class="form-row">
				    <div class="form-group col-md-6">
				      <label for="txtTelefono">Telefono</label>
						<input type="tel" class="form-control" id="txtTelefono" name="txtTelefono" placeholder="12345678" required>
				    </div>
				    <div class="form-group col-md-6">
					      <label for="txtFechaNac">Fecha de Nacimiento</label>
							<input type="date" class="form-control" id="txtFechaNac" name="txtFechaNac" placeholder="" required>
					    </div>				   
				  </div>			  
			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-danger" onClick="limpiarForm();" >Limpiar formulario</button>
        <button type="submit" name="btnGuardar" class="btn btn-primary">Guardar</button>
      </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
	
$( document ).ready(function() {
	
	//Al cargar un Profesor con exito se muestra una alerta si fue ok o no
	if('<%=request.getAttribute("cargarProfesor")%>'!="null" )
		{
		var error='<%=request.getAttribute("cargarProfesor")%>'
		if(error=='ok')
			{
			sweetAlert("Buen trabajo","Profesor cargado con exito","success");
			<%request.removeAttribute("cargarProfesor");%>
			$('#hfEditar').val(null);
			}
		else
			{
			sweetAlert("Algo anduvo mal",error,"error")	;	
			<%request.removeAttribute("cargarProfesor");%>
			$('#hfEditar').val(null);
			}
		
		
		}
	
	//Al no cargar el Profesor correctamente se recarga el form con los datos ingresados
	if("<%=request.getAttribute("Profesor")%>"!="null")
		{
		$('#btnAgregar').click();
		<%
		try
		{	
			
			EntProfesor Profesor=(EntProfesor)request.getAttribute("Profesor");
			if(Profesor!=null)
			{
				%>
				$('#txtNombre').val('<%=Profesor.getNombre()%>');
				$('#txtApellido').val('<%=Profesor.getApellido()%>');
				$('#txtDni').val('<%=Profesor.getDni()%>');
				$('#txtLegajo').val('<%=Profesor.getLegajo()%>');
				$('#txtEmail').val('<%=Profesor.getEmail()%>');
				$('#txtDireccion').val('<%=Profesor.getDireccion()%>');
				$('#txtLocalidad').val('<%=Profesor.getIdLocalidad()%>');
				$('#txtProvincia').val('<%=Profesor.getIdProvincia()%>');
				$('#txtTelefono').val('<%=Profesor.getTelefono()%>');
				$('#txtFechaNac').val('<%=Profesor.getFecha_nac()%>');
				<%
				request.removeAttribute("Profesor");
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		%>
		}
	
	//Cuando se cambia la provincia se recarga el form con los datos ingresados
	if("<%=request.getAttribute("provinciaChange")%>"=="ok")
	{
	$('#btnAgregar').click();			
	$('#txtProvincia').val('<%=request.getAttribute("provinciaSelected")%>');
	
	$('#txtNombre').val('<%=request.getAttribute("nombreSelected")%>');
	$('#txtApellido').val('<%=request.getAttribute("apellidoSelected")%>');
	$('#txtDni').val('<%=request.getAttribute("dniSelected")%>');
	$('#txtLegajo').val('<%=request.getAttribute("legajoSelected")%>');
	$('#txtEmail').val('<%=request.getAttribute("emailSelected")%>');
	$('#txtDireccion').val('<%=request.getAttribute("direccionSelected")%>');
	$('#txtTelefono').val('<%=request.getAttribute("telefonoSelected")%>');
	$('#txtFechaNac').val('<%=request.getAttribute("fechaNacSelected")%>');
	
	<%request.removeAttribute("provinciaChange");
		
	%>
	}
	
	//Cuando se elimina un Profesor se muestra una alerta
	if('<%=request.getAttribute("eliminado")%>'=='true')
		{
		sweetAlert("Buen trabajo","Profesor eliminado con exito","success");
		<%request.removeAttribute("eliminado");%>
		}
	else if('<%=request.getAttribute("eliminado")%>'=='false')
		{
		sweetAlert("Error","El Profesor no pudo ser eliminado, verifique si tiene un curso asignado","error");
		<%request.removeAttribute("eliminado");%>
		}
	
	//abre el modal al presionar editar Profesor, carga sus datos y pone el hf editando en true(para if del svlt guardar)
	if('<%=request.getAttribute("editando")%>'=='true')
		{		
		$('#modalAbm').modal('show');
		$('#hfEditar').val('true');
		
		$('#hfDniAux').val('<%=request.getAttribute("dniSelected")%>');
		$('#hfLegajoAux').val('<%=request.getAttribute("legajoSelected")%>');
		$('#hfEmailAux').val('<%=request.getAttribute("emailSelected")%>');
		
		$('#txtProvincia').val('<%=request.getAttribute("provinciaSelected")%>');
		$('#txtLocalidad').val('<%=request.getAttribute("localidadSelected")%>');
		$('#txtNombre').val('<%=request.getAttribute("nombreSelected")%>');
		$('#txtApellido').val('<%=request.getAttribute("apellidoSelected")%>');
		$('#txtDni').val('<%=request.getAttribute("dniSelected")%>');
		$('#txtLegajo').val('<%=request.getAttribute("legajoSelected")%>');
		$('#txtEmail').val('<%=request.getAttribute("emailSelected")%>');
		$('#txtDireccion').val('<%=request.getAttribute("direccionSelected")%>');
		$('#txtTelefono').val('<%=request.getAttribute("telefonoSelected")%>');
		var fechaNac='<%=request.getAttribute("fechaNacSelected")%>';
		$('#txtFechaNac').val(fechaNac.replace(' 00:00:00',''));
		
		<%request.removeAttribute("editando");%>
		}
	
});

function limpiarForm()
{
	$('#txtProvincia').val('');
	$('#txtLocalidad').val('');
	$('#txtNombre').val('');
	$('#txtApellido').val('');
	$('#txtDni').val('');
	$('#txtLegajo').val('');
	$('#txtEmail').val('');
	$('#txtDireccion').val('');
	$('#txtTelefono').val('');
	$('#txtFechaNac').val('');
	}

</script>


</body>
</html>