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
<title>Consulta</title>
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
	
	
</style>
</head>
<body>
	<!-- HTML -->
	<div class="container">
				<c:if test="${requestScope.MENSAJE!=null}">
							<div class="alert alert-success alert-dismissible fade show" role="alert">
							  <strong>MENSAJE : </strong> ${requestScope.MENSAJE} 
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							  
							</div>
				</c:if>
		<!-- Criterios de Búsqueda -->
		<div class="oficios">
			<form >
			   <div class="d-flex justify-content-around ">
					    <div class="d-flex ">
					       <label for="exampleInputPassword1">Consultar Expediente:</label>
					 
						    <select class="form-select" name="buscarExpe" id="idBUscarExpe">
								  <option value="" selected>[Seleccione]</option>
								  <option value="Sin revisar">Sin revisar</option>
								 
								  <option value="Conforme">Conforme</option>
							</select>	
						</div>
					    <div class="d-flex ">
					      <button type="button" class="btn btn-primary mb-2" id="btn-consultar">Consultar</button>
					    </div>
				  </div>
			</form>
  		</div>
  		
  		<!-- Seccion listado -->
  		<div class="oficiosDos">
  			<div class="mt-4">
			
		    	<table id="tablaExpe" class="table table-striped" style="width:100%">
				   <thead class="table-dark" style="opacity:0.6;">
				   <tr>
					    <th>Código</th>
		                <th>N°Expediente</th>
		                <th>Fecha Registro</th>
		                <th>Última Actualización</th>
		                <th>Secretaria</th>
		                <th>Estado</th>
		                
		                <th>Acciones</th>
		               
		            </tr>
				  </thead>
				  <tbody>
			        </tbody>
				</table>
	  		</div>
		</div>
		
		<!-- FORMULARIO PARA ACTUALIZAR -->
		
<div class="modal fade" id="staticBackdrop" aria-hidden="true" aria-labelledby="staticBackdropLabel" tabindex="-1">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header" style="color:black;background-color:#D6DBDF;">
		        <h5 class="modal-title" id="#staticBackdropLabel"> EXPEDIENTE</h5>
		     <!-- >tyle="#FAF8F2
				style="color:blue; background-color:#FAF8F2;"-->
		      </div> 
		      <div class="modal-body">
		        
		        <form id="idRegistrarOficio" method="post" action="ServletExpediente?tipo=REGISTRAR">
					   <div class="row justify-content-around">
					   <div class="form-group col-4">
						  
						    <label for="exampleInputEmail1" class="form-label">N° Oficio</label>
						    <input type="text" class="form-control" name="codigoOficio" id="idCodigoOfi" readonly> 
			
					
					  </div>
					  <div class="form-group col-4">
					  	<label for="exampleInputEmail1" class="form-label">Buscar</label>
							    <button type="button" id="BuscarOficio"class="btn btn-dark"  
							    data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="border: 5px; font-size:13px" >
									Buscar Oficio
								</button>
					
						</div>
					  
					  <div class="form-group col-4">
			 			  <label for="exampleInputEmail1" class="form-label">Codigo</label>
					    <input type="text" class="form-control" name="codSoloExpe" id="idcodSoloExpe"  readonly value=0 >
					  	
    
					  </div>
					 <div class="form-group col-4">
			 			  <label for="exampleInputEmail1" class="form-label">N° Expediente</label>
					    <input type="text" class="form-control" name="expediente" id="idExpediente"  readonly >
					  	
    
					  </div>
					  <div class="form-group col-4">
					    <label for="exampleInputEmail1" class="form-label">Fecha de ingreso </label>
					    <input type="date" class="form-control" name="fechaExpediente" id="idfechaExpediente" readonly>
						
					    
					  </div>
					  <div class="form-group col-4">
					    <label for="exampleInputEmail1" class="form-label">Última actualización </label>
					    <input type="date" class="form-control" name="fechaSalida" id="idfechaSalida">
					    
					  </div>
	
					  <div class="form-group col-4">
					    <label for="exampleInputEmail1" class="form-label">Nombre Secretaria</label>
					    <input type="text" class="form-control" name="nomSecre" id="idNomSecre" readonly>
					   
					  </div>
					  
					  <div class="form-group col-4">
					    <label for="exampleInputEmail1" class="form-label">Estado</label>
					   <select class="form-select" name="estado" id="idEstado">
						 <option value="" selected>Seleccione</option>
						  <option value="Sin revisar">Sin revisar</option>
						  
						  <option value="Conforme">Conforme</option>
						</select>
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
	
	
	</div>

	<!-- SCRIPT -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script>

	$(document).on("click","#btn-consultar",function(){
		let est;
		est=$("#idBUscarExpe").val();
		$("#tablaExpe tbody").empty();
		$.get("ServletConsultarExpedienteJSON?estad="+est,function(response){
			$.each(response,function(index,item){
				$("#tablaExpe").append("<tr><td>"+item.codigoExpediente+"</td><td>"+
						item.codExpediente+"</td><td>"+item.fechaExpe+"</td><td>"+
						item.fechaSalida+"</td><td>"+item.nomSecretria+"</td><td>"+
						item.estadoExpe+"</td><td>"+
						"<button type='button' class='btn btn-success'"+ 
            			"data-bs-toggle='modal' data-bs-target='#staticBackdrop'><img src='img/editar2.png'></button></td></tr>");
			}) 
		})
		
		//aisgnar evento click a todos los botones con nombre de clase "btn-success"
	$(document).on("click",".btn-success",function(){
		//variables
		let cod;
		cod=$(this).parents("tr").find("td")[1].innerHTML;
		
		$.get("ServletExpedienteJSON?codigo="+cod,function(response){
			$("#idcodSoloExpe").val(response.codigoExpediente);
			$("#idExpediente").val(cod);
			$("#idfechaExpediente").val(response.fechaExpe);
			$("#idfechaSalida").val(response.fechaSalida);
			$("#idNomSecre").val(response.nomSecretria);
			$("#idEstado").val(response.estadoExpe);
			$("#idCodigoOfi").val(response.codOficio);
			
	 })
})	
		
		/*<c:forEach items="${requestScope.listExpediente}" var="row">
				            <tr>
				                <td>${row.codigoExpediente}</td>
				                <td>${row.codExpediente}</td>
				                <td>${row.fechaExpe}</td>
				                <td>${row.fechaSalida}</td>
				                <td>${row.nomSecretria}</td>
				                <td>${row.estadoExpe}</td>
								
				                <td><button type="button" class="btn btn-success" 
				                			data-bs-toggle="modal" data-bs-target="#staticBackdrop"><img src="img/editar2.png"></button>
				               </td>
				          </tr>
				        </c:forEach>    */
	})	
	
	
</script>


</body>
</html>