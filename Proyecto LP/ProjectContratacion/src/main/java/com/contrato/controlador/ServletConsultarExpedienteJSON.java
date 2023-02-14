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
import com.contrato.services.ExpedienteService;
import com.google.gson.Gson;

/**
 * Servlet implementation class ServletConsultarExpedienteJSON
 */
@WebServlet("/ServletConsultarExpedienteJSON")
public class ServletConsultarExpedienteJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletConsultarExpedienteJSON() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String esta=request.getParameter("estad");
		
		List<Expediente> lista=new ExpedienteService().listarExpedienteporEstado(esta);
		Gson gson=new Gson();
		String json=gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);	

	}

}
