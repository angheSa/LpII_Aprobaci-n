
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Municipalidad Provincial de Ica</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style type="text/css">
body {
  background: #eee;
 	background-image: url("img/fondo1.jpg");
	

  background-repeat: no-repeat; /* Do not repeat the image */
background-size: cover;
}
.wrapper {
  margin: 15%;
}
.form-signin {
  max-width: 380px;
  margin: 0 auto;
  background-color: #fff;
  padding: 5px 40px 50px; 
  border: 1px solid #e5e5e5;
  border-radius: 10px;
}
.form-signin .form-signin-heading, .form-signin .checkbox {
  margin-bottom: 30px;
}
.form-signin input[type="text"], .form-signin input[type="password"] {
  margin-bottom: 20px;
}
.form-signin .form-control {
  padding: 10px;
}
.modal-login {
		color: #636363;
		
		margin: 25px auto;
		
	}
	.modal-login .modal-content {
		padding: 0px;
		border-radius: 5px;
		border: none;
		
	}
	.modal-login .modal-header {
		border-bottom: none;
		position: relative;
		justify-content: center;
		background-color: #884EA0;
		
	}
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
	}
	.modal-login  .form-group {
		position: relative;
	}
	.modal-login i {
		position: absolute;
		left: 13px;
		top: 11px;
		font-size: 18px;
	}
	.modal-login .form-control {
		padding-left: 40px;
	}
	.modal-login .form-control:focus {
		border-color: #428bca;
	}
	.modal-login .form-control, .modal-login .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-login .hint-text {
		text-align: center;
		padding-top: 10px;
	}
	.modal-login .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}
	.modal-login .btn {
		background: #428bca;
		border: none;
		line-height: normal;
		font-weight:bold;
		width:40%;
	}
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #428bca;
	}
	.modal-login .modal-footer {
		background: #ecf0f1;
		border-color: #dee4e7;
		text-align: center;
		margin: 0 -20px -20px;
		border-radius: 5px;
		font-size: 13px;
		justify-content: center;
	}
	.modal-login .modal-footer a {
		color: #999;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
	
	.modal-header{
		margin:0px;
		color:#fff;
		background: #428bca;
		display: flex;
  		justify-content: center;
  		
	}
	.pie{
		margin:0px;
		display: flex;
  		justify-content: center;
  		
	}
</style>
</head>
<body>
		<c:if test="${requestScope.MENSAJE!=null}">
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
				  <strong>MENSAJE : </strong> ${requestScope.MENSAJE} 
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
		</c:if>


<div class="wrapper">
<div id="myModal">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<h5 class="modal-title">INGRESAR</h5>
			</div>
			<div class="modal-body">
				<form action="ServletUsuario?tipo=INICIAR" method="post">
					<div class="form-group">
						<i class="fa fa-user"></i>
						<input type="text" class="form-control" placeholder="Username" required="required" name="usuario">
					</div>
					<div class="form-group">
						<i class="fa fa-lock"></i>
						<input type="password" class="form-control" placeholder="Password" required="required" name="clave">					
					</div>
					<div class="pie">
						<!--<input type="submit" class="btn btn-primary btn-block btn-lg" value="Login">-->
						<input type="submit" class="btn btn-primary btn-sm" style="background-color: #884EA0;" aria-pressed="true"value="Iniciar Sesi�n">
					</div>
				</form>				
				
			</div>
		</div>
	</div>
</div>     

</div>





</body>
</html>