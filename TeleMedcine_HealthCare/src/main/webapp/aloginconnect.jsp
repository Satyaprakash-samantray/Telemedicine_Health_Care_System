<%@page import="javax.servlet.RequestDispatcher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<%@ page import="java.sql.*" %>
	<%
		String s1 = request.getParameter("uname");
		String s2 = request.getParameter("pass");
		
		//To load and register the driver(Type-4 driver)
		Class.forName("oracle.jdbc.OracleDriver");
						
		//Establish the connection
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		
		// Check if parameters are not null and have expected values
		if ("raja098".equals(s1) && "raja#".equals(s2)) {
			response.sendRedirect("ahome.jsp");
		} else {
			out.print("Sorry! Invalid credentials");
			RequestDispatcher rd = request.getRequestDispatcher("alogin.jsp");
			rd.include(request, response);
		}
	%>
</body>
</html>
