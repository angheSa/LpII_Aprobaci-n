package com.contrato.controlador;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.google.gson.Gson;

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
		
		
		else if(acciones.equals("CODIGO")) {
			codigoExpediente(request,response);
		}
		
		else if(acciones.equals("LISTARCONSULTAR")) {
			listarConsultar(request,response);
		}
		

		
}

	


	private void listarConsultar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/consultarExpediente.jsp").forward(request, response);
		
	}

	

	private void codigoExpediente(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String num;
		num=servicioExpe.codigoExpediente();
		//PASO 2: crear objeto de la clase Gson
		Gson gson=new Gson();
		//PASO 3: generar json del arreglo "lista" en formato String
		String json=gson.toJson(num);
		//PASO 4: mostrar el valor de la variable "json" en formato JSON verdadero
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);
	}
	

	private void registrarExpediente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Creacion de variables y leer controles de expediente.jsp
		String codigoGeneral,codExpe,fechExpe,fechSali,nomSecre,estado,codOfi,mens;
		codigoGeneral=request.getParameter("codSoloExpe");
		codExpe=request.getParameter("expediente");
		fechExpe=request.getParameter("fechaExpediente");
		fechSali=request.getParameter("fechaSalida");
		nomSecre=request.getParameter("nomSecre");
		estado=request.getParameter("estado");
		codOfi=request.getParameter("codigoOficio");
		mens= request.getParameter("mensa");
		
		//Creacion de objeto
		Expediente bean=new Expediente();
		bean.setCodigoExpediente(Integer.parseInt(codigoGeneral));
		bean.setCodExpediente(codExpe);
		bean.setFechaExpe(fechExpe);
		bean.setFechaSalida(fechSali);
		bean.setNomSecretria(nomSecre);
		bean.setEstadoExpe(estado);
		bean.setCodOficio(codOfi);
		bean.setMens(mens);
		
		
		//Realizar validacion de acuerdo al codigo expediente
			
			//invocar al m�todo save
		if(Integer.parseInt(codigoGeneral)==0) {
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
			else{
					
				//invocar al m�todo update
				int result;
				result=servicioExpe.actualizar(bean);
				//validar
				if(result>0) {
					request.setAttribute("MENSAJE", "El expediente se actualiz�");
					listarConsultar(request, response);
				}
				else {
					request.setAttribute("MENSAJE", "Error en la actualizaci�n del expediente");
					listarConsultar(request, response);

				}
			}
		
	}

	private void listarExpediente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Invocamos al m�todo
		List<Expediente> data=servicioExpe.listExpedientes();
		
		request.setAttribute("listExpediente", data);
		List<Oficio> dataSoli=servicioOfi.listOficios();
		request.setAttribute("buscarOficios",dataSoli);
		//Direccionar a oficio.jsp
		request.getRequestDispatcher("/expediente.jsp").forward(request, response);
	}

}
