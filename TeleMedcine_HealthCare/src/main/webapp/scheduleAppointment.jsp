<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment Confirmation</title>
    <style>
        /* Your existing CSS styles */
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h2>Appointment Confirmation</h2>
        <%
            // Database connection details
            String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // Replace with your Oracle DB details
            String dbUser = "system"; // Replace with your Oracle username
            String dbPassword = "system"; // Replace with your Oracle password

            // Get form data
            String patientName = request.getParameter("patientName");
            String patientAge = request.getParameter("patientAge");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String appointmentDate = request.getParameter("appointmentDate");
            String appointmentTime = request.getParameter("time");
            String ampm = request.getParameter("ampm");
            String speciality = request.getParameter("speciality");
            String doctor = request.getParameter("doctor");

            boolean success = false;
            boolean doctorAvailable = false;

            try (
                Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                PreparedStatement checkAvailabilityStmt = conn.prepareStatement("SELECT COUNT(*) FROM appointments WHERE doctor = ? AND appointment_date = TO_DATE(?, 'YYYY-MM-DD') AND appointment_time = ? AND ampm = ?");
            ) {
                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.OracleDriver");

                // Check if the doctor is available
                checkAvailabilityStmt.setString(1, doctor);
                checkAvailabilityStmt.setString(2, appointmentDate);
                checkAvailabilityStmt.setString(3, appointmentTime);
                checkAvailabilityStmt.setString(4, ampm);
                
                try (ResultSet rs = checkAvailabilityStmt.executeQuery()) {
                    if (rs.next() && rs.getInt(1) == 0) {
                        doctorAvailable = true;
                    }
                }

                if (doctorAvailable) {
                    // SQL query to insert data into the appointments table
                    String sql = "INSERT INTO appointments (PATIENT_ID, PATIENT_NAME, PATIENT_AGE, EMAIL, MOBILE, APPOINTMENT_DATE, APPOINTMENT_TIME, AMPM, SPECIALITY, DOCTOR) " +
                                 "VALUES (patient_id_seq.NEXTVAL, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?)";

                    try (PreparedStatement insertStmt = conn.prepareStatement(sql)) {
                        // Set the parameters
                        insertStmt.setString(1, patientName);
                        insertStmt.setInt(2, Integer.parseInt(patientAge));
                        insertStmt.setString(3, email);
                        insertStmt.setString(4, mobile);
                        insertStmt.setString(5, appointmentDate);
                        insertStmt.setString(6, appointmentTime);
                        insertStmt.setString(7, ampm);
                        insertStmt.setString(8, speciality);
                        insertStmt.setString(9, doctor);

                        // Execute the query
                        int rows = insertStmt.executeUpdate();

                        if (rows > 0) {
                            success = true;
                        } else {
                            throw new SQLException("No rows affected in the insert operation.");
                        }
                    }
                }
            } catch (ClassNotFoundException e) {
                out.println("<h3 class='error'>Driver not found: " + e.getMessage() + "</h3>");
            } catch (SQLException e) {
                out.println("<h3 class='error'>SQL Error: " + e.getMessage() + "</h3>");
            } catch (Exception e) {
                out.println("<h3 class='error'>Error: " + e.getMessage() + "</h3>");
            }
        %>

        <%
            if (success && doctorAvailable) {
        %>
            <div class="details">
                <h3>Your appointment has been successfully booked!</h3>
                <p><strong>Patient Name:</strong> <%= patientName %></p>
                <p><strong>Age:</strong> <%= patientAge %></p>
                <p><strong>Email ID:</strong> <%= email %></p>
                <p><strong>Mobile No:</strong> <%= mobile %></p>
                <p><strong>Appointment Date:</strong> <%= appointmentDate %></p>
                <p><strong>Appointment Time:</strong> <%= appointmentTime %> <%= ampm %></p>
                <p><strong>Specialty:</strong> <%= speciality %></p>
                <p><strong>Doctor:</strong> <%= doctor %></p>
            </div>
        <%
            } else if (!doctorAvailable) {
        %>
            <h3 class='error'>The selected doctor is not available at the chosen time. Please select a different time or doctor.</h3>
        <%
            } else {
        %>
            <h3 class='error'>Error: Appointment could not be booked. Please try again.</h3>
        <%
            }
        %>

        <a href="appointment.jsp">Go back to the booking page</a>
    </div>
</body>
</html>
