package sevlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocio.NegAlumno;
import entidad.EntAlumno;
import entidad.EntEstadoAcademico;
import negocio.NegProfesor;

/**
 * Servlet implementation class SvltFiltrarGuardar
 */
@WebServlet("/SvltFiltrarGuardar")
public class SvltFiltrarGuardar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SvltFiltrarGuardar() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//si presiono filtrar
		if(request.getParameter("btnFiltrar")!=null)
		{
			String idCurso=request.getParameter("ddlCursos");
			HttpSession session=request.getSession();
			String dniProfesor=NegProfesor.obtenerDniProfesor(session.getAttribute("usuario").toString());
			List<EntAlumno> alumnos=new ArrayList<EntAlumno>();
			NegAlumno.listarAlumnosXCursoConNotas(alumnos,dniProfesor,idCurso);
			
			request.setAttribute("alumnos", alumnos);
			request.setAttribute("idCursoAux",idCurso);
		}
		
		//si presiono guardar
		if(request.getParameter("btnGuardar")!=null)
		{
			String rst="No se pudo cargar notas alumnos";
			String idCurso=request.getParameter("ddlCursos");
			try {
			List<EntAlumno> alumnos=new ArrayList<EntAlumno>();
			
			String[] dniAlumnos=request.getParameterValues("hfDni");
			String[] nota1Alumnos=request.getParameterValues("txtNota1");
			String[] nota2Alumnos=request.getParameterValues("txtNota2");
			String[] recuperatorio1Alumnos=request.getParameterValues("txtRecuperatorio1");
			String[] recuperatorio2Alumnos=request.getParameterValues("txtRecuperatorio2");
			String[] estadosAlumnos=request.getParameterValues("txtEstado");
			
			for(int i=0;i<dniAlumnos.length;i++)
			{
				EntAlumno alumno=new EntAlumno();
				EntEstadoAcademico EstadoAcad=new EntEstadoAcademico();
				
				alumno.setDni(dniAlumnos[i]);
				
				
				EstadoAcad.setNota1(nota1Alumnos[i]);
				EstadoAcad.setNota2(nota2Alumnos[i]);
				EstadoAcad.setRecuperatorio1(recuperatorio1Alumnos[i]);
				EstadoAcad.setRecuperatorio2(recuperatorio2Alumnos[i]);
				EstadoAcad.setEstado(estadosAlumnos[i]);
				
				alumno.setEstadoAcademico(EstadoAcad);
				
				alumnos.add(alumno);
			}
			

			for(EntAlumno a : alumnos) {
				
				rst=NegAlumno.cargarNotasAlumno(a,idCurso);
				
			}
			}
			catch(Exception ex){
				ex.printStackTrace();
				
			}
			request.setAttribute("error", rst);
		}
		
    	RequestDispatcher rd= request.getRequestDispatcher("Alumnos.jsp");
    	rd.forward(request, response);
		
	}

}
