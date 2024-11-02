<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Database connection details
    String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // Replace with your Oracle DB details
    String dbUser = "system"; // Replace with your Oracle username
    String dbPassword = "system"; // Replace with your Oracle password

    // Get patient ID
    String patientId = request.getParameter("patientId");

    if (patientId == null || patientId.isEmpty()) {
        out.println("<h3>No patient ID provided.</h3>");
    } else {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.OracleDriver");

            // Establish the connection
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // SQL query to retrieve medical records for the given patient ID
            String sql = "SELECT record_id, record_date, record_details FROM medical_records WHERE patient_id = ? ORDER BY record_date DESC";

            // Prepare the statement
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(patientId));

            // Execute the query
            rs = pstmt.executeQuery();

            // Display the records
            out.println("<h3>Medical Records for Patient ID: " + patientId + "</h3>");
            out.println("<table border='1'>");
            out.println("<tr><th>Record ID</th><th>Date</th><th>Details</th></tr>");

            while (rs.next()) {
                int recordId = rs.getInt("record_id");
                Date recordDate = rs.getDate("record_date");
                String recordDetails = rs.getString("record_details");

                out.println("<tr><td>" + recordId + "</td><td>" + recordDate + "</td><td>" + recordDetails + "</td></tr>");
            }

            out.println("</table>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            // Close resources
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>

<a href="medical_record.jsp">View another patient's records</a>
