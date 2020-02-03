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


@WebServlet("/SvltLoadMaster")
public class SvltLoadMaster extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SvltLoadMaster() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
		//busco si inicio sesion correctamente
		HttpSession session= request.getSession();
		EntLogin login=new EntLogin(session.getAttribute("usuario").toString(), session.getAttribute("contrasena").toString());
		
		if(login.getUsuario()!=null && login.getContrasena()!=null && login.getUsuario()!="" && login.getContrasena()!="")
		{
		if(login.getUsuario().equals("admin") && login.getContrasena().equals("admin"))
		{
				request.setAttribute("navUser", "none");
				request.setAttribute("navAdmin", "block");			
		}
		else {
			if(NegLogin.validarIngreso(login))
			{
					request.setAttribute("navUser", "block");
					request.setAttribute("navAdmin", "none");				
			}
			else
			{
		    	RequestDispatcher rd= request.getRequestDispatcher("Login.jsp");
		    	rd.forward(request, response);
			}
		}
		}
		else
		{
    	RequestDispatcher rd= request.getRequestDispatcher("Login.jsp");
    	rd.forward(request, response);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
	}

}
