package sevlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocio.NegValidaciones;

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
		
		String user=request.getParameter("txtUser");
		String pass=request.getParameter("txtPass");
		
    	if(request.getParameter("btnIniciar")!=null)
    	{
    	
			if(NegValidaciones.validarNulo(user))
			{
				if(NegValidaciones.validarNulo(pass))
				{
					//si es admin
					if(user.equals("admin") && pass.equals("admin"))
					{
						//lo mando por session
						HttpSession session= request.getSession();
						session.setAttribute(user, pass);
						
				    	request.setAttribute(user, pass);
				    	RequestDispatcher rd= request.getRequestDispatcher("MasterPage.jsp");
				    	rd.forward(request, response);
					}
					
					//si es profesor
					if(user.equals("user") && pass.equals("user"))
					{
						//lo mando por session
						HttpSession session= request.getSession();
						session.setAttribute(user, pass);
						
				    	request.setAttribute(user, pass);
				    	RequestDispatcher rd= request.getRequestDispatcher("MasterPage.jsp");
				    	rd.forward(request, response);
					}
				}
			}
    	}
    	
    	RequestDispatcher rd= request.getRequestDispatcher("Login.jsp");
    	rd.forward(request, response);
	}

}
