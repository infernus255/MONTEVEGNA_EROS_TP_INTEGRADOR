<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type">
    <meta charset="utf-8">
    <meta name="viewport" content="text/html; width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>TP INTEGRADOR</title>
  </head>
  <body>
    <div class="card text-center">
  <div class="card-header">
    LOGIN
  </div>
  <div class="card-body">
	<form method="post" action="SvltLogin2">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
			  <div class="form-group">
			    <label for="txtUser">Nombre de Usuario</label>
			    <input type="text" class="form-control" id="txtUser" name="txtUser" placeholder="Nombre de usuario" required>
			  
			  </div>
			</div>
			<div class="col-md-3"></div>		
		</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
			  <div class="form-group">
			    <label for="txtPass">Contraseña</label>
			    <input type="password" name="txtPass" class="form-control" id="txtPass" aria-describedby="passHelp" placeholder="Contraseña" required>
			    <small id="passHelp" class="form-text text-muted">No compartas tu contraseña con nadie</small>
			  </div>
			</div>
			<div class="col-md-3"></div>
	    </div>
	  <button type="submit" id="btnIniciar" name="btnIniciar" class="btn btn-primary">Iniciar Sesion</button>
	</form>
  </div>
</div>

    <!-- Extra JavaScript -->
    <script src="alertas.js"></script>
    <script type="text/javascript">

    
    function loginFallido()
    {
    	var x = getCookie("admin");
    	
    	if(x)
    		{
		    	if(x!="ok")
		    	{
		    		errorAlert("Error al iniciar sesion","Ingrese un usuario o contraseña validos")
		    	}
    		}
    }
    
    function getCookie(cname) {
    	  var name = cname + "=";
    	  var decodedCookie = decodeURIComponent(document.cookie);
    	  var ca = decodedCookie.split(';');
    	  for(var i = 0; i <ca.length; i++) {
    	    var c = ca[i];
    	    while (c.charAt(0) == ' ') {
    	      c = c.substring(1);
    	    }
    	    if (c.indexOf(name) == 0) {
    	      return c.substring(name.length, c.length);
    	    }
    	  }
    	  return "";
    	}
    
    </script>
    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>

