package com.contrato.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.contrato.entidad.Expediente;
import com.contrato.services.ExpedienteService;
import com.google.gson.Gson;

/**
 * Servlet implementation class ServletExpedienteJSON
 */
@WebServlet("/ServletExpedienteJSON")
public class ServletExpedienteJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletExpedienteJSON() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PASO 0: recuperar el par�metro "codigo" que viene del bot�n editar
				String cod=request.getParameter("codigo");
				//PASO 1: invocar al m�todo buscarPorId
				Expediente lista=new ExpedienteService().buscarPorId(Integer.parseInt(cod));
 
				//PASO 2: crear objeto de la clase Gson
						Gson gson=new Gson();
						//PASO 3: generar json del arreglo "lista" en formato String
						String json=gson.toJson(lista);
						//PASO 4: mostrar el valor de la variable "json" en formato JSON verdadero
						response.setContentType("application/json;charset=UTF-8");
						PrintWriter salida=response.getWriter();
						salida.println(json);
	}

}
