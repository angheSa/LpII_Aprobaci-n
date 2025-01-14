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
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">


<style>
	.soli{
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
	.soliDos{
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
		<!-- Text Gestionar Solicitante-->
			<h1>Gestionar Solicitante</h1>
			<c:if test="${requestScope.MENSAJE!=null}">
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
				  <strong>MENSAJE : </strong> ${requestScope.MENSAJE} 
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				
			</c:if>
		<!-- Nuevo Solicitantey Criterios de B�squeda -->
		<div class="soli d-flex justify-content-between align-items-center">
		
		<button type="button" id ="ejemplo"class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		  <img src="img/editar2.png" class="am">Registrar Solicitante
		</button>
			
			
	    </div>
	        
	        <!-- tabla -->
  		<div class="soliDos">
  			<div class="mt-4">
		<table id="example" class="table table-striped" style="width:100%">
				   <thead class="table-dark" style="opacity:0.6;">
					   <tr>
			                <th>C�digo</th>        
			                <th>Nombre</th>
			                <th>Apellidos</th>
			                <th>DNI</th>
			                <th>Distrito</th>
			                <!-- <th>Direcci�n</th>
			                <th>Celular</th>
			                <th>Sexo</th> --> 
			                
			                <th>�rea</th> 
			                <th>Fecha</th>
			                <th>Experiencia</th>
			                <th></th>
			                <th></th>
			            
		            </tr>
				  </thead>
				  <tbody>
		        	<c:forEach items="${requestScope.listaSolicitantes}" var="row">
				            <tr>
				                <td>${row.codSoli}</td>
				                <td>${row.nomSoli}</td>
				                <td>${row.apeSoli}</td>
				                <td>${row.dniSoli}</td>
				                <td>${row.distrito}</td> 
				                     
				                <td>${row.area}</td>
				                <td>${row.fechaSoli}</td>
				                <td>${row.expe}</td>
				                <td><button type="button" class="btn btn-success" 
				                			data-bs-toggle="modal" data-bs-target="#staticBackdrop"><img src="img/editar2.png"></button></td>
				                <td><button type="button" class="btn btn-danger" 
				                			data-bs-toggle="modal" data-bs-target="#modalEliminar"><img src="img/eliminar.png"></button></td>
				          		 <!-- <td>${row.direccSoli}</td> 
				                <td>${row.celuSoli}</td> 
				                <td>${row.sexo}</td>      -->   
				          </tr>
				       </c:forEach>             
		        </tbody>
			</table>
  		</div>
	</div>

 
 <!-- MODAL PARA REGISTRAR-->
	<div class="modal fade" id="staticBackdrop" aria-hidden="true" aria-labelledby="staticBackdropLabel" tabindex="-1">
		  <div class="modal-dialog modal-lg modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header"style="color:black;background-color: #884EA0;">
		        <h5 class="modal-title" id="#staticBackdropLabel"> REGISTRAR SOLICITANTE</h5>
		     <!-- >tyle="#FAF8F2
				style="color:blue; background-color:#FAF8F2;"-->
		      </div> 
		      <div class="modal-body">
		        
		        <form id="idRegistrarSoli" method="post" action="ServletSolicitante?tipo=REGISTRAR">
					  
					  <div class="form-group">
					    <label for="exampleInputEmail1" class="form-label">C�digo</label>
					    <input type="text" class="form-control" name="codigo" id="idCodigo" readonly value=0>
					    
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1" class="form-label">Nombre</label>
					    <input type="text" class="form-control" name="nomSoli" id="idNomSoli">
					    
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1" class="form-label">Apellidos</label>
					    <input type="text" class="form-control" name="apeSoli" id="idApeSoli"> 
					    
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1" class="form-label">DNI</label>
					    <input type="text" class="form-control" name="dniSoli" id="idDniSoli">
					   
					  </div>
					  
					   <div class="form-group">
					    <label for="exampleInputEmail1" class="form-label">Distrito</label>
					    <input type="text" class="form-control" name="disSoli" id="idDisSoli">
					   
					  </div>
					   <div class="form-group">
					    <label for="exampleInputEmail1" class="form-label">Direcci�n</label>
					    <input type="text" class="form-control" name="direSoli" id="idDireSoli">
					   
					  </div>
					   <div class="form-group">
					    <label for="exampleInputEmail1" class="form-label">Celular</label>
					    <input type="text" class="form-control" name="celSoli" id="idCelSoli">
					   
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1" class="form-label">Sexo</label>
					    <select class="form-select" name="sexo" id="idSexo">
						  <option value="" selected>[Seleccione Sexo]</option>
						  <option value="Femenino">Femenino</option>
						  <option value="Masculino">Masculino</option>
						</select>
					  </div>
					   <div class="form-group">
					    <label for="exampleInputEmail1" class="form-label">�rea</label>
					    <input type="text" class="form-control" name="areSoli" id="idAreSoli">
					   
					  </div>
					   <div class="form-group">
					    <label for="exampleInputEmail1" class="form-label">Fecha : 'YYYY-MM-DD'</label>
					    <input type="text" class="form-control" name="fechSoli" id="idFechSoli">
					   
					  </div>
			
					  <div class="form-group">
					    <label for="exampleInputPassword1" class="form-label">Experiencia</label>
					    <select class="form-select" name="expeSoli" id="idExpeSoli">
						  <option value="" selected>[Seleccione]</option>
						  <option value="SI">SI</option>
						  <option value="NO">NO</option>
						</select>
					  </div>
					  
					  <div class="modal-footer">
				  	<button type="submit" class="btn btn-primary">Guardar</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
			     	 </div>
					  		
					  
				</form>
		        
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- MODAL PARA ELIMINAR -->

		<div class="modal fade" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header" style="color:black;background-color: #884EA0;">
		        <h5 class="modal-title" id="staticBackdropLabel">Eliminar Solicitante</h5>
		      </div>
		      <div class="modal-body">
		        <form id="idRegistrarOficio" method="post" action="ServletSolicitante?tipo=ELIMINAR">
				    <input type="hidden" class="form-control" name="codigoEliminar" id="codigoEliminar">
				  <h4>�Seguro de eliminar el solicitante?</h4>
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
    //Ocultar los campos 4,5,6
  
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
	
	$.get("ServletSolicitanteJSON?codigo="+cod,function(response){
		$("#idCodigo").val(cod);
		$("#idNomSoli").val(response.nomSoli);
		$("#idApeSoli").val(response.apeSoli);
		$("#idDniSoli").val(response.dniSoli);
		$("#idDisSoli").val(response.distrito);
		$("#idDireSoli").val(response.direccSoli);
		$("#idCelSoli").val(response.celuSoli);
		$("#idSexo").val(response.sexo);
		$("#idAreSoli").val(response.area);
		$("#idFechSoli").val(response.fechaSoli);
		$("#idExpeSoli").val(response.expe);		
	})

	
	
	
	
})	
</script>


<!-- SCRIPT DE VALIDACI�N DE REGISTRAR OFICIO -->
<script type="text/javascript">    
    $(document).ready(function(){     
        $('#idRegistrarSoli').bootstrapValidator({      
        	fields:{
        		nomSoli:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[a-zA-Z\�\�\s\�\�\�\�\�\�\�\�\�\�]{3,50}$/,
    		 				message:'Ingrese solo letras'
    		 			}
    		 		}
    		 	},
    		 	apeSoli:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[a-zA-Z\�\�\s\�\�\�\�\�\�\�\�\�\�]{3,40}$/,
    		 				message:'Ingrese solo letras'
    		 			}
    		 		}
    		 	},
    		 	dniSoli:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[0-9]{8}$/,
    		 				message:'Ingrese solo 8 d�gitos'
    		 			}
    		 		}
    		 	},
    		 	disSoli:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[a-zA-Z\�\�\s\�\�\�\�\�\�\�\�\�\�]{3,20}$/,
    		 				message:'Ingrese solo letras'
    		 			}
    		 		}
    		 	},
    		 	
    		 	direSoli:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[0-9a-zA-Z\s\.]{4,40}$/,
    		 				
    		 				message:'Ingrese m�nimo 4 caracteres '
    		 			}
    		 		}
    		 	},
    		 	celSoli:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[0-9]{9}$/,
    		 				message:'Ingrese solo 9 d�gitos'
    		 			}
    		 		}
    		 	},
    		 	sexo:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			}
    		 			
    		 		}
    		 	},
    	
    		 	
    		 	areSoli:{
    		 		validators:{
    		 			notEmpty:{
    		 				message:'Es obligatorio este campo'
    		 			},
    		 			regexp:{
    		 				regexp:/^[a-zA-Z\�\�\s\�\�\�\�\�\�\�\�\�\�]{3,40}$/,
    		 				message:'Ingrese solo letras'
    		 			}
    		 		}
    		 	},
    		 	fechSoli:{
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
    		 	
    		 	expeSoli:{
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