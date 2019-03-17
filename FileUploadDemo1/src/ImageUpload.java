import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import javax.servlet.http.Part;
import com.db.util.*;

@WebServlet("/ImageUpload")
@MultipartConfig(maxFileSize = 16177216)

public class ImageUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			Part part = request.getPart("image");
			String name = request.getParameter("name");
			PrintWriter out = response.getWriter();
			
			int result=0;
			if(part != null)
			{
				try{
					Connection con =  DBConnection.getConnection();
					
					PreparedStatement pw = con.prepareStatement("insert into imagedata(image,name) values(?,?)");
					InputStream is = part.getInputStream();
					
					pw.setBlob(1,is);
					pw.setString(2,name);
					result =  pw.executeUpdate();
					
					if(result > 0)
					{
						int id = 1;
						response.sendRedirect("index.jsp?name="+name+"&id="+id);
					}
				}
				catch(Exception e)
				{
					out.print("Please try again...!");  
			        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");  
			        rd.include(request, response);
				}
			}
	}

}
