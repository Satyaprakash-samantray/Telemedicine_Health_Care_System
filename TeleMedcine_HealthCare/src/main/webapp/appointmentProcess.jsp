<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
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
            String sql = "INSERT INTO appointments (patient_name, patient_age, email, mobile, appointment_date, appointment_time, ampm, speciality, doctor) VALUES (?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?)";

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
        request.setAttribute("error", "Driver not found: " + e.getMessage());
    } catch (SQLException e) {
        request.setAttribute("error", "SQL Error: " + e.getMessage());
    } catch (Exception e) {
        request.setAttribute("error", "Error: " + e.getMessage());
    }

    // Set attributes for success and doctor availability
    request.setAttribute("success", success);
    request.setAttribute("doctorAvailable", doctorAvailable);
    request.setAttribute("patientName", patientName);
    request.setAttribute("patientAge", patientAge);
    request.setAttribute("email", email);
    request.setAttribute("mobile", mobile);
    request.setAttribute("appointmentDate", appointmentDate);
    request.setAttribute("appointmentTime", appointmentTime);
    request.setAttribute("ampm", ampm);
    request.setAttribute("speciality", speciality);
    request.setAttribute("doctor", doctor);

    // Forward to the confirmation page
    request.getRequestDispatcher("appointmentConfirmation.jsp").forward(request, response);
%>
