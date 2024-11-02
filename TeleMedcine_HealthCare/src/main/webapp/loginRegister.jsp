<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 20px 30px; /* Reduced padding to decrease height */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px; /* Keeping the original width */
        }
        .logo {
            margin-bottom: 10px; /* Reduced margin */
        }
        .logo img {
            width: 80px; /* Reduced logo size */
            height: auto;
        }
        h1 {
            color: #4CAF50;
            font-size: 22px; /* Slightly smaller font size */
            margin-bottom: 10px; /* Reduced margin */
        }
        p {
            font-size: 16px; /* Slightly smaller font size */
            color: #333333;
            margin-bottom: 15px; /* Reduced margin */
        }
        a {
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px; /* Slightly reduced padding */
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="Image/TrustLogo.jpg" alt="Trust Logo">
        </div>
        <h1>Thank You for Registering!</h1>
        <p>Your account has been successfully created.</p>
        <p><a href="ulogin.jsp">Click here to login</a></p>
    </div>
</body>
</html>
