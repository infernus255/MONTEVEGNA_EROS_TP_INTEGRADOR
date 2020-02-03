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


@WebServlet("/SvltGenerarInformeCantidadCursosProfesor")
public class SvltGenerarInformeCantidadCursosProfesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SvltGenerarInformeCantidadCursosProfesor() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    	
		    	//si presiono btnCalcularCursosProfesor
				if(request.getParameter("btnCalcularCursosProfesor")!=null)
				{
					
					if(request.getParameter("ddlAnioCursosProfesor")!=null )
					{
						String anio= request.getParameter("ddlAnioCursosProfesor");
						List<EntInformeBasicoCurso> informes = new ArrayList<EntInformeBasicoCurso>();
						Gson gson = new Gson();
						if(NegInformeBasicoCurso.generarInformeCantidadCursosProfesores(anio, informes)){
							
							request.setAttribute("informeCantidadCursosProfesor",gson.toJson(informes));
							request.setAttribute("generarInformeCantidadCursosProfesor", "true");
							request.setAttribute("ddlAnioCursosProfesor",request.getParameter("ddlAnioCursosProfesor") );

						}
					}

					
					
				}
				
		    	RequestDispatcher rd= request.getRequestDispatcher("ReportesAdmin.jsp");
		    	rd.forward(request, response);
		
	}

}
