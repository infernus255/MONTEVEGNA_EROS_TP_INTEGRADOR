package negocio;

import java.util.HashMap;
import java.util.List;

import accesoDatos.DatosManager;
import entidad.EntInformeBasicoCurso;

public class NegInformeBasicoCurso {

	public static boolean generarInformeBasico(String idCurso, EntInformeBasicoCurso informe)
	{
		try {
			DatosManager db= new DatosManager();

			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_idCurso",idCurso);
			
			db.executeSP("SP_InformeBasicoCurso", params);
			if (db.getRs() != null) 
			{
			while (db.getRs().next()) {
				 
				informe.setCantAlumnos(db.getRs().getString("cantAlumnos"));
				informe.setCantAlumnosAprobados(db.getRs().getString("cantAlumnosAprobados"));
				informe.setCantAlumnosDesaprobados(db.getRs().getString("cantAlumnosDesaprobados"));
				informe.setProfesor(db.getRs().getString("profesor"));
				
				
				
			}

				db.getRs().last();    // moves cursor to the last row
			  if(db.getRs().getRow()==1)// get row id 
			  {
				  return true;
			  }
			  else
			  {
				  return false;
			  }  
			}
			else {return false;}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean generarInformeCursosProfesorAnio(String dniProfesor,String anio ,List<EntInformeBasicoCurso> informes)
	{
		try {
			DatosManager db= new DatosManager();

			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_dniProfesor",dniProfesor);
			params.put("p_anio",anio);
			
			db.executeSP("SP_InformeCursosProfesorAnio", params);
			if (db.getRs() != null) 
			{
			while (db.getRs().next()) {
				 
				EntInformeBasicoCurso informe=new EntInformeBasicoCurso();
				
				informe.setCantAlumnosAprobados(db.getRs().getString("cantAlumnosAprobados"));
				informe.setCantAlumnosDesaprobados(db.getRs().getString("cantAlumnosDesaprobados"));
				informe.setMateria(db.getRs().getString("materia"));
				
				informes.add(informe);
				
			}
			return true;
			}
			else {return false;}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean generarInformeCantidadCursosProfesores(String anio ,List<EntInformeBasicoCurso> informes)
	{
		try {
			DatosManager db= new DatosManager();

			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_anio",anio);
			
			db.executeSP("SP_InformeCantidadCursosProfesores", params);
			if (db.getRs() != null) 
			{
			while (db.getRs().next()) {
				 
				EntInformeBasicoCurso informe=new EntInformeBasicoCurso();
				
				informe.setCantCursos(db.getRs().getString("cantCursos"));
				informe.setProfesor(db.getRs().getString("profesor"));
				
				informes.add(informe);
				
			}
			return true;
			}
			else {return false;}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	
	
}
