package com.contrato.controlador;

import java.io.IOException;
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
				else if(acciones.equals("ELIMINAR")) {
					eliminarOficio(request,response);
				}
				
	}

	

	private void eliminarOficio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//leer caja con atributo name "codigoEliminar"
				String cod;
				cod=request.getParameter("codigoEliminar");
				//invocar al m�todo delete y enviar la variable "cod"
				int salida;
				
				salida=servicioOfi.eliminarPorId(Integer.parseInt(cod));
				//validar
				if(salida>0) {
					
					request.setAttribute("MENSAJE", "El oficio se elimin�");
					listarOficios(request, response);
				}
				else {
					request.setAttribute("MENSAJE", "Error en la eliminaci�n del oficio");
					listarOficios(request, response);
				}
				 	
		
	}

	private void registrarOficio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//Creacion de variables y leer controles de oficio.jsp
				String codOfi,fechOfi,asunOfi,nomSecre,codSoli;
				
				codOfi=request.getParameter("codOficio");
				fechOfi=request.getParameter("fechaOfi");
				asunOfi=request.getParameter("asunOfi");
				nomSecre=request.getParameter("nomSecre");
				codSoli=request.getParameter("codSoli");
				
				//Creacion de objeto
				Oficio bean=new Oficio();
				//Set
				//bean.setCodOfi(codOfi);
				bean.setFechaOfi(fechOfi);
				bean.setAsuntoOfi(asunOfi);
				bean.setNomSecre(nomSecre);
				bean.setCodSoli(Integer.parseInt(codSoli));
				
				//Realizar validacion de acuerdo al codigo Oficio
		
				if(Integer.parseInt(codOfi)==0) {
					
					//invocar al m�todo save
					int resultado;
					resultado=servicioOfi.registrar(bean);
					//validar
					if(resultado>0) {
						request.setAttribute("MENSAJE", "Oficio registrado correctamente");
						listarOficios(request, response);
					}
					else {
						request.setAttribute("MENSAJE", "Error en el registro del oficio");
						listarOficios(request, response);
					}
					
				}
				else {
				
					bean.setCodOfi(Integer.parseInt(codOfi));
				
					//invocar al m�todo update
					int resultado;
					resultado=servicioOfi.actualizar(bean);
					//validar
					if(resultado>0) {
						request.setAttribute("MENSAJE", "El Oficio se actualiz�");
						listarOficios(request, response);
					}
					else {
						request.setAttribute("MENSAJE", "Error en la actualizaci�n del oficio");
						listarOficios(request, response);
					}
				}
		
	}

	private void listarOficios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//Invocamos al m�todo
				List<Oficio> data=servicioOfi.listOficios();
				//listOficio almacenar� el arreglo de objetos data
				request.setAttribute("listOficio", data);
				List<Solicitante> dataSoli=servicioSoli.listarTodos();
				//listSolicitante almacenar� el arreglo de objetos data
				request.setAttribute("buscarSolicitantes",dataSoli);
				//Direccionar a oficio.jsp
				request.getRequestDispatcher("/oficio.jsp").forward(request, response);
		
	}

}
