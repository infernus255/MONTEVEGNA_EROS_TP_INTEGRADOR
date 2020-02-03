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

import com.google.gson.Gson;

import entidad.EntInformeBasicoCurso;
import negocio.NegInformeBasicoCurso;

/**
 * Servlet implementation class SvltGenerarInformeCursosProfesorAnio
 */
@WebServlet("/SvltGenerarInformeCursosProfesorAnio")
public class SvltGenerarInformeCursosProfesorAnio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SvltGenerarInformeCursosProfesorAnio() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//si presiono btnCalcularAprobados
		if(request.getParameter("btnCalcularAprobados")!=null)
		{
			
			if(request.getParameter("ddlProfesoresAprobados")!=null &&  request.getParameter("ddlAnioAprobados")!=null )
			{
				String dniProfesor= request.getParameter("ddlProfesoresAprobados");
				String anio= request.getParameter("ddlAnioAprobados");
				List<EntInformeBasicoCurso> informes = new ArrayList<EntInformeBasicoCurso>();
				Gson gson = new Gson();
				if(NegInformeBasicoCurso.generarInformeCursosProfesorAnio(dniProfesor, anio, informes)){
					
					request.setAttribute("informeCursosProfesorAnio",gson.toJson(informes));
					request.setAttribute("generarInformeCursosProfesorAnio", "true");
					request.setAttribute("ddlProfesoresAprobados",request.getParameter("ddlProfesoresAprobados") );
					request.setAttribute("ddlAnioAprobados",request.getParameter("ddlAnioAprobados") );
				}
			}

			
			
		}
		
    	RequestDispatcher rd= request.getRequestDispatcher("ReportesAdmin.jsp");
    	rd.forward(request, response);
		
	}

}
