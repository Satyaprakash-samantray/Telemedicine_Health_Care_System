<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Admin – JobSeeker Profile </title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>Administrator</h1>
<% 
String username = (String) session.getAttribute("username");
String usertype = (String) session.getAttribute("usertype");
if (username == null || !"admin".equals(usertype)) {
    response.sendRedirect("index.jsp");
}
%>
<p style="text-align:right;"> Welcome <%= username %>    <a href="logout.jsp"> Logout </a></p>
<jsp:include page="adminmenu.jsp"/>
<fieldset>
<legend>Profile Details</legend>
<%
String user = request.getParameter("user");

Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521";
    con = DriverManager.getConnection(url, "system", "system");
    stmt = con.createStatement();
    rs = stmt.executeQuery("select * from jobseekerprofile where username='" + user + "'");

    if (rs.next()) {
%>
<table>
<tr><td>Username: </td><td><%= rs.getString("username") %></td></tr>
<tr><td>Full Name: </td><td><%= rs.getString("fullname") %></td></tr>
<tr><td>Email: </td><td><%= rs.getString("email") %></td></tr>
<tr><td>Address: </td><td><%= rs.getString("address") %></td></tr>
<tr><td>Phone: </td><td><%= rs.getString("phone") %></td></tr>
</table>
<%
    }
} finally {
    if (rs != null) rs.close();
    if (stmt != null) stmt.close();
    if (con != null) con.close();
}
%>
</fieldset>
<jsp:include page="footer.jsp"/>
</body>
</html>
