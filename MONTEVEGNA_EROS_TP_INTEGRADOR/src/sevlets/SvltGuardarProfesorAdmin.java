package sevlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.EntProfesor;
import negocio.NegProfesor;

/**
 * Servlet implementation class SvltGuardarProfesorAdmin
 */
@WebServlet("/SvltGuardarProfesorAdmin")
public class SvltGuardarProfesorAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SvltGuardarProfesorAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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

					EntProfesor Profesor=new EntProfesor(request.getParameter("txtDni"), request.getParameter("txtLegajo"), request.getParameter("txtNombre"), request.getParameter("txtApellido"),request.getParameter("txtFechaNac"), request.getParameter("txtDireccion"), idLocalidad,idProvincia, request.getParameter("txtEmail"), request.getParameter("txtTelefono") );
					String rst=NegProfesor.modificarProfesor(Profesor,dniAux,legajoAux,emailAux);
					if(rst.equals("ok"))
					{
						request.setAttribute("cargarProfesor","ok");
				    	RequestDispatcher rd= request.getRequestDispatcher("ProfesoresAdmin.jsp");
				    	rd.forward(request, response);
					}
					else {
											
						request.setAttribute("cargarProfesor",rst);
						request.setAttribute("Profesor", Profesor);
				    	RequestDispatcher rd= request.getRequestDispatcher("ProfesoresAdmin.jsp");
				    	rd.forward(request, response);
					}
				}
				//si esta agregando un nuevo usuario
				else
				{
					String idLocalidad=request.getParameter("txtLocalidad");
					String idProvincia=request.getParameter("txtProvincia");				
		
					EntProfesor Profesor=new EntProfesor(request.getParameter("txtDni"), request.getParameter("txtLegajo"), request.getParameter("txtNombre"), request.getParameter("txtApellido"),request.getParameter("txtFechaNac"), request.getParameter("txtDireccion"), idLocalidad,idProvincia, request.getParameter("txtEmail"), request.getParameter("txtTelefono") );
					String rst=NegProfesor.cargarProfesor(Profesor);
					if(rst.equals("ok"))
					{
						request.setAttribute("cargarProfesor","ok");
				    	RequestDispatcher rd= request.getRequestDispatcher("ProfesoresAdmin.jsp");
				    	rd.forward(request, response);
					}
					else {
						
						request.setAttribute("cargarProfesor",rst);
						request.setAttribute("Profesor", Profesor);
				    	RequestDispatcher rd= request.getRequestDispatcher("ProfesoresAdmin.jsp");
				    	rd.forward(request, response);
					}
				}
	    	}
			
				else
				{
				
			    	RequestDispatcher rd= request.getRequestDispatcher("SvltCargarLocalidadesProfesores");
			    	rd.forward(request, response);
				}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

}
