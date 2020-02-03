package accesoDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;



public class DatosManager {

	private String host = "jdbc:mysql://localhost:3306/";
	private String user = "root";
	private String pass = "root";
	private String dbName ="universidad?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private Connection cn;
	private Statement st;
	private ResultSet rs;
	private java.sql.CallableStatement cst;
	
	
	
	public ResultSet getRs() {
		return rs;
	}

	public DatosManager()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			cn=DriverManager.getConnection(host+dbName,user,pass);
			st=cn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
				
	}
	
	//Al pasarle una consulta llena el rs con los datos
	public boolean executeQuery(String query)
	{		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		boolean rst=false;
		try {
			rs=st.executeQuery(query);
			rst=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rst;
		
	}
	
	//Al pasarle una consulta llena el rs con los datos
	public int executeUpdate(String query)
	{		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		int rst=0;
		try {
			rst=st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rst;
		
	}
	
	//Al pasarle un sp carga el st con la consulta
	public void executeSP(String spName,HashMap<String, String> params)
	{				
		try {
			String query="{CALL "+spName;
			int tam=params.keySet().size();
			//recorro cada clave del hash map
			for( int i=0;i<tam;i++ ) {
				//agrego las key
				if(i==0)
				{
					query+="(?";
				}
				else
				{
					query+=",?";	
				}
				
				if(i==tam-1)
				{
					query+=")";
				}
				
			}
			//cierro la llamada
			query+="}";
			//preparo la  llamada
		cst=cn.prepareCall(query);
		
		//recorro los valores
		for ( String key : params.keySet() ) {
			//agrego los value
			cst.setString(key,params.get(key));				
		}
		
		rs=cst.executeQuery();
		 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
}
