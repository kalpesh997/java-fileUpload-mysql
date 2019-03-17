<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Marks</title>
</head>
<body>
<h2>Student Grading System</h2>
<form action="" method="post">
<table>
<tr>
<td></td>
<td>
Select Course <select name="course">
<option value="select">select</option>
<option value="MCA">MCA</option>
<option value="BCA">BCA</option>
</select>
</td>
</tr>
</table>
<table>
<tr>
<th>Subject</th>
<th>Obtained Marks</th>
<th>Total Marks</th>
</tr>
<tr>
<td align="center">C</td>
<td align="center"><input type="text" size="5" name="c"/></td>
<td align="center">100</td>
</tr>
<tr>
<td align="center">Java</td>
<td align="center"><input type="text" size="5" name="java"/></td>
<td align="center">100</td>
</tr>
<tr>
<td align="center">.Net</td>
<td align="center"><input type="text" size="5" name="net"/></td>
<td align="center">100</td>
</tr>
<tr>
<td align="center">VB</td>
<td align="center"><input type="text" size="5" name="vb"/></td>
<td align="center">100</td>
</tr>
<tr>
<td align="center">DBMS</td>
<td align="center"><input type="text" size="5" name="dbms"/></td>
<td align="center">100</td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td></td>
</tr>
<tr><td></td><td align="center"><input type="submit" value="submit"/></td></tr>
</table>
</form>
<%
String c = request.getParameter("c");
String j = request.getParameter("java");
String n = request.getParameter("net");
String v = request.getParameter("vb");
String d = request.getParameter("dbms");
int percent;
if(!(c == null || c.isEmpty()))
{
    int cmarks = Integer.parseInt(c);
    int jmarks = Integer.parseInt(j);
    int nmarks = Integer.parseInt(n);
    int vmarks = Integer.parseInt(v);
    int dmarks = Integer.parseInt(d);

    int total = cmarks+jmarks+nmarks+vmarks+dmarks;
    int avg = (total)/5;
    percent = avg;
    String grade ="";

    if(percent < 40){
        grade = "E";
        //request.setAttribute("grade", grade);
    }
    else if(percent >= 40 && percent <=44){
        grade = "D";
    }
    else if(percent >=45 && percent <=49){
        grade = "D+";
    }
    else if(percent >=50 && percent <=54){
        grade = "C-";
    }
    else if(percent >=55 && percent<=59){
        grade = "C";
    }
    else if(percent >=60 && percent <=64){
        grade = "C+";
    }
    else if(percent >=65 && percent<=69){
        grade = "B-";
    }
    else if(percent >=70 && percent <=74){
        grade = "B";
    }
    else if(percent >=75 && percent <=79){
        grade = "B+";
    }
    else if(percent >=80 && percent <=84){
        grade = "A";
    }
    else if (percent >=85 && percent <=100){
        grade = "A+";
    }
    request.setAttribute("Grade", grade);
    %>    
    <table>
    <tr>
    <td><b>Course</b></td><td></td>
    <td align="center"><%=request.getParameter("course") %>
    </tr>
    <tr>
    <td><b>Aggregate Marks</b></td><td></td>
    <td align="center"><%=total %></td>
    </tr>
    <tr>
    <td><b>PerventageAggregate Marks</b></td><td></td>
    <td align="center"><%=percent %></td>
    </tr>
    <tr>
    <td><b>Grade</b></td><td></td>
    <td align="center"><%=grade %></td>    
    </tr>
    </table>
    <%    
}
%>

</body>
</html>