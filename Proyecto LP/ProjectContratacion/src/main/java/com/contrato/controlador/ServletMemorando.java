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
import com.contrato.entidad.Memorando;
import com.contrato.services.ExpedienteService;
import com.contrato.services.MemorandoService;

import com.google.gson.Gson;



/**
 * Servlet implementation class ServletMemorando
 */
@WebServlet("/ServletMemorando")
public class ServletMemorando extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ExpedienteService servicioExpe;
	private MemorandoService servicioMemo;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMemorando() {
        super();
        servicioExpe=new ExpedienteService();

        servicioMemo=new MemorandoService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ACCIONES
				String acciones;
				acciones=request.getParameter("tipo");
				if(acciones.equals("LISTAR")) {
					listarMemorando(request,response);
				}
				else if(acciones.equals("REGISTRAR")) {
					registrarMemorando(request,response);
				}
				
					
				else if(acciones.equals("CODIGO")) {
					codigoMemorando(request,response);
				}
				
	}

	

	private void codigoMemorando(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String num;
		num=servicioMemo.codigoMemorando();
		//PASO 2: crear objeto de la clase Gson
		Gson gson=new Gson();
		//PASO 3: generar json del arreglo "lista" en formato String
		String json=gson.toJson(num);
		//PASO 4: mostrar el valor de la variable "json" en formato JSON verdadero
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);
		
	}

	private void registrarMemorando(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Creacion de variables y leer controles de memorando.jsp
		
				String codigoGeneral,codMemo,fechMemo,asuntMemo,nomGeren,codExp,mens;
				codigoGeneral=request.getParameter("codSoloMemo");
				codMemo=request.getParameter("codMemorando");
				fechMemo=request.getParameter("fechaRegistro");
				nomGeren=request.getParameter("nomGerente");
				asuntMemo=request.getParameter("asunto");
				
				codExp=request.getParameter("codigoExpe");
				mens=request.getParameter("mens");
				
				//Creacion de objeto
				Memorando bean=new Memorando();
				bean.setCodigoMemorando(Integer.parseInt(codigoGeneral));
				bean.setCodMemo(codMemo);
				bean.setFechMemo(fechMemo);
				bean.setAsuntMemo(asuntMemo);
				bean.setNomGere(nomGeren);
				bean.setCodExpe(codExp);
				bean.setMens(mens);
				
				
				//Realizar validacion de acuerdo al codigo memorando
				if(Integer.parseInt(codigoGeneral)==0) {
					//invocar al método save
					int salida;
					salida=servicioMemo.registrar(bean);
					//validar
					if(salida>0) {
						
						request.setAttribute("MENSAJE", "Memorando registrado correctamente");
						listarMemorando(request, response);
					}
					else {
						request.setAttribute("MENSAJE", "Error en el registro del memorando");
						listarMemorando(request, response);
					}
				}
					else {
						int result;
						result=servicioMemo.actualizar(bean);
						//validar
						if(result>0) {
							request.setAttribute("MENSAJE", "El Memorando se actualizó");
							listarMemorando(request, response);
						}
						else {
							request.setAttribute("MENSAJE", "Error en la actualización del Memorando");
							listarMemorando(request, response);
						}
					}
				
		
	}

	private void listarMemorando(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Invocamos al método
				List<Memorando> data=servicioMemo.listMemorandos();
				//listOficio almacenará el arreglo de objetos data
				request.setAttribute("listMemorando", data);
				List<Expediente> dataSoli=servicioExpe.listExpedientes();
				//listSolicitante almacenará el arreglo de objetos data
				request.setAttribute("buscarExpedientes",dataSoli);
				//Direccionar a memorando.jsp
				request.getRequestDispatcher("/memorandos.jsp").forward(request, response);
		
	}

}

















