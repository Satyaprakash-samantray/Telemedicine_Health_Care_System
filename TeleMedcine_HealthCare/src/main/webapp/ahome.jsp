<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home - Telemedicine and Healthcare</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background: #f4f4f9;
        }
        .navbar {
            background-color: #4CAF50;
            padding: 10px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
            padding: 20px;
        }
        .welcome {
            text-align: center;
            margin-bottom: 40px;
        }
        .welcome h1 {
            margin: 0;
            color: #333;
        }
        .dashboard {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .card {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .card h3 {
            margin-top: 0;
            color: #333;
        }
        .card p {
            margin: 10px 0;
            color: #666;
        }
        .card a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .card a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">
            <a href="#">Telemedicine and Healthcare (Admin Page)</a>
        </div>
        <div class="navbar-links">
            <a href="#">Dashboard</a>
            <a href="#">Manage Users</a>
            <a href="#">Appointments</a>
            <a href="#">Settings</a>
            <a href="#">Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="welcome">
            <h1>Welcome, Admin</h1>
            <p>Manage your Telemedicine and Healthcare system efficiently.</p>
        </div>

        <div class="dashboard">
            <div class="card">
                <h3>Users</h3>
                <p>Manage all the users of the system.</p>
                <a href="#">View Users</a>
            </div>
            <div class="card">
                <h3>Appointments</h3>
                <p>Manage scheduled appointments.</p>
                <a href="#">View Appointments</a>
            </div>
            <div class="card">
                <h3>Doctors</h3>
                <p>Manage the doctors in the system.</p>
                <a href="#">View Doctors</a>
            </div>
            <div class="card">
                <h3>Settings</h3>
                <p>Configure system settings.</p>
                <a href="#">View Settings</a>
            </div>
        </div>
    </div>
</body>
</html>