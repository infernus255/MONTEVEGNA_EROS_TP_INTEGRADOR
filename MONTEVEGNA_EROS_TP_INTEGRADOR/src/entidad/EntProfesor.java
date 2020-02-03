package entidad;

public class EntProfesor {
	private String dni;
	private String legajo;
	private String nombre;
	private String apellido;
	private String fecha_nac;
	private String direccion;
	private String idLocalidad;
	private String idProvincia;
	private String email;
	private String telefono;
	private String provincia;
	private String localidad;
	private String estado;



	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getLocalidad() {
		return localidad;
	}
	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getLegajo() {
		return legajo;
	}
	public void setLegajo(String legajo) {
		this.legajo = legajo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getFecha_nac() {
		return fecha_nac;
	}
	public void setFecha_nac(String fecha_nac) {
		this.fecha_nac = fecha_nac;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}



	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public EntProfesor(String dni, String legajo, String nombre,String apellido, String fecha_nac, String direccion, String idLocalidad,String idProvincia, String email,
			String telefono) {
		super();
		this.dni = dni;
		this.legajo = legajo;
		this.nombre = nombre;
		this.apellido = apellido;
		this.fecha_nac = fecha_nac;
		this.direccion = direccion;
		this.idLocalidad = idLocalidad;
		this.idProvincia = idProvincia;
		this.email = email;
		this.telefono = telefono;
	}

	public EntProfesor() {

	}

	public String getIdLocalidad() {
		return idLocalidad;
	}
	public void setIdLocalidad(String idLocalidad) {
		this.idLocalidad = idLocalidad;
	}
	public String getIdProvincia() {
		return idProvincia;
	}
	public void setIdProvincia(String idProvincia) {
		this.idProvincia = idProvincia;
	}
}
