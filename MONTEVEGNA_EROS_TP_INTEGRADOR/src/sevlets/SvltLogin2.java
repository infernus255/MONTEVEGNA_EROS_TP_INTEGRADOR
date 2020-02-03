package sevlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidad.EntLogin;
import negocio.NegLogin;

/**
 * Servlet implementation class SvltLogin2
 */
@WebServlet("/SvltLogin2")
public class SvltLogin2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SvltLogin2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		try {
			

		
		EntLogin login=new EntLogin(request.getParameter("txtUser"), request.getParameter("txtPass"));
		
		
    	if(request.getParameter("btnIniciar")!=null)
    	{
    	

					//si es admin
					if(login.getUsuario().equals("admin") && login.getContrasena().equals("admin"))
					{
						//lo mando por session
						HttpSession session= request.getSession();
						session.setAttribute("usuario", login.getUsuario());
						session.setAttribute("contrasena", login.getContrasena());
						
//				    	request.setAttribute(user, pass);
				    	RequestDispatcher rd= request.getRequestDispatcher("MasterPage.jsp");
				    	rd.forward(request, response);
					}
					
					//si es profesor
					else
					{
						if(NegLogin.validarIngreso(login))
						{
							//lo mando por session
							HttpSession session= request.getSession();
							session.setAttribute("usuario", login.getUsuario());
							session.setAttribute("contrasena", login.getContrasena());
							
	//				    	request.setAttribute(user, pass);
					    	RequestDispatcher rd= request.getRequestDispatcher("MasterPage.jsp");
					    	rd.forward(request, response);
						}
						else 
						{			//lo mando por session
//						HttpSession session= request.getSession();
//						session.setAttribute("loginError", true);
							request.setAttribute("loginError","true");
					    	RequestDispatcher rd= request.getRequestDispatcher("Login.jsp");
					    	rd.forward(request, response);
						}

					}
//	    	request.setAttribute("loginError","true");
//	    	RequestDispatcher rd= request.getRequestDispatcher("Login.jsp");
//	    	rd.forward(request, response);

    	}
    	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
