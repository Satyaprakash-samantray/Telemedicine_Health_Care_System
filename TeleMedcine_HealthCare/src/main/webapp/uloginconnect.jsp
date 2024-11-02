<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String s1 = request.getParameter("email");
    String s2 = request.getParameter("pass");
    boolean loginSuccess = false;

    try {
        // Load and register the driver (Type-4 driver)
        Class.forName("oracle.jdbc.OracleDriver");

        // Establish the connection
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

        // Create the statement object
        Statement st = con.createStatement();

        // Execute the query
        ResultSet rs = st.executeQuery("select * from record where email='" + s1 + "' and pass='" + s2 + "' ");
        if (rs.next()) {
            loginSuccess = true;
            response.sendRedirect("uhome.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            RequestDispatcher rd = request.getRequestDispatcher("ulogin.jsp");
            rd.forward(request, response);
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
