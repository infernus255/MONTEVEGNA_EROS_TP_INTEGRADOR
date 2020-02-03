package sevlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.EntAlumno;
import negocio.NegAlumno;


@WebServlet("/SvltGuardarAlumnoAdmin")
public class SvltGuardarAlumnoAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SvltGuardarAlumnoAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {		
		
		if(request.getParameter("btnGuardar")!=null)
    	{
			//si esta editando
			if(request.getParameter("hfEditar").equals("true"))
			{
				
				String idLocalidad=request.getParameter("txtLocalidad");
				String idProvincia=request.getParameter("txtProvincia");
				String dniAux=request.getParameter("hfDniAux");
				String legajoAux=request.getParameter("hfLegajoAux");
				String emailAux=request.getParameter("hfEmailAux");

				EntAlumno alumno=new EntAlumno(request.getParameter("txtDni"), request.getParameter("txtLegajo"), request.getParameter("txtNombre"), request.getParameter("txtApellido"),request.getParameter("txtFechaNac"), request.getParameter("txtDireccion"), idLocalidad,idProvincia, request.getParameter("txtEmail"), request.getParameter("txtTelefono") );
				String rst=NegAlumno.modificarAlumno(alumno,dniAux,legajoAux,emailAux);
				if(rst.equals("ok"))
				{
					request.setAttribute("cargarAlumno","ok");
			    	RequestDispatcher rd= request.getRequestDispatcher("AlumnosAdmin.jsp");
			    	rd.forward(request, response);
				}
				else {
										
					request.setAttribute("cargarAlumno",rst);
					request.setAttribute("alumno", alumno);
			    	RequestDispatcher rd= request.getRequestDispatcher("AlumnosAdmin.jsp");
			    	rd.forward(request, response);
				}
			}
			//si esta agregando un nuevo usuario
			else
			{
				String idLocalidad=request.getParameter("txtLocalidad");
				String idProvincia=request.getParameter("txtProvincia");				
	
				EntAlumno alumno=new EntAlumno(request.getParameter("txtDni"), request.getParameter("txtLegajo"), request.getParameter("txtNombre"), request.getParameter("txtApellido"),request.getParameter("txtFechaNac"), request.getParameter("txtDireccion"), idLocalidad,idProvincia, request.getParameter("txtEmail"), request.getParameter("txtTelefono") );
				String rst=NegAlumno.cargarAlumno(alumno);
				if(rst.equals("ok"))
				{
					request.setAttribute("cargarAlumno","ok");
			    	RequestDispatcher rd= request.getRequestDispatcher("AlumnosAdmin.jsp");
			    	rd.forward(request, response);
				}
				else {
					
					request.setAttribute("cargarAlumno",rst);
					request.setAttribute("alumno", alumno);
			    	RequestDispatcher rd= request.getRequestDispatcher("AlumnosAdmin.jsp");
			    	rd.forward(request, response);
				}
			}
    	}
		
			else
			{
			
		    	RequestDispatcher rd= request.getRequestDispatcher("SvltCargarLocalidades");
		    	rd.forward(request, response);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

		

}
