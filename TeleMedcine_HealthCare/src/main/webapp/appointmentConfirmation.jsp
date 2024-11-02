<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }
        .confirmation-container {
            width: 50%;
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
            margin-bottom: 20px;
        }
        .details {
            margin-top: 20px;
        }
        .details p {
            font-size: 16px;
            color: #333333;
            line-height: 1.6;
        }
        .details strong {
            color: #003366;
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
        .error {
            color: #cc0000;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h2>Appointment Confirmation</h2>
        <%
            Boolean success = (Boolean) request.getAttribute("success");
            Boolean doctorAvailable = (Boolean) request.getAttribute("doctorAvailable");

            if (success != null && doctorAvailable != null) {
                if (success && doctorAvailable) {
        %>
                    <div class="details">
                        <h3>Your appointment has been successfully booked!</h3>
                        <p><strong>Patient Name:</strong> <%= request.getAttribute("patientName") %></p>
                        <p><strong>Age:</strong> <%= request.getAttribute("patientAge") %></p>
                        <p><strong>Email ID:</strong> <%= request.getAttribute("email") %></p>
                        <p><strong>Mobile No:</strong> <%= request.getAttribute("mobile") %></p>
                        <p><strong>Appointment Date:</strong> <%= request.getAttribute("appointmentDate") %></p>
                        <p><strong>Appointment Time:</strong> <%= request.getAttribute("appointmentTime") %> <%= request.getAttribute("ampm") %></p>
                        <p><strong>Specialty:</strong> <%= request.getAttribute("speciality") %></p>
                        <p><strong>Doctor:</strong> <%= request.getAttribute("doctor") %></p>
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
            } else {
        %>
            <h3 class='error'>Error: Invalid session data. Please try booking again.</h3>
        <%
            }
        %>
        <a href="appointment.jsp">Go back to the booking page</a>
    </div>
</body>
</html>
