<%@page import="entidad.EntCurso"%>
<%@page import="entidad.EntAlumno"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.NegProfesor"%>
<%@page import="negocio.NegCurso"%>
<%@page import="accesoDatos.DatosManager"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="MasterPage.jsp" />
<!DOCTYPE html>
<html>
<head>

  <!-- Theme style -->
  <link rel="stylesheet" href="CSS/adminlte.min.css">
  
<!--   Ionicons -->
<link rel="stylesheet" href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css">
  
  <style>
 label {
 font-weight:400 !important;
 }
</style>

</head>
<body>

<!--   INICIO ACORDEON -->
<div id="accordion">
<!--   INICIO ACORDEON -->

<!-- COLLAPSE ONE -->

  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" id="btnCollapseOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Cantidad de Alumnos Aprobados por Profesor
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
    <div class="card-body">
    <!--       FILTROS -->
        <form action="SvltGenerarInformeCursosProfesorAnio" method="post">
    <div class="row">

    <div class="col-lg-3 form-group">
    </div>
    <div class="col-lg-2 form-group">
						<label for="ddlProfesoresAprobados">Seleccione un Profesor </label> <select id="ddlProfesoresAprobados" name="ddlProfesoresAprobados"  class="form-control ">
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
	<div class="col-lg-2 form-group">
		<label  for="ddlAnioAprobados">Seleccione un año </label>
	 	<select id="ddlAnioAprobados" name="ddlAnioAprobados" class="form-control " >
										<%
						List<String> aniosAprobados = new ArrayList<String>();
				 		try{
					 		DatosManager db=new DatosManager();
					    	if(db.executeQuery("SELECT distinct anio FROM universidad.tbl_cursos where estado=true;"))
					    	{
					    		if(db.getRs()!=null)
					    			{
					    								    		
								while (db.getRs().next()) {									 
									aniosAprobados.add(db.getRs().getString("anio"));								
								}
					    			}
					 		
					 		}
				 		}
				 		catch(Exception ex)
				 		{ex.printStackTrace();}
						
						//recorro cada clave del hash map
								for ( String anio : aniosAprobados ) {

					        %><option value="<%=anio%>"><%=anio%></option><%					
						}
				 		
				 		%>
								</select>
    </div>
    
        <div class="col-lg-2 form-group" style="padding-top: 32px;">
        <button id="btnCalcularAprobados" name="btnCalcularAprobados" type="submit" class="btn btn-primary">Calcular</button>
    </div>
        <div class="col-lg-3 form-group">
    </div>

    </div>
        </form>
<!--     GRAFICO -->

                <div id="chartOne" class="chart"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas id="barChartAprobados" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block; width: 742px;" width="742" height="250" data-vivaldi-spatnav-clickable="1" class="chartjs-render-monitor"></canvas>
                </div>
    </div>
    </div>
  </div>
  
<!--   COLLAPSE TWO -->

  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" id="btnCollapseTwo" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    Cantidad de Cursos por Profesor
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">
      
<!--       FILTROS -->
 <form action="SvltGenerarInformeCantidadCursosProfesor" method="post">
            <div class="row">
    <div class="col-lg-5 form-group">
    </div>
	<div class="col-lg-2 form-group">
		<label  for="ddlAnioCursosProfesor">Seleccione un año </label>
	 	<select id="ddlAnioCursosProfesor" name="ddlAnioCursosProfesor" class="form-control " >
										<%
						List<String> aniosCursosProfesor = new ArrayList<String>();
				 		try{
					 		DatosManager db=new DatosManager();
					    	if(db.executeQuery("SELECT distinct anio FROM universidad.tbl_cursos where estado=true;"))
					    	{
					    		if(db.getRs()!=null)
					    			{
					    								    		
								while (db.getRs().next()) {									 
									aniosCursosProfesor.add(db.getRs().getString("anio"));								
								}
					    			}
					 		
					 		}
				 		}
				 		catch(Exception ex)
				 		{ex.printStackTrace();}
						
						//recorro cada clave del hash map
								for ( String anio : aniosCursosProfesor ) {

					        %><option value="<%=anio%>"><%=anio%></option><%					
						}
				 		
				 		%>
								</select>
    </div>
    
        <div class="col-lg-2 form-group" style="padding-top: 32px;">
        <button id="btnCalcularCursosProfesor" name="btnCalcularCursosProfesor" type="submit" class="btn btn-primary">Calcular</button>
    </div>
        <div class="col-lg-3 form-group">
    </div>
    </div>
    </form>
    
    <!--     GRAFICO -->
                <div  id="chartTwo" class="chart"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas id="barChartCursos" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block; width: 742px;" width="742" height="250" data-vivaldi-spatnav-clickable="1" class="chartjs-render-monitor"></canvas>
                </div>
    </div>
    </div>
  </div>
    
  
<!--   COLLAPSE THREE -->
  
    <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button id="btnCollapseThree" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" >
                    Informe Cursos
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body">
      <form method="post" action="SvltGenerarInformeCursoBasico">
          <div class="row" >
    <div class="col-lg-4 form-group">
    </div>
    <div class="col-lg-4 form-group">
									<label  for="ddlCursos">Seleccione un curso </label>
				     				<%List cursos= new ArrayList<EntCurso>();				     						
				     						NegCurso.listarCursos(cursos);
				     						%>
									<select id="ddlCursos" name="ddlCursos" class="form-control ">
								       	<%		for (EntCurso curso  : (ArrayList<EntCurso>)cursos)  {%>
								       	<option value="<%=curso.getId_curso()%>"><%=curso.getId_curso()+" "+curso.getMateria()+" "+curso.getSemestre()+" "+curso.getAnio()%></option>
								       	<%} %>
									</select>
	</div>
        <div class="col-lg-2 form-group" style="padding-top: 32px;">
        <button id="btnGenerarInformeCursoBasico" name="btnGenerarInformeCursoBasico" type="submit" class="btn btn-primary">Generar</button>
        <input type="hidden" id="hfGenerarInformeCursoBasico"  name="hfGenerarInformeCursoBasico" value="">
    </div>
        <div class="col-lg-2 form-group">
    </div>
    </div>
      </form>
        <div class="row" id="divInformeBasico">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-blue"><i class="icon ion-md-body"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Cantidad Total de Alumnos</span>
              <span class="info-box-number"><%=request.getAttribute("cantAlumnos") %></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="icon ion-md-close-circle-outline"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Cantidad de Alumnos Desaprobados</span>
              <span class="info-box-number"><%=request.getAttribute("cantAlumnosDesaprobados") %></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="icon ion-md-checkbox-outline"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Cantidad de Alumnos Aprobados</span>
              <span class="info-box-number"><%=request.getAttribute("cantAlumnosAprobados") %></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="ion ion-md-school"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Profesor a Cargo</span>
              <span class="info-box-number"><%=request.getAttribute("profesor") %></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>
      </div>
    </div>
  </div>
  
  
<!--   FIN ACORDEON -->
</div>
<!--   FIN ACORDEON -->

<!-- ChartJS -->
<script src="PLUGINS/Chart.min.js"></script>

<!-- reportes JS -->
<script src="JS/reportes.js"></script>

<script>

$(function () {
	
    //para paginar y filtros de tabla jquery
//     $('#table').DataTable({
//         scrollY: '50vh',
//         scrollCollapse: true,
//         scrollX: '50vh'
//     });

    



	


	
	//COLLAPSE 1
	

	//genera el array de objetos atraves de un json desde el back
    var informeCursosProfesorAnio =  [];
    var jsonCollapse1=[];
    try
    { 

    	jsonCollapse1='<%=request.getAttribute("informeCursosProfesorAnio")%>';
     informeCursosProfesorAnio = JSON.parse(jsonCollapse1);
    	}
    catch{
    	jsonCollapse1=[];
    	}

    //grafica el array de objetos si existe
    if(informeCursosProfesorAnio)
    	{graficoAprobados(informeCursosProfesorAnio);}
	
	var HfInformeCursosProfesorAnio='<%=request.getAttribute("generarInformeCursosProfesorAnio")%>';
	
	//si se genero el informe
	if(HfInformeCursosProfesorAnio=='true')
	{
	//abro el collapse
	$('#btnCollapseOne').click();
	//le paso los valores a los dropdown
	$('#ddlAnioAprobados').val('<%=request.getAttribute("ddlAnioAprobados")%>');
	$('#ddlProfesoresAprobados').val('<%=request.getAttribute("ddlProfesoresAprobados")%>');
	
	//para mostrar el grafico
	$('#chartOne').show();
	}
	else{
		//oculto el grafico
		$('#chartOne').hide();
	}
	
	//COLLAPSE 2
	
		//genera el array de objetos atraves de un json desde el back
    var informeCantidadCursosProfesor =  [];
    var jsonCollapse2=[];
    try
    { 

    	jsonCollapse2='<%=request.getAttribute("informeCantidadCursosProfesor")%>';
     informeCantidadCursosProfesor = JSON.parse(jsonCollapse2);
    	}
    catch{
    	jsonCollapse2=[];
    	}

    //grafica el array de objetos si existe
    if(informeCantidadCursosProfesor)
    	{graficoCursos(informeCantidadCursosProfesor);}
	
	var HfInformeCantidadCursosProfesor='<%=request.getAttribute("generarInformeCantidadCursosProfesor")%>';
	
	//si se genero el informe
	if(HfInformeCantidadCursosProfesor=='true')
	{
	//abro el collapse
	$('#btnCollapseTwo').click();
	//le paso los valores a los dropdown
	$('#ddlAnioCursosProfesor').val('<%=request.getAttribute("ddlAnioCursosProfesor")%>');
	
	//para mostrar el grafico
	$('#chartTwo').show();
	}
	else{
	$('#chartTwo').hide();
	}
	
	//COLLAPSE 3
	
		
	var HfGenerarInformeCursoBasico='<%=request.getAttribute("GenerarInformeCursoBasico")%>';
	
	if(HfGenerarInformeCursoBasico=='true')
		{
		$('#btnCollapseThree').click();
		//le paso los valores a los dropdown
		$('#ddlCursos').val('<%=request.getAttribute("ddlCursos")%>');
		}
	else
		{
		$('#divInformeBasico').hide();
		}



	
    
});


</script>

</body>
</html>