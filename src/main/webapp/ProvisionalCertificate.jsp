<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import = "java.sql.*"%>
  <%@page import = "java.io.*" %>
  <%@page import = "jakarta.servlet.http.*" %>
  <%@page import = "jakarta.servlet.*" %>
  <%@page import = "DataBase.MyListener" %>
  <%@page import = "Student.StudentLogin" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Final Result</title>
<link rel = "icon" href = "Images\logo.jpg">
<link rel = "stylesheet" href = "CSS\ProvisionalCertificate.css">
</head>
<body>
<center>
<div>
  <img src = "Images\UniversityLogo.gif">
<form class = "container">
<h2>Provisional Certificate</h2>
<img src="Images\Student.png" style = "width:80px; height:80px;">
<%
    Connection con;
	ServletContext sc = getServletContext();
	con = (Connection)sc.getAttribute("database");
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from student natural join finalresult where Roll_No =?");
			String RollNo = StudentLogin.getRollNo();
			pstmt.setString(1,RollNo);
			ResultSet rs = pstmt.executeQuery();
			ResultSetMetaData rm = rs.getMetaData();
			int k = rm.getColumnCount();
			while(rs.next())
			{
				for(int i=1;i<=k;i++)
				{%>
				  <table>
				  <tr>
				     <th class="label"><%=rm.getColumnName(i)%></th>
				     <td><input type = "text" value = "<%=rs.getString(i)%>" readonly></td>
				   </tr>
				  </table>
				<%}
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
%>
<br>
<span>Back to Home Page : </span>
<button><a href = "SYears.html"> Back</a></button>
</form>
</div>
</center>
</body>
</html>