package com.contrato.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.contrato.entidad.Expediente;
import com.contrato.entidad.Oficio;
import com.contrato.services.ExpedienteService;
import com.contrato.services.OficioService;

/**
 * Servlet implementation class ServletExpediente
 */
@WebServlet("/ServletExpediente")
public class ServletExpediente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ExpedienteService servicioExpe;
	private OficioService servicioOfi;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletExpediente() {
        super();
        servicioExpe=new ExpedienteService();

        servicioOfi=new OficioService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ACCIONES
		String acciones;
		acciones=request.getParameter("tipo");
		if(acciones.equals("LISTAR")) {
			listarExpediente(request,response);
		}
		else if(acciones.equals("REGISTRAR")) {
			registrarExpediente(request,response);
		}
		else if(acciones.equals("ELIMINAR")) {
			eliminarExpediente(request,response);
		}
	}

	private void eliminarExpediente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//leer caja con atributo name "codigoEliminar"
		String cod;
		cod=request.getParameter("codigoEliminar");
		//invocar al método delete y enviar la variable "cod"
		int salida;
		
		salida=servicioExpe.eliminarPorId(Integer.parseInt(cod));
		//validar
		if(salida>0) {
			
			request.setAttribute("MENSAJE", "El expediente se eliminó");
			listarExpediente(request, response);
		}
		else {
			request.setAttribute("MENSAJE", "Error en la eliminación del expediente");
			listarExpediente(request, response);
		}
		
	}

	private void registrarExpediente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Creacion de variables y leer controles de expediente.jsp
		String codExpe,fechExpe,contrato,nomSecre,estado,codOfi;
		
		codExpe=request.getParameter("expediente");
		fechExpe=request.getParameter("fechaExpediente");
		contrato=request.getParameter("contrato");
		nomSecre=request.getParameter("nomSecre");
		estado=request.getParameter("estado");
		
		codOfi=request.getParameter("codigoOficio");
		
		//Creacion de objeto
		Expediente bean=new Expediente();
		
		bean.setFechaExpe(fechExpe);
		bean.setContratoTiempo(contrato);
		bean.setNomSecretria(nomSecre);
		bean.setEstadoExpe(estado);
		bean.setCodOficio(Integer.parseInt(codOfi));
		
		
		//Realizar validacion de acuerdo al codigo Oficio

		if(Integer.parseInt(codExpe)==0) {
			
			//invocar al método save
			int resultado;
			resultado=servicioExpe.registrar(bean);
			//validar
			if(resultado>0) {
				request.setAttribute("MENSAJE", "Expediente registrado correctamente");
				listarExpediente(request, response);
			}
			else {
				request.setAttribute("MENSAJE", "Error en el registro del expediente");
				listarExpediente(request, response);
				}
			
		}
		else {
		
			bean.setCodExpediente(Integer.parseInt(codExpe));
		
			//invocar al método update
			int resultado;
			resultado=servicioExpe.actualizar(bean);
			//validar
			if(resultado>0) {
				request.setAttribute("MENSAJE", "El expediente se actualizó");
				listarExpediente(request, response);

			}
			else {
				request.setAttribute("MENSAJE", "Error en la actualización del expediente");
				listarExpediente(request, response);

			}
		}
	}

	private void listarExpediente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Invocamos al método
		List<Expediente> data=servicioExpe.listExpedientes();
		//listOficio almacenará el arreglo de objetos data
		request.setAttribute("listExpediente", data);
		List<Oficio> dataSoli=servicioOfi.listOficios();
		//listSolicitante almacenará el arreglo de objetos data
		request.setAttribute("buscarOficios",dataSoli);
		//Direccionar a oficio.jsp
		request.getRequestDispatcher("/expediente.jsp").forward(request, response);
	}

}
