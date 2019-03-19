<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="com.db.util.DBConnection" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.sql.*" %>

<html>
<body>
	<%
		String name = request.getParameter("name");		 		
	try
	{				
				Connection con = DBConnection.getConnection();
						
				 PreparedStatement ps = con.prepareStatement("select * from imagedata where name=?");
				 ps.setString(1,name);
				 ResultSet rs = ps.executeQuery();
				
				if(rs.next())
				{
					Blob b = rs.getBlob(2); 
					byte bArray[] = b.getBytes(1, (int)b.length());
					
					response.setContentType("image/gif");					
					OutputStream  os = response.getOutputStream();
			        os.write(bArray);
			        os.flush(); 
			        os.close(); 
				}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	%>
</body>
</html>
