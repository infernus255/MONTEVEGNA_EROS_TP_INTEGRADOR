package negocio;

import java.util.HashMap;
import accesoDatos.DatosManager;
import entidad.EntLogin;

public class NegLogin {

	public static boolean validarIngreso(EntLogin login)
	{
		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("email",login.getUsuario());
			params.put("contrasena", login.getContrasena());
			
			db.executeSP("SP_ValidarLogin", params);
			while (db.getRs().next()) {
				 
				boolean result=db.getRs().getBoolean(1);
				return result;
			}
			return false;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}

	}
	
}
