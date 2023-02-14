package com.supervisor.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.supervisor.service.SupervisorService;

/**
 * Servlet implementation class ServletSupervisor
 */
@WebServlet("/ServletSupervisor")
public class ServletSupervisor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSupervisor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod=request.getParameter("codigo");
		int salida;
		salida=new SupervisorService().eliminarSupervisorPorCodigo(Integer.parseInt(cod));
		if(salida>0)
			response.sendRedirect("supervisor.jsp?MENSAJE=Supervisor eliminado");
		else
			response.sendRedirect("supervisor.jsp?MENSAJE=Error en la eliminacion");
	}

}
