package sevlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.EntInformeBasicoCurso;
import negocio.NegInformeBasicoCurso;

/**
 * Servlet implementation class SvltGenerarInformeCursoBasico
 */
@WebServlet("/SvltGenerarInformeCursoBasico")
public class SvltGenerarInformeCursoBasico extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//si presiono btnGenerarInformeCursoBasico
		if(request.getParameter("btnGenerarInformeCursoBasico")!=null)
		{
			
			EntInformeBasicoCurso informe=new EntInformeBasicoCurso();
			if(request.getParameter("ddlCursos")!=null)
			{
				String idCurso= request.getParameter("ddlCursos");
				if(NegInformeBasicoCurso.generarInformeBasico(idCurso, informe)) {
					request.setAttribute("cantAlumnos", informe.getCantAlumnos());
					request.setAttribute("cantAlumnosAprobados", informe.getCantAlumnosAprobados());
					request.setAttribute("cantAlumnosDesaprobados", informe.getCantAlumnosDesaprobados());
					request.setAttribute("profesor", informe.getProfesor());
					request.setAttribute("GenerarInformeCursoBasico", "true");
					request.setAttribute("ddlCursos",request.getParameter("ddlCursos") );
				}
			}

			
			
		}
		
    	RequestDispatcher rd= request.getRequestDispatcher("ReportesAdmin.jsp");
    	rd.forward(request, response);
		
	}

}
