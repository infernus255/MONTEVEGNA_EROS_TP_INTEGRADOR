package sevlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NegAlumno;

/**
 * Servlet implementation class SvltAgregarAlumnoCursoAdmin
 */
@WebServlet("/SvltAgregarAlumnoCursoAdmin")
public class SvltAgregarAlumnoCursoAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SvltAgregarAlumnoCursoAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
		//si quiere inscribir un alumno
		if(request.getParameter("btnAgregarAlumno")!=null)
		{
			String idCurso=request.getParameter("hfIdCursoAlumno");
			String dniAlumno=request.getParameter("hfDni");
			
			String rst=NegAlumno.asignarAlumnoCurso(idCurso, dniAlumno);
			
			request.setAttribute("cargarInscripcion",rst);

		}
		
		//si quiere desinscribir un alumno
		if(request.getParameter("btnEliminarAlumno")!=null)
		{
		
			String idCurso=request.getParameter("hfIdCursoAlumno");
			String dniAlumno=request.getParameter("hfDni");
			
			String rst=NegAlumno.eliminarAlumnoCurso(idCurso, dniAlumno);
			
				request.setAttribute("eliminarInscripcion",rst);
		

		}
		
		request.setAttribute("asignadoExito","true");
    	RequestDispatcher rd= request.getRequestDispatcher("CursosAdmin.jsp");
    	rd.forward(request, response);
		}
		catch(Exception ex){ex.printStackTrace();}
	}

}
