package negocio;

import java.util.HashMap;
import java.util.List;

import accesoDatos.DatosManager;
import entidad.EntAlumno;
import entidad.EntEstadoAcademico;

public class NegAlumno {
	
	public static String cargarAlumno(EntAlumno x)
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
			
			db.executeSP("SP_CargarAlumno", params);
			while (db.getRs().next()) {
				 
				String result=db.getRs().getString(1);
				
				return result;
			}
			return "No se pudo cargar el alumno";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "No se pudo cargar el alumno";
		}
	}
	
	
	public static String cargarNotasAlumno(EntAlumno x,String id_curso)
	{
		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_dni",x.getDni());
			
			params.put("p_nota_1", x.getEstadoAcademico().getNota1());
			params.put("p_nota_2", x.getEstadoAcademico().getNota2());
			params.put("p_recuperatorio_1", x.getEstadoAcademico().getRecuperatorio1());
			params.put("p_recuperatorio_2", x.getEstadoAcademico().getRecuperatorio2());
			params.put("p_estado", x.getEstadoAcademico().getEstado());
			params.put("p_id_curso", id_curso);
			
			db.executeSP("SP_CargarNotasAlumno", params);
			while (db.getRs().next()) {
				 
				String result=db.getRs().getString(1);
				
				return result;
			}
			return "No se pudieron cargar notas a el alumno con dni="+x.getDni();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "No se pudieron cargar notas a el alumnocon dni="+x.getDni();
		}
	}
	
	public static String modificarAlumno(EntAlumno x,String dni_aux,String legajo_Aux,String email_aux)
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
			
			db.executeSP("SP_ModificarAlumno", params);
			while (db.getRs().next()) {
				 
				String result=db.getRs().getString(1);
				
				return result;
			}
			return "No se pudo modificar el alumno";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "No se pudo modificar el alumno";
		}
	}
	
	public static Boolean listarAlumnos(List<EntAlumno> alumnos)
	{
	
		try 
		{
			DatosManager db= new DatosManager();
			if(db.executeQuery("select * from vw_listado_alumnos"))
			{
				while (db.getRs().next()) {
					EntAlumno alumno =new EntAlumno();
					alumno.setDni(db.getRs().getString("dni"));
					alumno.setLegajo(db.getRs().getString("legajo"));
					alumno.setNombre(db.getRs().getString("nombre") );
					alumno.setApellido(db.getRs().getString("apellido"));
					alumno.setFecha_nac(db.getRs().getString("fecha_nac"));
					alumno.setDireccion(db.getRs().getString("direccion"));
					alumno.setEmail(db.getRs().getString("email"));
					alumno.setTelefono(db.getRs().getString("telefono"));
					alumno.setProvincia(db.getRs().getString("provincia"));
					alumno.setLocalidad(db.getRs().getString("localidad"));
					alumno.setIdProvincia(db.getRs().getString("id_provincia"));
					alumno.setIdLocalidad(db.getRs().getString("id_localidad"));
					alumno.setEstado(db.getRs().getString("estado"));
					alumnos.add(alumno);
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
	
	public static Boolean listarAlumnosXCurso(List<EntAlumno> alumnos,String idCurso)
	{
	
		try 
		{
			DatosManager db= new DatosManager();
			if(db.executeQuery("select l.dni,l.legajo,l.nombre,l.apellido,IFNULL(c.inscripto,false) as inscripto  from vw_listado_alumnos as l left join tbl_cursos_estudiantes as c on c.id_curso='"+idCurso+"' and c.dni_estudiante=l.dni where l.estado=true"))
			{
				while (db.getRs().next()) {
					EntAlumno alumno =new EntAlumno();
					alumno.setDni(db.getRs().getString("dni"));
					alumno.setLegajo(db.getRs().getString("legajo"));
					alumno.setNombre(db.getRs().getString("nombre") );
					alumno.setApellido(db.getRs().getString("apellido"));
					alumno.setEstado(db.getRs().getString("inscripto"));
					alumnos.add(alumno);
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
	
	public static Boolean listarAlumnosXCursoConNotas(List<EntAlumno> alumnos,String dniProfesor,String idCurso)
	{
	
		try 
		{
			DatosManager db= new DatosManager();				
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_dni_profesor",dniProfesor);
			params.put("p_id_curso",idCurso);
			db.executeSP("SP_ListarAlumnosProfesor", params);
				while (db.getRs().next()) {
					EntEstadoAcademico estadoAcad=new EntEstadoAcademico();
					EntAlumno alumno =new EntAlumno();
					alumno.setDni(db.getRs().getString("dni"));
					alumno.setLegajo(db.getRs().getString("legajo"));
					alumno.setNombre(db.getRs().getString("nombre") );
					alumno.setApellido(db.getRs().getString("apellido"));
					
					estadoAcad.setNota1(db.getRs().getString("nota_1"));
					estadoAcad.setNota2(db.getRs().getString("nota_2"));
					estadoAcad.setRecuperatorio1(db.getRs().getString("recuperatorio_1"));
					estadoAcad.setRecuperatorio2(db.getRs().getString("recuperatorio_2"));
					estadoAcad.setEstado(db.getRs().getString("estado"));
					
					alumno.setEstadoAcademico(estadoAcad);
					
					alumnos.add(alumno);
				}
				return true;				
		} 
		catch (Exception e) {			
			e.printStackTrace();
			return false;
		}
		
	}
	
	public static String eliminarAlumno(String dni)
	{
		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_dni", dni);
			db.executeSP("SP_EliminarAlumno",params);
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
	
	//si no existe lo crea, si existe, pone inscribir en true
	public static String asignarAlumnoCurso(String idCurso, String dniAlumno)
	{
		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_dni_alumno",dniAlumno);
			params.put("p_id_curso",idCurso);
			
			db.executeSP("SP_InscribirAlumnoCurso", params);
			while (db.getRs().next()) {
				 
				String result=db.getRs().getString(1);
				
				return result;
			}
			return "No se pudo inscribir el alumno";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "No se pudo inscribir el alumno";
		}
	}
	
	//pone inscribir en false
	public static String eliminarAlumnoCurso(String idCurso, String dniAlumno)
	{
		try {
			DatosManager db= new DatosManager();
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("p_dni_alumno",dniAlumno);
			params.put("p_id_curso",idCurso);
			db.executeSP("SP_EliminarAlumnoCurso",params);
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

}
