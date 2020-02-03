package sevlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accesoDatos.DatosManager;

/**
 * Servlet implementation class SvltCargarLocalidades
 */
@WebServlet("/SvltCargarLocalidades")
public class SvltCargarLocalidades extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SvltCargarLocalidades() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	HashMap <String,String> Localidades=new HashMap<String,String>();
		
 		try{
	 		DatosManager db=new DatosManager();
	    	if(db.executeQuery("SELECT id,nombre FROM universidad.tbl_localidades where provincia_id="+request.getParameter("txtProvincia")+";"))
	    	{
				while (db.getRs().next()) {									 
					Localidades.put(db.getRs().getString("nombre"),db.getRs().getString("id"));								
				}
	 		
	 		}
	    	
	    	request.setAttribute("Localidades",Localidades);
	    	request.setAttribute("provinciaSelected", request.getParameter("txtProvincia"));
	    	request.setAttribute("provinciaChange", "ok");
	    	
	    	request.setAttribute("nombreSelected", request.getParameter("txtNombre"));
	    	request.setAttribute("apellidoSelected", request.getParameter("txtApellido"));
	    	request.setAttribute("dniSelected", request.getParameter("txtDni"));
	    	request.setAttribute("legajoSelected", request.getParameter("txtLegajo"));
	    	request.setAttribute("emailSelected", request.getParameter("txtEmail"));
	    	request.setAttribute("direccionSelected", request.getParameter("txtDireccion"));
	    	request.setAttribute("telefonoSelected", request.getParameter("txtTelefono"));
	    	request.setAttribute("fechaNacSelected", request.getParameter("txtFechaNac"));
	    	
	    	RequestDispatcher rd= request.getRequestDispatcher("AlumnosAdmin.jsp");
	    	rd.forward(request, response);
 		}
 		catch(Exception ex)
 		{ex.printStackTrace();}
		
	}

}
