<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*" %>
<%
    String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; 
    String dbUser = "system"; 
    String dbPassword = "system"; 

    String userId = "1"; 

    String savePath = "uploads"; // Directory to save the uploaded file
    String fileName = ""; 

    try {
        Part filePart = request.getPart("profilePic"); 
        fileName = filePart.getSubmittedFileName();
        String fullSavePath = getServletContext().getRealPath("/") + savePath;
        File fileSaveDir = new File(fullSavePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        filePart.write(fullSavePath + File.separator + fileName);

        String filePath = savePath + File.separator + fileName;

        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
             PreparedStatement stmt = conn.prepareStatement("UPDATE users SET profile_pic = ? WHERE id = ?")) {

            stmt.setString(1, filePath);
            stmt.setString(2, userId);
            stmt.executeUpdate();
        }
    } catch (Exception e) {
        out.println("File upload failed: " + e.getMessage());
    }

    response.sendRedirect("profile.jsp");
%>
