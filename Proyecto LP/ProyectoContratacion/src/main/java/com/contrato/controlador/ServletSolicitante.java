package com.contrato.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.contrato.entidad.Solicitante;
import com.contrato.services.SolicitanteService;


/**
 * Servlet implementation class ServletSolicitante
 */
@WebServlet("/ServletSolicitante")
public class ServletSolicitante extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SolicitanteService servicioSoli;
           /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSolicitante() {
        super();
        servicioSoli=new SolicitanteService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ACCIONES
				String accion;
				accion=request.getParameter("tipo");
				if(accion.equals("LISTAR")) {
					listarSolicitante(request,response);
				}
				else if(accion.equals("REGISTRAR")) {
					registrarSolicitante(request,response);
				}
				else if(accion.equals("ELIMINAR")) {
					eliminarSolicitante(request,response);
				}

	
	}

	private void eliminarSolicitante(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//leer caja con atributo name "codigoEliminar"	
				String cod;
				cod=request.getParameter("codigoEliminar");
				//invocar al m�todo delete y enviar la variable "cod"
				int salida;
				salida=servicioSoli.eliminarPorId(Integer.parseInt(cod));
				//validar
				if(salida>0) {
					request.setAttribute("MENSAJE", "Docente eliminado correctamente");
					listarSolicitante(request, response);
				}
				else {
					request.setAttribute("MENSAJE", "Error en la eliminaci�n");
					listarSolicitante(request, response);
				}
				
				

		
	}

	private void registrarSolicitante(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Creacion de variables y leer controles de solicitante.jsp
		String codigoSoli,nombreSoli,apellidosSoli,dniSoli,distritoSoli,direccionSoli,celularSoli,sexoSoli,areaSoli,fechaSoli,expeSoli;
	
		codigoSoli=request.getParameter("codigo");
		nombreSoli=request.getParameter("nomSoli");
		apellidosSoli=request.getParameter("apeSoli");
		dniSoli=request.getParameter("dniSoli");
		distritoSoli=request.getParameter("disSoli");
		direccionSoli=request.getParameter("direSoli");
		celularSoli=request.getParameter("celSoli");
		sexoSoli=request.getParameter("sexo");
		areaSoli=request.getParameter("areSoli");
		fechaSoli=request.getParameter("fechSoli");
		expeSoli=request.getParameter("expeSoli");

		//Creacion de objeto
		Solicitante bean=new Solicitante();
		//Set, no va codigo
		bean.setNomSoli(nombreSoli);
		bean.setApeSoli(apellidosSoli);
		bean.setDniSoli(Integer.parseInt(dniSoli));
		bean.setDistrito(distritoSoli);
		bean.setDireccSoli(direccionSoli);
		bean.setCeluSoli(Integer.parseInt(celularSoli));
		bean.setSexo(sexoSoli);
		bean.setArea(areaSoli);
		bean.setFechaSoli(fechaSoli);
		bean.setExpe(expeSoli);

				//invocar al m�todo save
		/*int salida;
		salida=solicitanteDAO.save(bean);
		//validar
		if(salida>0) {
			//direccionar a la p�gina "docente.jsp" y enviar el par�metro "MENSAJE" con el valor de �xito
			//response.sendRedirect("docente.jsp?MENSAJE=Docente registrado correctamente");
			request.setAttribute("MENSAJE", "Docente registrado correctamente");
			listarSolicitante(request, response);
		}
		else {
			
			//direccionar a la p�gina "docente.jsp" y enviar el par�metro "MENSAJE" con el valor de error en el registro
			//response.sendRedirect("docente.jsp?MENSAJE=Error en el registro de Docente");
			
		}*/
		if(Integer.parseInt(codigoSoli)==0) {
			//invocar al m�todo save
			int resultado;
			resultado=servicioSoli.registrar(bean);
			//validar
			if(resultado>0) {
				
				request.setAttribute("MENSAJE", "Solicitante registrado correctamente");
				listarSolicitante(request, response);
			}
			else {
				request.setAttribute("MENSAJE", "Error en el registro de docente");
				listarSolicitante(request, response);
			}
		}
		else {
			//setear atributo codigo
			bean.setCodSoli(Integer.parseInt(codigoSoli));
		
			//invocar al m�todo update
			int resultado;
			resultado=servicioSoli.actualizar(bean);
			//validar
			if(resultado>0) {
				request.setAttribute("MENSAJE", "Solicitante actualizado correctamente");
				listarSolicitante(request, response);
			}
			else {
				request.setAttribute("MENSAJE", "Error en la actualizaci�n");
				listarSolicitante(request, response);
			}
		}


		
	}

	private void listarSolicitante(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Invocamos al m�todo
				List<Solicitante> dataSoli=servicioSoli.listarTodos();
				//listSolicitante almacenar� el arreglo de objetos data
				request.setAttribute("listaSolicitantes",dataSoli);
				//Direccionar a solicitante.jsp
				request.getRequestDispatcher("/solicitante.jsp").forward(request, response);

		
	}

}
