
<%
	if(request.getSession().getAttribute("LISTA")==null)
		response.sendRedirect("login.jsp");
%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<!-- CSS -->
<style type="text/css">
	
	.separadoUno{

	margin-left: 4rem;
	
	}
	.separadoDos{

	margin-left: 19rem;
	
	}
	li:hover{
	
	color: purple;
	
	}
	body{
	background-image: url("img/fondoActual.png");
	background-position: center ;
	background-size: cover;
	



	}
</style>
</head>
<body>
<!-- header -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
  <div class="separadoUno">
    <a class="navbar-brandHori" href="#">
	    		  <img src="img/logoPrincipal.png" alt="Imagen no encontrada" width="80" height="50" class="d-inline-block align-text-top">
	   		  </a>
    </div>
    
    <div class="separadoDos collapse navbar-collapse d-flex justify-content-center" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
       <c:forEach items="${sessionScope.LISTA}" var="bean">
			    <li class="nav-item">
			      <a class="nav-link" href="${bean.url}">${bean.nombre}</a>
			    </li>
			</c:forEach>
	
      </ul>
      </div>
      <span class="navbarHori-text" style="color:purple;font-weight:bold;">
				      Proceso de Contrato |</span>
		    
		          <a class="nav-link" href="ServletUsuario?tipo=CERRAR" style="color: blue;">Cerrar Sessión</a>
      
    
  </div>
</nav>


<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

<!-- JS para validación-->
<script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>
<!-- 
<script type="text/javascript">
	let siderbarToggle= document.querySelector(".toggle-btn");
	siderbarToggle.addEventListener("click", function(){
		document.getElementById("navbar").classList.toggle("active");
	});
</script> -->

</body>
</html>