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
<title>Memorando</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">

<style type="text/css">
	.expedientes{
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
	.expedienteDos{
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
	.am{
		padding-right: 4px;
	}
</style>
</head>
<body>
	<div class="container">
		<!-- Text Gestionar Memorando -->
			<h1>Gestionar Memorando</h1>
			<c:if test="${requestScope.MENSAJE!=null}">
				<div class="alert alert-success alert-dismissible fade show" role="alert">
				  <strong>MENSAJE : </strong> ${requestScope.MENSAJE} 
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				  
				</div>
				
			</c:if>
		<!-- Nuevo expediente y Criterios de Búsqueda -->
		<div class="expedientes d-flex justify-content-between align-items-center">
		
		<button type="button" id ="ejemplo"class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		  <img src="img/editar2.png" class="am">Registrar Memorando
		</button>
			
  		</div>
  		
  
		
		
		<!-- tabla expediente-->
  		<div class="expedienteDos">
  			<div class="mt-4">
			
		    	<table id="example" class="table table-striped" style="width:100%">
				   <thead class="table-dark" style="opacity:0.6;">
				   <tr>
					    <th>Codigo</th>
		                <th>N°Memorando</th>
		                <th>Fecha Registro</th>
		                <th>Asunto</th>
		                <th>Gerente</th>
		                <th>Mensaje</th>
		                <th>Acciones</th>
		                
					    
		               
		            </tr>
				  </thead>
				  <tbody>
				
		        	<c:forEach items="${requestScope.listMemorando}" var="row">
				            <tr>
				                <td>${row.codigoMemorando}</td>
				                <td>${row.codMemo}</td>
				                <td>${row.fechMemo}</td>
				                <td>${row.asuntMemo}</td>
				                <td>${row.nomGere}</td>
				                <td>${row.mens}</td>
				                
								
				                <td><button type="button"  class="btn btn-success" 
				                			data-bs-toggle="modal" data-bs-target="#staticBackdrop"><img src="img/editar2.png"></button>
				                </td>
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
		      <div class="modal-header" style="color:black;background-color:#D6DBDF;">
		        <h5 class="modal-title" id="#staticBackdropLabel"> MEMORANDO</h5>
		     <!-- >tyle="#FAF8F2
				style="color:blue; background-color:#FAF8F2;"-->
		      </div> 
		      <div class="modal-body">
		        
		        <form id="idRegistrarOficio" method="post" action="ServletMemorando?tipo=REGISTRAR">
					   <div class="row justify-content-around">
					   <div class="form-group col-4">
						  
						    <label for="exampleInputEmail1" class="form-label">N° Expediente</label>
						    <input type="text" class="form-control" name="codigoExpe" id="idCodigoExpe" readonly> 
			
					
					  </div>
					  <div class="form-group col-4">
					  	<label for="exampleInputEmail1" class="form-label">Buscar</label>
							    <button type="button" id="BuscarOficio"class="btn btn-dark"  
							    data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="border: 5px; font-size:13px" >
									Buscar Expediente
								</button>
					
						</div>
					  
					  <div class="form-group col-4">
			 			  <label for="exampleInputEmail1" class="form-label">Codigo</label>
					    <input type="text" class="form-control" name="codSoloMemo" id="idcodSoloMemo"  readonly value=0 >
					  	
    
					  </div>
					 <div class="form-group col-4">
			 			  <label for="exampleInputEmail1" class="form-label">N° Memorando</label>
					    <input type="text" class="form-control" name="codMemorando" id="idNumMemorando"  readonly >
					  	
    
					  </div>
					  <div class="form-group col-4">
					    <label for="exampleInputEmail1" class="form-label">Fecha Registro</label>
					    <input type="date" class="form-control" name="fechaRegistro" id="idFechaRegistro">
						
					    
					  </div>
					   <div class="form-group col-6">
					    <label for="exampleInputEmail1" class="form-label">Nombre Gerente</label>
					    <input type="text" class="form-control" name="nomGerente" id="idNomGerente">
					   
					  </div>
					  <div class="form-group col-4">
					    <label for="exampleInputEmail1" class="form-label">Asunto</label>
					    <input type="text" class="form-control" name="asunto" id="idAsunto">
					    
					  </div>
					  <div class="form-group" style="margin-top: 5px;">
					    <label for="exampleInputEmail1" class="form-label">Mensaje</label>
					 
					      <textarea class="form-control" placeholder="Leave a comment here" name="mens" id="idMensa"></textarea>
					   
					  </div>
			  		
					  
					  <div class="modal-footer">
				  	<button type="submit" class="btn btn-primary">Guardar</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
			     	 </div>
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
						      <div class="modal-header" style="color:black;background-color: #D6DBDF;">
						        <h5 class="modal-title" id="staticBackdropLabel">BUSCAR EXPEDIENTE</h5>
						              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      
						      </div>
						      <form class="form-horizontal" role="form" id="form-agregar">
    							<div class="modal-body"> 
										<table id="example2" class="table table-striped" style="width:100%">
									 	   <thead class="table-dark" style="opacity:0.6;">
											   <tr>
									               <th>N°Expediente</th>
									                <th>Fecha Registro</th>
									                <th>Última Actualización</th>
									                <th>Secretaria</th>
									                <th>Estado</th>
				                
				              						<th>Acciones</th>
									               
									            </tr>
											  </thead>
									  <tbody>
							        	<c:forEach items="${requestScope.buscarExpedientes}" var="row">
									            <tr>
									            
									               <td>${row.codExpediente}</td>
									                <td>${row.fechaExpe}</td>
									                <td>${row.fechaSalida}</td>
									                <td>${row.nomSecretria}</td>
									                <td>${row.estadoExpe}</td>
				
									               
									               
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
				 
				
		
	</div>
	


		
	
	<!-- SCRIPT -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script>
	generarCodigo();
	
	function generarCodigo(){
		$.get("ServletMemorando?tipo=CODIGO",function(response){
			$("#idNumMemorando").val(response);		
		})
		
	}
	$(document).ready(function() {
		$('#example').DataTable();
		 $('#example2').DataTable();
	
	});
	
	$(document).on('click', '#ejemplo', function() {
	    $('#staticBackdrop').modal('show');
	});
	
	$(document).on('click', '#BuscarOficio', function() {
	    $('#modalBuscarOfi').modal('show');
	});

	//aisgnar evento click a todos los botones con nombre de clase "btn-success"
	$(document).on("click",".btn-success",function(){
		//variables
		let cod;
		cod=$(this).parents("tr").find("td")[1].innerHTML;
		
		$.get("ServletMemorandoJSON?codigo="+cod,function(response){
			$("#idcodSoloMemo").val(response.codigoMemorando);
			$("#idNumMemorando").val(cod);
			$("#idFechaRegistro").val(response.fechMemo);
			$("#idAsunto").val(response.asuntMemo);
			$("#idNomGerente").val(response.nomGere);
			$("#idCodigoExpe").val(response.codExpe);
			$("#idMensa").val(response.mens);

			
		})
	})	
	
	
	
	//aisgnar evento click a todos los botones con nombre de clase "btn-success"
	$(document).on("click",".enviarCodigo",function(){
		//variables
		let cod;
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		
		$.get("ServletExpedienteJSON?codigo="+cod,function(response){
			$("#idCodigoExpe").val(cod);
			
		})
		
	})


</script>

<!-- SCRIPT DE VALIDACIÓN DE REGISTRAR OFICIO  --> 
<script type="text/javascript">    
    $(document).ready(function(){     
        $('#idRegistrarOficio').bootstrapValidator({      
        	 fields:{
        		 asunto:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[a-zA-Z\ñ\Ñ\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú]{3,70}$/,
    		 				message:'Ingrese solo letras'
    		 			}
    		 			
    		 		}
    		 	},
    		 	nomGerente:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[a-zA-Z\ñ\Ñ\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú]{3,70}$/,
    		 				message:'Ingrese solo letras'
    		 			}
    		 			
    		 		}
    		 	},
     		 	mens:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			}
    		 		}
    		 	}
    		 	
        	 }
        });   
			
    });  
</script>



</body>
</html>