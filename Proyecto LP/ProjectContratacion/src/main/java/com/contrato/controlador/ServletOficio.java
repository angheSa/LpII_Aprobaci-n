package com.contrato.controlador;

import java.io.IOException;
import java.io.PrintWriter;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.contrato.entidad.Oficio;
import com.contrato.entidad.Solicitante;
import com.contrato.services.OficioService;
import com.contrato.services.SolicitanteService;
import com.google.gson.Gson;


/**
 * Servlet implementation class ServletOficio
 */
@WebServlet("/ServletOficio")
public class ServletOficio extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OficioService servicioOfi;
	private SolicitanteService servicioSoli;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletOficio() {
        super();
        servicioOfi=new OficioService();
        servicioSoli=new SolicitanteService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//ACCIONES
				String acciones;
				acciones=request.getParameter("tipo");
				if(acciones.equals("LISTAR")) {
					listarOficios(request,response);
				}
				else if(acciones.equals("REGISTRAR")) {
					registrarOficio(request,response);
				}
				
				else if(acciones.equals("CODIGO")) {
					codigoOficio(request,response);
				}
				
				
	}



	private void codigoOficio(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String num;
		num=servicioOfi.codigoOficio();
		//PASO 2: crear objeto de la clase Gson
		Gson gson=new Gson();
		//PASO 3: generar json del arreglo "lista" en formato String
		String json=gson.toJson(num);
		//PASO 4: mostrar el valor de la variable "json" en formato JSON verdadero
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);
	}

	

	private void registrarOficio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
				//Creacion de variables y leer controles de oficio.jsp
		
				String codOfi,fechOfi,asunOfi,nomSecre,codSoli,mens,codigoGeneral;
				codigoGeneral=request.getParameter("codSoloOfi");
				codOfi=request.getParameter("codOficio");
				fechOfi=request.getParameter("fechaOfi");
				asunOfi=request.getParameter("asunOfi");
				nomSecre=request.getParameter("nomSecre");
				codSoli=request.getParameter("codSoli");
				mens=request.getParameter("mensa");
				//Creacion de objeto
				Oficio bean=new Oficio();
				//Set
				bean.setCodigoOfico(Integer.parseInt(codigoGeneral));
				bean.setCodOfi(codOfi);
				bean.setCodSoli(Integer.parseInt(codSoli));
				bean.setFechaOfi(fechOfi);
				bean.setAsuntoOfi(asunOfi);
				bean.setNomSecre(nomSecre);
				
				bean.setMens(mens);
				
				//Realizar validacion de acuerdo al codigo Oficio
	
					//invocar al método save
				if(Integer.parseInt(codigoGeneral)==0) {
					int salida;
					salida=servicioOfi.registrar(bean);
					//validar
					if(salida>0) {
						request.setAttribute("MENSAJE", "Oficio registrado correctamente");
						listarOficios(request, response);
					}
					else {
						request.setAttribute("MENSAJE", "Error en el registro del oficio");
						listarOficios(request, response);
					}
				}	
					else {
					
						int result;
						result=servicioOfi.actualizar(bean);
						//validar
						if(result>0) {
							request.setAttribute("MENSAJE", "El Oficio se actualizó");
							listarOficios(request, response);
						}
						else {
							request.setAttribute("MENSAJE", "Error en la actualización del oficio");
							listarOficios(request, response);
						}
					
				}
			
				
					
		
	}

	private void listarOficios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//Invocamos al método
				List<Oficio> data=servicioOfi.listOficios();
				//listOficio almacenará el arreglo de objetos data
				request.setAttribute("listOficio", data);
				List<Solicitante> dataSoli=servicioSoli.listarTodos();
				//listSolicitante almacenará el arreglo de objetos data
				request.setAttribute("buscarSolicitantes",dataSoli);
				//Direccionar a oficio.jsp
				request.getRequestDispatcher("/oficio.jsp").forward(request, response);
		
	}

}
