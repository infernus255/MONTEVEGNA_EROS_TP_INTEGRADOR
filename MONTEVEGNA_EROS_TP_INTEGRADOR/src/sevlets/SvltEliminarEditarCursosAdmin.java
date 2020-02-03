package sevlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NegCurso;


/**
 * Servlet implementation class SvltEliminarEditarCursosAdmin
 */
@WebServlet("/SvltEliminarEditarCursosAdmin")
public class SvltEliminarEditarCursosAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SvltEliminarEditarCursosAdmin() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//al eliminar
		if(request.getParameter("btnEliminar")!=null)
		{
		String idCurso= request.getParameter("hfIdCurso");
		if(idCurso!=null)
		{
		if(NegCurso.eliminarCurso(idCurso).equals("true"))
		{
			request.setAttribute("eliminado", "true");
	    	RequestDispatcher rd= request.getRequestDispatcher("CursosAdmin.jsp");
	    	rd.forward(request, response);
		}
		else
		{
			request.setAttribute("eliminado", "false");
	    	RequestDispatcher rd= request.getRequestDispatcher("CursosAdmin.jsp");
	    	rd.forward(request, response);
		}
		}
		}
		
		//al editar
		if(request.getParameter("btnEditar")!=null)
		{
			
	    	request.setAttribute("CursoSelected", request.getParameter("hfIdCurso"));
	    	
	    	request.setAttribute("profesorSelected", request.getParameter("hfIdProfesor"));
	    	request.setAttribute("materiaSelected", request.getParameter("hfIdMateria"));
	    	request.setAttribute("anioSelected", request.getParameter("hfAnio"));
	    	request.setAttribute("semestreSelected", request.getParameter("hfIdSemestre"));
			
			request.setAttribute("editando", "true");
	    	RequestDispatcher rd= request.getRequestDispatcher("CursosAdmin.jsp");
	    	rd.forward(request, response);
		}
		
		//al asignar
		if(request.getParameter("btnAsignar")!=null)
		{
		
			request.setAttribute("cursoAlumno", request.getParameter("hfIdCurso"));
			request.setAttribute("asignando", "true");
	    	RequestDispatcher rd= request.getRequestDispatcher("CursosAdmin.jsp");
	    	rd.forward(request, response);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
