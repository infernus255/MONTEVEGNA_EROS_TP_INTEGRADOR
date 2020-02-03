<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="entidad.EntLogin" %>
    <%@ page import="negocio.NegLogin" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- 	paginacion -->
<!-- 	<link rel="stylesheet" href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"> -->
	<!-- 	Iconos Font Awersome -->
	<script src="https://kit.fontawesome.com/61f9857880.js" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>TP INTEGRADOR</title>
  </head>
  <body >
  
  <%
  
	//busco si inicio sesion correctamente
		EntLogin login=new EntLogin(session.getAttribute("usuario").toString(), session.getAttribute("contrasena").toString());
		
		if(login.getUsuario()!=null && login.getContrasena()!=null && login.getUsuario()!="" && login.getContrasena()!="")
		{
		if(login.getUsuario().equals("admin") && login.getContrasena().equals("admin"))
		{
				request.setAttribute("navUser", "none");
				request.setAttribute("navAdmin", "block");			
		}
		else {
			if(NegLogin.validarIngreso(login))
			{
					request.setAttribute("navUser", "block");
					request.setAttribute("navAdmin", "none");				
			}
			else
			{
		    	RequestDispatcher rd= request.getRequestDispatcher("Login.jsp");
		    	rd.forward(request, response);
			}
		}
		}
		else
		{
    	RequestDispatcher rd= request.getRequestDispatcher("Login.jsp");
    	rd.forward(request, response);
		}

  %>
  
<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="navbar-brand">Perfil</span> 
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" id="linkCerrarSesion" href="Login.jsp">Cerrar Sesion</a>
        </div>
      </div>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">    	

      <li class="nav-item">
        <a class="nav-link active" id="navAlumnosAdmin" style="display:<%=request.getAttribute("navAdmin") %>;" href="AlumnosAdmin.jsp">Alumnos Admin</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" id="navProfesoresAdmin" style="display:<%=request.getAttribute("navAdmin") %>;" href="ProfesoresAdmin.jsp">Profesores Admin</a>
      </li>
            <li class="nav-item">
        <a class="nav-link active" id="navCursosAdmin" style="display:<%=request.getAttribute("navAdmin") %>;" href="CursosAdmin.jsp">Cursos Admin</a>
      </li>
            <li class="nav-item">
        <a class="nav-link active" id="navReportesAdmin" style="display:<%=request.getAttribute("navAdmin") %>;" href="ReportesAdmin.jsp">Reportes Admin</a>
      </li>
            <li class="nav-item">
        <a class="nav-link active" id="navAlumnos" style="display:<%=request.getAttribute("navUser") %>;" href="Alumnos.jsp">Alumnos</a>
      </li>
            <li class="nav-item">
        <a class="nav-link active" id="navCursos" style="display:<%=request.getAttribute("navUser") %>;" href="Cursos.jsp">Cursos</a>
      </li>
    </ul>
  </div>
</nav>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<!--   	<script src="cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script> -->
<!--   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
  	
    <!-- Extra JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="JS/alertas.js"></script>
    
    <script type="text/javascript">
	
    $('#linkCerrarSesion').click(function(){sessionStorage.clear();} )
    
    </script>
    
  </body>
</html>