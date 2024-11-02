<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Medical Records</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }
        .records-container {
            width: 70%;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #e1e5e8;
        }
        h2 {
            text-align: center;
            color: #003366;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #e1e5e8;
            text-align: left;
        }
        th {
            background-color: #003366;
            color: #ffffff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #0066cc;
            font-size: 16px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="records-container">
        <h2>Medical Records</h2>
        <%
            // Database connection details
            String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // Replace with your Oracle DB details
            String dbUser = "system"; // Replace with your Oracle username
            String dbPassword = "system"; // Replace with your Oracle password

            // Get the patient ID from request parameters
            String patientId = request.getParameter("patientId");

            // Validate patient ID
            if (patientId == null || patientId.isEmpty()) {
                out.println("<p class='error'>No patient ID provided.</p>");
                return;
            }

            // SQL query to retrieve medical records for the patient
            String sql = "SELECT record_id, record_date, record_details FROM medical_records WHERE patient_id = ? ORDER BY record_date DESC";

            // Use try-with-resources to ensure resources are closed
            try (
                Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                PreparedStatement pstmt = conn.prepareStatement(sql)
            ) {
                pstmt.setInt(1, Integer.parseInt(patientId));
                
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
        %>
                        <table>
                            <tr>
                                <th>Record ID</th>
                                <th>Date</th>
                                <th>Details</th>
                            </tr>
                            <%
                                do {
                            %>
                                <tr>
                                    <td><%= rs.getInt("record_id") %></td>
                                    <td><%= rs.getDate("record_date") %></td>
                                    <td><%= rs.getString("record_details") %></td>
                                </tr>
                            <%
                                } while (rs.next());
                            %>
                        </table>
                    <%
                    } else {
                        out.println("<p>No medical records found for this patient.</p>");
                    }
                }
            } catch (SQLException e) {
                out.println("<p class='error'>SQL Error: " + e.getMessage() + "</p>");
            } catch (Exception e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            }
        %>

        <a href="viewRecord.jsp">Go back to the booking page</a>
    </div>
</body>
</html>
