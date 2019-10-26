<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <jsp:include page="MasterPage.jsp" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<table id="tblAlumnos" class="table table-striped">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Curso</th>
      <th scope="col">Nota</th>
      <th scope="col">Estado</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Pepe</td>
      <td>Reina</td>
      <td>Laboratorio IV</td>
      <td>8</td>
      <td>Promocion</td>
      <td><a><i class="fas fa-eye"></i></a></td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>Laboratorio IV</td>
      <td>2</td>
      <td>Desaprobado</td>
      <td><a><i class="fas fa-eye"></i></a></td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>Metodologia de Sistemas</td>
      <td>6</td>
      <td>Regular</td>
      <td><a><i class="fas fa-eye"></i></a></td>
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

<script type="text/javascript">
	

</script>

</body>
</html>