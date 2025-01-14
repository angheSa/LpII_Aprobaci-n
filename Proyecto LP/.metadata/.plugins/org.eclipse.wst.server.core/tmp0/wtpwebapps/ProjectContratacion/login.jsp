
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Municipalidad Provincial de Ica</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">


<style type="text/css">
body {
  background: #eee;
background-image: url("img/fondoActual.png");
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover;

}


.btn {
		background: #428bca;
		border: none;
		line-height: normal;
		font-weight:bold;
		width:40%;
}
	.row{
	background-color:white;
	
	}
	.login{
	margin-top: 7rem;
	
	}
	.form-control {
		margin-left: 9.5rem;
		border-radius: 60px;
		width:50%;
	}
	h5 {
		text-align: center;
		font-size: 26px;
		margin:40px;
		
	}
	.form-group {
		position: relative;
	}
	.login i {
		position: absolute;
		left: 102px;
		top: 8px;
		font-size: 25px;
	}
	h4{
	text-align: center;
	color: white;
	background-color: #884EA0;
	padding-top: 17px;
	padding-bottom: 6px;
	}
	
</style>
</head>
<body>
		

					
				
<!-- 
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div> -->

<!--
				
				<div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  
    <strong>MENSAJE : </strong> ${requestScope.MENSAJE} 
     <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

</div> -->
		
<div class="login">
<div class="container" >
	<div class="row g-0">
		<div class="col-lg-5">
		
			<h4>Municipalidad Provincial de Ica</h4>
			<img src="img/logoIca.png" alt="Imagen no encontrada" 
			 width="440" height="400" style="padding-left: 8px; padding-top: 6px;">
		</div>
		<div class="col-lg-7 text-center py-5" style="background-color: white;">
				<h5>�Bienvenido al sistema de aprobaci�n de expediente de contrataci�n!</h5>	

				<form action="ServletUsuario?tipo=INICIAR" method="post">
				<div class="py-3">
					<div class="form-group offset-1 col-lg-10">
						<i class="bi bi-people-fill"></i>
						<input type="text" class="form-control" placeholder="Usuario" required="required" name="usuario">
					</div>
				</div>
				<div class="py-3">
					<div class="form-group offset-1 col-lg-10">
						<i class="bi bi-file-earmark-lock-fill"></i>
						<input type="password" class="form-control" placeholder="Contrase�a" required="required" name="clave">					
					</div>
				</div>
				<div class="py-3">
					<div class="form-group offset-1 col-lg-10">
						<input type="submit" class="btn btn-primary btn-sm"  style="background-color: #884EA0; border-radius: 50px; padding:8px;" aria-pressed="true"value="Iniciar Sesi�n">
					</div>
				</div>
				<c:if test="${requestScope.MENSAJE!=null}">
					 <div class="alert alert-danger alert-dismissible fade show" role="alert">
						  <i class="bi bi-exclamation-triangle-fill" width="24" height="24" style="margin-left: 100px;"></i> 
						  <div style="margin-left: 100px;">
						  ${requestScope.MENSAJE} 
						  </div>
					</div>
				</c:if>
				</form>				
				
			</div>
		</div>
	</div>
</div>     

	
	<!-- SCRIPT -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
$(document).ready(function() {
	$(".alert").fadeTo(2000,500).slideUp(660,function(){
		$(".alert").slideUp(660);	
	});
    
} );


</script>


</body>
</html>