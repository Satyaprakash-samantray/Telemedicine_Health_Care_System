<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Telemedicine and Healthcare</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background: #f4f4f9;
            overflow-x: hidden;
        }
        .navbar {
            background-color: #4CAF50;
            padding: 10px 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-sizing: border-box;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 0 15px;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
        .container {
            padding: 120px 15px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            box-sizing: border-box;
        }
        .profile-container {
            width: 100%;
            max-width: 700px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border: 1px solid #e1e5e8;
            box-sizing: border-box;
            margin: auto;
        }
        h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: 600;
        }
        .details {
            margin-top: 20px;
        }
        .details p {
            font-size: 16px;
            color: #333333;
            line-height: 1.6;
            margin: 10px 0;
        }
        .details strong {
            color: #4CAF50;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #0066cc;
            font-size: 16px;
            font-weight: 500;
        }
        a:hover {
            text-decoration: underline;
        }
        .error {
            color: #cc0000;
            font-size: 18px;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">
            <a href="#">Telemedicine and Healthcare</a>
        </div>
        <div class="navbar-links">
            <a href="uhome.jsp">Home</a>
            <a href="profile.jsp">Profile</a>
            <a href="appointment.jsp">Appointments</a>
            <a href="addMedicalRecord.jsp">Medical Records</a>
            <a href="aboutus.jsp">About us</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="profile-container">
            <h2>User Profile</h2>
            <%
                String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
                String dbUser = "system";
                String dbPassword = "system";

                // Fetch the patient's name from session
                String patientName = (String) session.getAttribute("patient_id");

                if (patientName != null) {
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("oracle.jdbc.OracleDriver");
                        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                        // Query to retrieve user details using patient name
                        String sql = "SELECT patient_name, patient_age, email, mobile FROM appointments WHERE patient_id = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, patientName);

                        rs = stmt.executeQuery();

                        if (rs.next()) {
                            String retrievedPatientName = rs.getString("patient_id");
                            int patientAge = rs.getInt("patient_age");
                            String email = rs.getString("email");
                            String mobile = rs.getString("mobile");
            %>
                            <div class="details">
                                <p><strong>Patient Name:</strong> <%= retrievedPatientName %></p>
                                <p><strong>Age:</strong> <%= patientAge %></p>
                                <p><strong>Email ID:</strong> <%= email %></p>
                                <p><strong>Mobile No:</strong> <%= mobile %></p>
                            </div>
            <%
                        } else {
            %>
                            <p class="error">User not found. Please ensure your id is correct.</p>
            <%
                        }
                    } catch (ClassNotFoundException e) {
            %>
                        <p class="error">Driver not found: <%= e.getMessage() %></p>
            <%
                    } catch (SQLException e) {
            %>
                        <p class="error">SQL Error: <%= e.getMessage() %></p>
            <%
                    } catch (Exception e) {
            %>
                        <p class="error">Error: <%= e.getMessage() %></p>
            <%
                    } finally {
                        try { if (rs != null) rs.close(); } catch (SQLException e) { }
                        try { if (stmt != null) stmt.close(); } catch (SQLException e) { }
                        try { if (conn != null) conn.close(); } catch (SQLException e) { }
                    }
                } else {
            %>
                    <p class="error">No patient id found in session. Please ensure you are logged in properly.</p>
            <%
                }
            %>

            <a href="uhome.jsp">Go back to Home</a>
        </div>
    </div>
</body>
</html>
