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
	
<table id="tblAlumnos" class="table table-striped">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Materia</th>
      <th scope="col">Semestre</th>
      <th scope="col">Año</th>
      <th scope="col">Cantidad Alumnos</th>
      <th scope="col">Cantidad Aprobados</th>
      <th scope="col">Cantidad Desaprobados</th>
<!--       <th scope="col">Estado</th> -->
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Laboratorio IV</td>
      <td>Segundo</td>
      <td>2019</td>
      <td>30</td>
      <td>20</td>
      <td>10</td>
<!--       <td>Activo</td> -->
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Laboratorio IV</td>
            <td>Segundo</td>
      <td>2019</td>
      <td>40</td>
      <td>30</td>
      <td>10</td>
<!--       <td>Activo</td> -->
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Metodologia de Sistemas</td>
            <td>Segundo</td>
      <td>2019</td>
      <td>35</td>
      <td>30</td>
      <td>5</td>
<!--       <td>Inactivo</td> -->
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

</body>
</html>