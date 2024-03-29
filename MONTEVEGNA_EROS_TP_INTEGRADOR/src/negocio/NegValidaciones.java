package negocio;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;

public class NegValidaciones {

	//si es distinto de null devuelve true, de lo contrario false
	public static boolean validarNulo(String name) {
		boolean rst=false;
		try {			
			if(name!=null)
			{
					rst=true;
			}					
		} catch (Exception e) {
			rst=false;
			e.printStackTrace();			
		}
		return rst;
	}
	
	//valida si existe la cookie en el vector de cookies con ese nombre la devuelve
	public static Cookie buscarCookie(Cookie[] cookies,String nombre) {
		Cookie rst=null;
		
		try {	
				//si cookies existe 
				if(cookies != null)
				{
					//para cada cookie
					for(Cookie cookie : cookies)
					{																	
							//si la cookie es la dada
							if(cookie.getName().equals(nombre))
							{			    		
								rst=cookie;
							}
						
					}
				}
				
					
							
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return rst;
	}
	
	public static Date StringToDate(String sDate1) {  
		 try{
			    Date date1=new SimpleDateFormat("dd-MM-yyyy").parse(sDate1);   
			    return date1;
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		return null;
		}  
	

	
	
}
