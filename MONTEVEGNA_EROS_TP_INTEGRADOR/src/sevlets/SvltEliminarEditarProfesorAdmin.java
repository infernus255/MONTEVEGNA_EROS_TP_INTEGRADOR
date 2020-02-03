package sevlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NegProfesor;

/**
 * Servlet implementation class SvltEliminarEditarProfesorAdmin
 */
@WebServlet("/SvltEliminarEditarProfesorAdmin")
public class SvltEliminarEditarProfesorAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SvltEliminarEditarProfesorAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("btnEliminar")!=null)
		{
		String dni= request.getParameter("hfDni");
		if(dni!=null)
		{
		if(NegProfesor.eliminarProfesor(dni).equals("true"))
		{
			request.setAttribute("eliminado", "true");
	    	RequestDispatcher rd= request.getRequestDispatcher("ProfesoresAdmin.jsp");
	    	rd.forward(request, response);
		}
		else
		{
			request.setAttribute("eliminado", "false");
	    	RequestDispatcher rd= request.getRequestDispatcher("ProfesoresAdmin.jsp");
	    	rd.forward(request, response);
		}
		}
		}
		
		if(request.getParameter("btnEditar")!=null)
		{
			
	    	request.setAttribute("provinciaSelected", request.getParameter("hfProvincia"));
	    	request.setAttribute("localidadSelected", request.getParameter("hfLocalidad"));
	    	
	    	request.setAttribute("nombreSelected", request.getParameter("hfNombre"));
	    	request.setAttribute("apellidoSelected", request.getParameter("hfApellido"));
	    	request.setAttribute("dniSelected", request.getParameter("hfDni"));
	    	request.setAttribute("legajoSelected", request.getParameter("hfLegajo"));
	    	request.setAttribute("emailSelected", request.getParameter("hfEmail"));
	    	request.setAttribute("direccionSelected", request.getParameter("hfDireccion"));
	    	request.setAttribute("telefonoSelected", request.getParameter("hfTelefono"));
	    	request.setAttribute("fechaNacSelected", request.getParameter("hfFechaNac"));
			
			request.setAttribute("editando", "true");
	    	RequestDispatcher rd= request.getRequestDispatcher("ProfesoresAdmin.jsp");
	    	rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
