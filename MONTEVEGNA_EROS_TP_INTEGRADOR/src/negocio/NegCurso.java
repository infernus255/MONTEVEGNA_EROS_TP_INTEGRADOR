package negocio;

import java.util.HashMap;
import java.util.List;

import accesoDatos.DatosManager;
import entidad.EntCurso;

public class NegCurso {

	public static Boolean listarCursos(List<EntCurso> cursos)
	{
	
		try 
		{
			DatosManager db= new DatosManager();
			if(db.executeQuery("select * from vw_listado_cursos"))
			{
				while (db.getRs().next()) {
					EntCurso curso =new EntCurso();
					curso.setId_curso(db.getRs().getString("id_curso"));
					curso.setMateria(db.getRs().getString("materia"));
					curso.setId_materia(db.getRs().getString("id_materia") );
					curso.setSemestre(db.getRs().getString("semestre"));
					curso.setId_semestre(db.getRs().getString("id_semestre"));
					curso.setAnio(db.getRs().getString("anio"));
					curso.setProfesor(db.getRs().getString("profesor"));
					curso.setDni_profesor(db.getRs().getString("dni_profesor"));
					curso.setEstado(db.getRs().getString("estado"));

					cursos.add(curso);
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
	
	public static Boolean listarCursosFiltro(HashMap<String,String> cursos, String dni_profesor)
	{
	
		try 
		{
			DatosManager db= new DatosManager();
			if(db.executeQuery("select concat(id_curso,' ',materia,' ',semestre,' ',anio) as curso,id_curso from vw_listado_cursos where dni_profesor='"+dni_profesor+"'"))
			{
				while (db.getRs().next()) {
					EntCurso curso =new EntCurso();
					curso.setId_curso(db.getRs().getString("id_curso"));
					curso.setCurso(db.getRs().getString("curso"));

					cursos.put(curso.getCurso(),curso.getId_curso());
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
	
	

	public static String cargarCurso(EntCurso x) {
		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_dni_profesor",x.getDni_profesor());
			params.put("p_anio", x.getAnio());
			params.put("p_id_materia", x.getId_materia());
			params.put("p_id_semestre", x.getId_semestre());
			
			db.executeSP("SP_CargarCurso", params);
			while (db.getRs().next()) {
				 
				String result=db.getRs().getString(1);
				
				return result;
			}
			return "No se pudo cargar el curso";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "No se pudo cargar el curso";
		}
	}

	public static String modificarCurso(EntCurso x) {

		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_id_curso",x.getId_curso());
			params.put("p_dni_profesor",x.getDni_profesor());
			params.put("p_anio", x.getAnio());
			params.put("p_id_materia", x.getId_materia());
			params.put("p_id_semestre", x.getId_semestre());
			
			db.executeSP("SP_ModificarCurso", params);
			while (db.getRs().next()) {
				 
				String result=db.getRs().getString(1);
				
				return result;
			}
			return "No se pudo modificar el curso";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "No se pudo modificar el curso";
		}
	}

	public static String eliminarCurso(String idCurso) {
		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_id_curso", idCurso);
			db.executeSP("SP_EliminarCurso",params);
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
	
	public static Boolean listarCursosXProfesor(List<EntCurso> cursos,String email_profesor )
	{
	
		try 
		{
			DatosManager db= new DatosManager();
			if(db.executeQuery("select * from vw_listado_cursos where dni_profesor=(select dni from tbl_profesores where email='"+email_profesor+"')"))
			{
				while (db.getRs().next()) {
					EntCurso curso =new EntCurso();
					curso.setId_curso(db.getRs().getString("id_curso"));
					curso.setMateria(db.getRs().getString("materia"));
					curso.setId_materia(db.getRs().getString("id_materia") );
					curso.setSemestre(db.getRs().getString("semestre"));
					curso.setId_semestre(db.getRs().getString("id_semestre"));
					curso.setAnio(db.getRs().getString("anio"));
					curso.setProfesor(db.getRs().getString("profesor"));
					curso.setDni_profesor(db.getRs().getString("dni_profesor"));
					curso.setEstado(db.getRs().getString("estado"));

					cursos.add(curso);
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
	
}
