<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CONSULTA</title>
	<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
			
			<c:if test="${param.MENSAJE!=null}">
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
				  <strong>MENSAJE : </strong> ${param.MENSAJE} 
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</c:if>
			<c:remove var="param.MENSAJE"/>
		<h2 class="text-center">Consulta de Supervisor por Sucursal</h2>
		<form>
		   <div class="form-row mt-4 d-flex justify-content-between align-items-center">
			    <div class="col-auto d-flex align-items-center">
			       <label for="exampleInputPassword1">Selección de Sucursal:</label>
			 
				    <select class="form-control" name="sucur" id="idSucursalBuscar">
				      <option value=" ">[Seleccione Sucursal]</option>
				      <option value="Rimac">Rimac</option>
				      <option value="Brena">Breña</option>
				      <option value="Jesus Maria">Jesus Maria</option>
				      <option value="Comas">Comas</option>
				      <option value="Lince">Lince</option>
				    </select>
				</div>
			    <div class="col-auto d-flex" >
			      <button type="button" class="btn btn-primary mb-2" id="btn-consultar">Consultar</button>
			    </div>
		  </div>
		</form>
		
		<div class="mt-4">
			<table id="tableSupervisor" class="table table-striped table-bordered" style="width:100%">
		        <thead>
		            <tr>
		                <th>CÓDIGO</th>
		                <th>NOMBRES</th>
		                <th>APELLIDOS</th>
		                <th>DNI</th>
		                <th>HIJOS</th>
		                <th>SUELDO</th>
		                <th>SUCURSAL</th>
		                <th></th>
		            </tr>
		        </thead>
		        <tbody>
				</tbody>
			</table>	
		</div>
		
		<!-- MODAL EDITAR-->
		<div class="modal fade" id="modalSupervisor" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">SUPERVISOR</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form id="formDocente" method="post" action="ServletSupervisor">
				  <div class="form-group">
				    <label for="exampleInputEmail1">Código</label>
				    <input type="text" class="form-control" id="idCodigo" name="codigo" readonly>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Nombres</label>
				    <input type="text" class="form-control" id="idNombre" readonly>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Apellidos</label>
				    <input type="text" class="form-control" id="idApellidos" readonly>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">DNI</label>
				    <input type="text" class="form-control" id="idDni" readonly>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">Hijos</label>
				    <input type="text" class="form-control" id="idHijos" readonly>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Sueldo</label>
				    <input type="text" class="form-control" id="idSueldo" readonly>
				  </div>	
				  <div class="form-group">
				    <label for="exampleInputPassword1">Sucursal</label>
				    <select class="form-control" name="sucur" id="idSucursal" readonly>
				      <option value=" ">[Seleccione Sucursal]</option>
				      
				    </select>
				    
				  </div>			  
				  
				  <div class="modal-footer">
			      	<button type="submit" class="btn btn-primary">Eliminar</button>
			      </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<script>
		//
		llenarSucursales();
		
		$(document).on("click","#btn-consultar",function(){
			let num;
			num=$("#idSucursalBuscar").val();
			$("#tableSupervisor tbody").empty();
			$.get("ServletSupervisorJSON?sucursa="+num,function(response){
				$.each(response,function(index,item){
					$("#tableSupervisor").append("<tr><td>"+item.codigo+"</td><td>"+
							item.nombres+"</td><td>"+item.apellidos+"</td><td>"+
							item.dni+"</td><td>"+item.hijos+"</td><td>"+
							item.sueldo+"</td><td>"+item.nombreSucursal+"</td><td>"+
							"<button type='button' class='btn btn-success btn-datos' data-bs-toggle='modal'"+
							"data-bs-target='#modalSupervisor'>Ver Datos</button></td></tr>");
				}) 
			})
		})	
		
		
		function llenarSucursales(){
			$.get("ServletSucursalJSON",function(response){
				$.each(response,function(index,item){
					$("#idSucursal").append("<option>"+item.nombre+"</option>");
				})
			})
		}
		$(document).on("click",".btn-datos",function(){
			let cod,nom,apell,dni,hijos,sueldo,sucursal;
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			nom=$(this).parents("tr").find("td")[1].innerHTML;
			apell=$(this).parents("tr").find("td")[2].innerHTML;
			dni=$(this).parents("tr").find("td")[3].innerHTML;
			hijos=$(this).parents("tr").find("td")[4].innerHTML;
			sueldo=$(this).parents("tr").find("td")[5].innerHTML;
			sucursal=$(this).parents("tr").find("td")[6].innerHTML;
			$("#idCodigo").val(cod);
			$("#idNombre").val(nom);
			$("#idApellidos").val(apell);
			$("#idDni").val(dni);
			$("#idHijos").val(hijos);
			$("#idSueldo").val(sueldo);
			$("#idSucursal").val(sucursal);
			
			
		})
	</script>
</body>
</html>
