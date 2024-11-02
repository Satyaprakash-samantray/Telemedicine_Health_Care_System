<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Database connection details
    String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // Replace with your Oracle DB details
    String dbUser = "system"; // Replace with your Oracle username
    String dbPassword = "system"; // Replace with your Oracle password

    // Get form data
    String patientId = request.getParameter("patientId");
    String recordDate = request.getParameter("recordDate");
    String recordDetails = request.getParameter("recordDetails");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.OracleDriver");

        // Establish the connection
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // SQL query to insert data into the medical_records table
        String sql = "INSERT INTO medical_records (record_id, patient_id, record_date, record_details) VALUES (medical_records_seq.nextval, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";

        // Prepare the statement
        pstmt = conn.prepareStatement(sql);

        // Set the parameters
        pstmt.setInt(1, Integer.parseInt(patientId));
        pstmt.setString(2, recordDate);
        pstmt.setString(3, recordDetails);

        // Execute the query
        int rows = pstmt.executeUpdate();

        // Check if insert was successful
        if (rows > 0) {
            out.println("<h3>Medical record added successfully!</h3>");
        } else {
            out.println("<h3>Error: Medical record could not be added. Please try again.</h3>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        // Close resources
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

<a href="">Add another record</a>
