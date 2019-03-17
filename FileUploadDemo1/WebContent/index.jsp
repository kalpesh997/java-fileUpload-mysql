<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<form action="upload" method="post" enctype="multipart/form-data">
		<input type="file" name="image" ><br><br>
		<input type="text" name="name"><br><br>
		<input type="submit">
		<br><br><br>
	</form>
	<%
		try
		{
			String name = request.getParameter("name");
			int id = Integer.parseInt(request.getParameter("id"));
			
			if(id==1)
			{
	%>
			<img src="FileUpload.jsp?name=<%=name %>" width="400px"/>
	<%
			}
		}
		catch(Exception e)
		{
			/* out.println(e); */
		}
	%>
</body>
</html>
	