<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
	String s1=request.getParameter("name");
	String s2=request.getParameter("email");
	String s3=request.getParameter("uname");
	String s4=request.getParameter("pass");
	
	int k=0;

    //String dbURL = "jdbc:oracle:thin:@localhost:1521:xe"; // Update with your DB URL
    //String dbUser = "system"; // Update with your DB user
    //String dbPass = "system"; // Update with your DB password

    Connection connection = null;
    PreparedStatement statement = null;
    //ResultSet resultSet = null;
    //boolean isValidUser = false;

    try {
        Class.forName("oracle.jdbc.OracleDriver");
        connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");

        String sql = "insert into record values(?,?,?,?)";
        statement = connection.prepareStatement(sql);
        statement.setString(1, s1);
        statement.setString(2, s2);
        statement.setString(3, s3);
        statement.setString(4, s4);

        //resultSet = statement.executeQuery();

		k=statement.executeUpdate();
		
		if(k>0)
		{
			out.println("hello");
			response.sendRedirect("welcome1.jsp");
		}
		else {
	        out.println("Invalid username or password");
	    }
		
	}
	catch(Exception e) 
	{
		e.printStackTrace();
	}
%>
</body>
</html>