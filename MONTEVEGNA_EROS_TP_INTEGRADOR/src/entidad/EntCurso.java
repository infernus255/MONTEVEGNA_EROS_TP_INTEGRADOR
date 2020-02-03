package entidad;

public class EntCurso {

	private String id_curso;
	private String materia;
	private String id_materia;
	private String semestre;
	private String id_semestre;
	private String anio;
	private String profesor;
	private String dni_profesor;
	private String estado;
	private String curso;
	
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getId_curso() {
		return id_curso;
	}
	public void setId_curso(String id_curso) {
		this.id_curso = id_curso;
	}
	public String getMateria() {
		return materia;
	}
	public void setMateria(String materia) {
		this.materia = materia;
	}
	public String getId_materia() {
		return id_materia;
	}
	public void setId_materia(String id_materia) {
		this.id_materia = id_materia;
	}
	public String getSemestre() {
		return semestre;
	}
	public void setSemestre(String semestre) {
		this.semestre = semestre;
	}
	public String getId_semestre() {
		return id_semestre;
	}
	public void setId_semestre(String id_semestre) {
		this.id_semestre = id_semestre;
	}
	public String getAnio() {
		return anio;
	}
	public void setAnio(String anio) {
		this.anio = anio;
	}
	public String getProfesor() {
		return profesor;
	}
	public void setProfesor(String profesor) {
		this.profesor = profesor;
	}
	public String getDni_profesor() {
		return dni_profesor;
	}
	public void setDni_profesor(String dni_profesor) {
		this.dni_profesor = dni_profesor;
	}
	public EntCurso(String id_curso, String materia, String id_materia, String semestre, String id_semestre,
			String anio, String profesor, String dni_profesor) {
		super();
		this.id_curso = id_curso;
		this.materia = materia;
		this.id_materia = id_materia;
		this.semestre = semestre;
		this.id_semestre = id_semestre;
		this.anio = anio;
		this.profesor = profesor;
		this.dni_profesor = dni_profesor;
	}
	
	public EntCurso()
	{
		
	}
	public String getCurso() {
		return curso;
	}
	public void setCurso(String curso) {
		this.curso = curso;
	}
	
}
