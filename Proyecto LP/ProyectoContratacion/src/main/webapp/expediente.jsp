<%
	if(request.getSession().getAttribute("LISTA")==null)
		response.sendRedirect("login.jsp");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<jsp:include page="menu.jsp"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expediente</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">

<style type="text/css">
	.oficios{
	 background-color:#F8F3FA ;
	 padding: 20px;
	 border-radius: 9px;
	 margin-top: 13px;
	
	}
	h1{
		text-align: center;
		margin-top: 3rem;
		color:white;
	}
	.oficiosDos{
	background-color:#F8F3FA ;
	
	 padding: 20px;
	 border-radius: 9px;
	 margin-top: 13px;
	}
	.modal-header{
		color:#fff;
		background: #428bca;
		display: flex;
  		justify-content: center;
  		
	}
	.help-block {
	  		color: red;
	}
	.form-group.has-error .form-control-label {
	  color: red;
	}
	.form-group.has-error .form-control {
	  border: 1px solid red;
	  box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	}
	
</style>
</head>
<body>
	<div class="container">
		<!-- Text Gestionar Oficio -->
			<h1>Gestionar Expediente</h1>
			<c:if test="${requestScope.MENSAJE!=null}">
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
				  <strong>MENSAJE : </strong> ${requestScope.MENSAJE} 
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</c:if>
		<!-- Nuevo Oficio y Criterios de B�squeda -->
		<div class="oficios d-flex justify-content-between align-items-center">
		
		<button type="button" id ="ejemplo"class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		  <img src="img/editar.png" class="am">Registrar Expediente
		</button>
			
  		</div>
  		
  
		
		
		<!-- tabla expediente-->
  		<div class="oficiosDos">
  			<div class="mt-4">
			
		    	<table id="example" class="table table-striped" style="width:100%">
				   <thead class="table-dark" style="opacity:0.6;">
				   <tr>
		                <th>N�Expediente</th>
		                <th>Fecha de Ingreso</th>
		                <th>Tiempo de contrato</th>
		                <th>Secretaria</th>
		                <th>Estado</th>
		                <th>N�Oficio</th>
		                <th></th>
		                <th></th>
		            </tr>
				  </thead>
				  <tbody>
				
		        	<c:forEach items="${requestScope.listExpediente}" var="row">
				            <tr>
				                <td>${row.codExpediente}</td>
				                <td>${row.fechaExpe}</td>
				                <td>${row.contratoTiempo}</td>
				                <td>${row.nomSecretria}</td>
				                <td>${row.estadoExpe}</td>
								<td>${row.codOficio}</td>
				                <td><button type="button" class="btn btn-success" 
				                			data-bs-toggle="modal" data-bs-target="#staticBackdrop"><img src="img/editar2.png"></button></td>
				                <td><button type="button" class="btn btn-danger" 
				                			data-bs-toggle="modal" data-bs-target="#modalEliminar"><img src="img/eliminar.png"></button></td>
				          </tr>
				        </c:forEach>             
		        </tbody>
			</table>
  		</div>
	</div>
	
	<!-- MODAL PARA REGISTRAR-->
<div class="modal fade" id="staticBackdrop" aria-hidden="true" aria-labelledby="staticBackdropLabel" tabindex="-1">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header" style="color:black;background-color: #884EA0;">
		        <h5 class="modal-title" id="#staticBackdropLabel"> REGISTRAR EXPEDIENTE</h5>
		     <!-- >tyle="#FAF8F2
				style="color:blue; background-color:#FAF8F2;"-->
		      </div> 
		      <div class="modal-body">
		        
		        <form id="idRegistrarOficio" method="post" action="ServletExpediente?tipo=REGISTRAR">
					  
					 <div class="form-group">
			 			  <label for="exampleInputEmail1" class="form-label">N� Expediente</label>
					    <input type="text" class="form-control" name="expediente" id="idExpediente"  readonly value=0>
					  	
    
					  </div>
					  <div class="col-md-4">
					    <label for="exampleInputEmail1" class="form-label">Fecha de ingreso [YYYY-MM-DD]</label>
					    <input type="text" class="form-control" name="fechaExpediente" id="idfechaExpediente">
					    
					  </div>
					  <div class="col-md-4">
					    <label for="exampleInputEmail1" class="form-label">Tiempo de contrato</label>
					    <input type="text" class="form-control" name="contrato" id="idContrato"> 
					    
					  </div>
					  <div class="col-md-4">
					    <label for="exampleInputEmail1" class="form-label">Nombre Secretaria</label>
					    <input type="text" class="form-control" name="nomSecre" id="idNomSecre">
					   
					  </div>
					  
					  <div class="col-md-4">
					    <label for="exampleInputEmail1" class="form-label">Estado</label>
					   <select class="form-select" name="estado" id="idEstado">
						  <option value="" selected>Seleccione estado</option>
						  <option value="revisado">Revisado</option>
						  <option value="No revisado">No revisado</option>
						</select>
					  </div>
					  
					  <div class="col-md-4">
						  
						    <label for="exampleInputEmail1" class="form-label">N� Oficio</label>
						    <input type="number" class="form-control" name="codigoOficio" id="idCodigoOfi" readonly> 
						 
					  </div>
					  		<div class="col-md-4">
							    <button type="submit" id="BuscarOficio"class="intento btn-primary"  data-bs-toggle="modal" data-bs-target="#staticBackdrop" >
									Buscar Oficio
								</button>
					
								</div>
					  
					  <div class="modal-footer">
				  	<button type="submit" class="btn btn-primary">Registrar</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
			     	 </div>
			     	 
				</form>
		        
		      </div>
		    </div>
		  </div>
		</div>
	<!-- MODAL PARA BUSCAR OFICIO -->
			     	 
					<div class="modal fade" id="modalBuscarOfi"  data-bs-backdrop="static"  aria-hidden="true" aria-labelledby="staticBackdropLabel" tabindex="-1" tabindex="-1">
						  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
						    <div class="modal-content">
						      <div class="modal-header" style="color:black;background-color: #FDFEFE;">
						        <h5 class="modal-title" id="staticBackdropLabel">BUSCAR OFICIO</h5>
						              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      
						      </div>
						      <form class="form-horizontal" role="form" id="form-agregar">
    				<div class="modal-body"> 
				 
  								<!-- 	<div class="mt-4" action="ServletOficio?tipo=BUSCARSOLICITANTE">
							  <div class="buscarSoli" action="ServletOficio?tipo=BUSCARSOLICITANTE" >
					  				<table id="example" class="table table-striped" style="width:100%">
					  		-->
					  		
								<table id="example2" class="table table-striped" style="width:100%">
							 	   <thead class="table-dark" style="opacity:0.6;">
									   <tr>
							                <th>N�Oficio</th>
							                <th>Fecha de Ingreso</th>
							                <th>Asunto</th>
							                <th>Secretaria de Logistica</th>
							                <th>Cod.Solicitante</th>
							                
							                <th></th>
							            </tr>
									  </thead>
							  <tbody>
					        	<c:forEach items="${requestScope.buscarOficios}" var="row">
							            <tr>
							                <td>${row.codOfi}</td>
							                <td>${row.fechaOfi}</td>
							                <td>${row.asuntoOfi}</td>
							                <td>${row.nomSecre}</td>
							                <td>${row.codSoli}</td>
							                <td><button type="button" class="enviarCodigo btn-info" 
							                data-bs-toggle="modal" data-bs-target="#staticBackdrop"><img src="img/enviar.png"></button></td>
								          </tr>
								       </c:forEach>             
						        </tbody>
							</table>
					
    				</div>
    			</form>			  
				      </div>
				     </div>						     
				    </div>
				 
				
				
				<!-- MODAL PARA ELIMINAR -->

		<div class="modal fade" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header"  style="color:black;background-color: #884EA0;">
		        <h5 class="modal-title" id="staticBackdropLabel">Sistema</h5>
		      </div>
		      <div class="modal-body">
		        <form id="idRegistrarOficio" method="post" action="ServletExpediente?tipo=ELIMINAR">
				    <input type="hidden" class="form-control" name="codigoEliminar" id="codigoEliminar">
				  <h4>�Seguro de eliminar el expediente?</h4>
				  <div class="modal-footer">
				  	<button type="submit" class="btn btn-primary"><img src="img/si.png"></button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><img src="img/rechazado.png"></button>
			     
				  	</div>			  
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	


		
	
	<!-- SCRIPT -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script>
$(document).ready(function() {
    $('#example').DataTable();
    
} );
$(document).ready(function() {
    $('#example2').DataTable();
    
} );
$(document).on('click', '#ejemplo', function() {
    $('#staticBackdrop').modal('show');
});

$(document).on('click', '#BuscarOficio', function() {
    $('#modalBuscarOfi').modal('show');
});
//aisgnar evento click a todos los botones con nombre de clase "btn-danger"
$(document).on("click",".btn-danger",function(){
	//variable
	let cod;
	//Obtener el codigo del oficio seg�n el bot�n eliminar que se a pulsado
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	//asignar a la caja con id "codigoEliminar" el valor de la variable "cod"
	$("#codigoEliminar").val(cod);
	
})
//aisgnar evento click a todos los botones con nombre de clase "btn-success"
$(document).on("click",".btn-success",function(){
	//variables
	let cod;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	
	$.get("ServletExpedienteJSON?codigo="+cod,function(response){
		$("#idExpediente").val(cod);
		$("#idfechaExpediente").val(response.fechaExpe);
		$("#idContrato").val(response.contratoTiempo);
		$("#idNomSecre").val(response.nomSecretria);
		$("#idEstado").val(response.estadoExpe);
		$("#idCodigoOfi").val(response.codOficio);
		
			
	})
})	



//aisgnar evento click a todos los botones con nombre de clase "btn-success"
$(document).on("click",".enviarCodigo",function(){
	//variables
	let cod;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	
	$.get("ServletOficioJSON?codigo="+cod,function(response){
		$("#idCodigoOfi").val(cod);
		
	})

	
	
	
	
})


</script>

<!-- SCRIPT DE VALIDACI�N DE REGISTRAR OFICIO  --> 
<script type="text/javascript">    
    $(document).ready(function(){     
        $('#idRegistrarOficio').bootstrapValidator({      
        	 fields:{
        		 fechaExpediente:{
        			 validators:{
     		 			notEmpty:{
     		 				message:'Es obligatorio este campo'
     		 			},
     		 			regexp:{
     		 				regexp:/^\d{4}([\-/.])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$/,
     		 				message:'Ingrese como el formato YYYY-MM-DD'
     		 			}
     		 		}
     		 	},
     		 	contrato:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[0-9a-zA-Z\�\�\s\�\�\�\�\�\�\�\�\�\�]{1,16}$/,
    		 				message:'Ingrese el tiempo de contrato'
    		 			}
    		 		}
    		 	},
    		 	nomSecre:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[a-zA-Z\�\�\s\�\�\�\�\�\�\�\�\�\�]{3,70}$/,
    		 				message:'Ingrese solo letras'
    		 			}
    		 			
    		 		}
    		 	}
        	 }
        });   
			
    });  
</script>


</body>
</html>