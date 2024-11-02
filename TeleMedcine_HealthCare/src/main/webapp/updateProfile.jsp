<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; 
    String dbUser = "system"; 
    String dbPassword = "system"; 

    String userId = "1"; 

    String userName = request.getParameter("name");
    String userEmail = request.getParameter("email");
    String userMobile = request.getParameter("mobile");

    try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
         PreparedStatement stmt = conn.prepareStatement("UPDATE users SET name = ?, email = ?, mobile = ? WHERE id = ?")) {

        stmt.setString(1, userName);
        stmt.setString(2, userEmail);
        stmt.setString(3, userMobile);
        stmt.setString(4, userId);
        stmt.executeUpdate();
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
    }

    response.sendRedirect("profile.jsp");
%>
