package sevlets;

import java.io.IOException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.NegValidaciones;

/**
 * Servlet implementation class sltValidaciones
 */
@WebServlet("/SvltValidaciones")
public class SvltLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SvltLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user=request.getParameter("txtUser");
		String pass=request.getParameter("txtPass");
		//creo cookie
    	Cookie loginCookie = null;
    	//obtengo cookies
    	Cookie[] cookies = request.getCookies();
    	response.setContentType("text/html");
		
    	if(request.getParameter("btnIniciar")!=null)
    	{
    	
		if(NegValidaciones.validarNulo(user))
		{
			if(NegValidaciones.validarNulo(pass))
			{
				//si es admin
				if(user.equals("admin"))
				{
					if(pass.equals("admin")) {
					//busco la cookie
					loginCookie=NegValidaciones.buscarCookie(cookies, "admin");
					
			    	//si la cookie no es nula
			    	if(loginCookie != null)
			    	{							    	
			    		//le agrego duracion y la cargo
			    		loginCookie.setValue("ok");
			    		loginCookie.setMaxAge(7200);
			        	response.addCookie(loginCookie);
			    	}
			    	//si no existe la crea
			    	else
			    	{
			    		loginCookie= new Cookie("admin","ok");
			    		loginCookie.setMaxAge(7200);
			        	response.addCookie(loginCookie);
			    	}
					
//			    	request.setAttribute(user, loginCookie);
//			    	RequestDispatcher rd= request.getRequestDispatcher("MasterPage");
					response.sendRedirect("MasterPage.jsp");
//			    	rd.forward(request, response);
					}
				}
				
				//si es un profesor
				else
				{
					if(user.equals("user") && pass.equals("user")) 
					{
						//busco la cookie
						loginCookie=NegValidaciones.buscarCookie(cookies, "user");
						
				    	//si la cookie no es nula
				    	if(loginCookie != null)
				    	{							    	
				    		//le agrego duracion y la cargo
				    		loginCookie.setValue("ok");
				    		loginCookie.setMaxAge(7200);
				        	response.addCookie(loginCookie);
				    	}
				    	//si no existe la crea
				    	else
				    	{
				    		loginCookie= new Cookie("user","ok");
				    		loginCookie.setMaxAge(7200);
				        	response.addCookie(loginCookie);
				    	}
						
//				    	request.setAttribute(user, loginCookie);
//				    	RequestDispatcher rd= request.getRequestDispatcher("MasterPage");
						response.sendRedirect("MasterPage.jsp");
//				    	rd.forward(request, response);
					}
												
				}
			} 
			}
    	}

    		response.sendRedirect("Login.jsp");
	}

}
