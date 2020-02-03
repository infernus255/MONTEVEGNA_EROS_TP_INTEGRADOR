package sevlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entidad.EntCurso;

import negocio.NegCurso;

/**
 * Servlet implementation class SvltGuardarCurso
 */
@WebServlet("/SvltGuardarCurso")
public class SvltGuardarCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SvltGuardarCurso() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		if(request.getParameter("btnGuardar")!=null)
    	{
			//si esta editando
			if(request.getParameter("hfEditar").equals("true"))
			{
				EntCurso Curso=new EntCurso();
				Curso.setId_curso(request.getParameter("hfIdCursoAux"));
				Curso.setId_materia(request.getParameter("txtMateria"));
				Curso.setId_semestre(request.getParameter("txtSemestre"));
				Curso.setAnio(request.getParameter("txtAnio"));
				Curso.setDni_profesor(request.getParameter("txtProfesor"));
				
				String rst=NegCurso.modificarCurso(Curso);
				if(rst.equals("ok"))
				{
					request.setAttribute("cargarCurso","ok");
			    	RequestDispatcher rd= request.getRequestDispatcher("CursosAdmin.jsp");
			    	rd.forward(request, response);
				}
				else {
										
					request.setAttribute("cargarCurso",rst);
					request.setAttribute("Curso", Curso);
			    	RequestDispatcher rd= request.getRequestDispatcher("CursosAdmin.jsp");
			    	rd.forward(request, response);
				}
			}
			//si esta agregando un nuevo curso
			else
			{				
				EntCurso Curso=new EntCurso();
				
				Curso.setId_materia(request.getParameter("txtMateria"));
				Curso.setId_semestre(request.getParameter("txtSemestre"));
				Curso.setAnio(request.getParameter("txtAnio"));
				Curso.setDni_profesor(request.getParameter("txtProfesor"));
				
				String rst=NegCurso.cargarCurso(Curso);
				if(rst.equals("ok"))
				{
					request.setAttribute("cargarCurso","ok");
			    	RequestDispatcher rd= request.getRequestDispatcher("CursosAdmin.jsp");
			    	rd.forward(request, response);
				}
				else {
					
					request.setAttribute("cargarCurso",rst);
					request.setAttribute("Curso", Curso);
			    	RequestDispatcher rd= request.getRequestDispatcher("CursosAdmin.jsp");
			    	rd.forward(request, response);
				}
			}
    	}
		
		
	}

}
