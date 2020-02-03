package negocio;

import java.util.HashMap;
import java.util.List;

import accesoDatos.DatosManager;
import entidad.EntProfesor;

public class NegProfesor {

	public static String cargarProfesor(EntProfesor x)
	{
		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_dni",x.getDni());
			params.put("p_legajo",x.getLegajo());
			params.put("p_nombre", x.getNombre());
			params.put("p_apellido", x.getApellido());
			params.put("p_fecha_nac", x.getFecha_nac());
			params.put("p_direccion", x.getDireccion());
			params.put("p_localidad", x.getIdLocalidad());
			params.put("p_provincia", x.getIdProvincia());
			params.put("p_email", x.getEmail());
			params.put("p_telefono", x.getTelefono());
			
			db.executeSP("SP_CargarProfesor", params);
			while (db.getRs().next()) {
				 
				String result=db.getRs().getString(1);
				
				return result;
			}
			return "No se pudo cargar el Profesor";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "No se pudo cargar el Profesor";
		}
	}
	
	public static String modificarProfesor(EntProfesor x,String dni_aux,String legajo_Aux,String email_aux)
	{
		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_dni",x.getDni());
			params.put("p_dni_aux",dni_aux);
			params.put("p_legajo",x.getLegajo());
			params.put("p_legajo_aux",legajo_Aux);
			params.put("p_nombre", x.getNombre());
			params.put("p_apellido", x.getApellido());
			params.put("p_fecha_nac", x.getFecha_nac());
			params.put("p_direccion", x.getDireccion());
			params.put("p_localidad", x.getIdLocalidad());
			params.put("p_provincia", x.getIdProvincia());
			params.put("p_email", x.getEmail());
			params.put("p_email_aux", email_aux);
			params.put("p_telefono", x.getTelefono());
			
			db.executeSP("SP_ModificarProfesor", params);
			while (db.getRs().next()) {
				 
				String result=db.getRs().getString(1);
				
				return result;
			}
			return "No se pudo modificar el Profesor";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "No se pudo modificar el Profesor";
		}
	}
	
	public static Boolean listarProfesores(List<EntProfesor> Profesores)
	{
	
		try 
		{
			DatosManager db= new DatosManager();
			if(db.executeQuery("select * from vw_listado_Profesores"))
			{
				while (db.getRs().next()) {
					EntProfesor Profesor =new EntProfesor();
					Profesor.setDni(db.getRs().getString("dni"));
					Profesor.setLegajo(db.getRs().getString("legajo"));
					Profesor.setNombre(db.getRs().getString("nombre") );
					Profesor.setApellido(db.getRs().getString("apellido"));
					Profesor.setFecha_nac(db.getRs().getString("fecha_nac"));
					Profesor.setDireccion(db.getRs().getString("direccion"));
					Profesor.setEmail(db.getRs().getString("email"));
					Profesor.setTelefono(db.getRs().getString("telefono"));
					Profesor.setProvincia(db.getRs().getString("provincia"));
					Profesor.setLocalidad(db.getRs().getString("localidad"));
					Profesor.setIdProvincia(db.getRs().getString("id_provincia"));
					Profesor.setIdLocalidad(db.getRs().getString("id_localidad"));
					Profesor.setEstado(db.getRs().getString("estado"));
					Profesores.add(Profesor);
				}
				return true;
			}
			else
			{
				return false;
			}					
		} 
		catch (Exception e) {			
			e.printStackTrace();
			return false;
		}
		
	}
	
	public static String eliminarProfesor(String dni)
	{
		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_dni", dni);
			db.executeSP("SP_EliminarProfesor",params);
			while (db.getRs().next()) {
				 
				String result=db.getRs().getString(1);
				
				return result;
			}
			return "false";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	public static String obtenerDniProfesor(String email_profesor)
	{
		String dni="0";
		try 
		{
			DatosManager db= new DatosManager();

			if(db.executeQuery("select dni from vw_listado_Profesores where email='"+email_profesor+"'"))
			{
				while (db.getRs().next()) {
				dni=db.getRs().getString("dni");	
				}
				
			}
			
			return dni;
			
		} 
		catch (Exception e) {			
			e.printStackTrace();
			return dni;
		}
	}
	
	
}
