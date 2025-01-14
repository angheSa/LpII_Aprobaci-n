package com.contrato.controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.contrato.entidad.Menu;
import com.contrato.entidad.Usuario;
import com.contrato.services.UsuarioService;

/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private UsuarioService servicio=new UsuarioService();
		
		
	    public ServletUsuario() {
	        super();
	    }
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String accion;
			accion=request.getParameter("tipo");
			if(accion.equals("INICIAR"))
				sesionDelUsuario(request,response);
			else if(accion.equals("CERRAR"))
				cerrarSesionDelUsuario(request,response);
			
		}
		private void cerrarSesionDelUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//recuperar sesesi�n actual
			HttpSession session=request.getSession();
			//invalidar sesi�n "destruir todos los atributos de tipo session"
			session.invalidate();
			request.setAttribute("MENSAJE", "Sesi�n terminada");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			
		}
		private void sesionDelUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//recuperar valores de las cajas
			String vLogin,vClave;
			vLogin=request.getParameter("usuario");
			vClave=request.getParameter("clave");
			//invocar al m�todo loginUsuario
			Usuario bean=servicio.loginUsuario(vLogin, vClave);
			//validar bean
			if(bean==null) {//usuario y/o clave incorrectos
				request.setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
			else {//todo ok
				//invocar al m�todo menuDelUsuario
				List<Menu> data=servicio.menuDelUsuario(bean.getCodigo());
				//crear atributo de tipo sesi�n
				HttpSession session=request.getSession();
				session.setAttribute("LISTA", data);
				request.getRequestDispatcher("/menu.jsp").forward(request, response);
			}
			
			
			
		}
}
