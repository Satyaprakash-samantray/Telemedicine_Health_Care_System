<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home - Telemedicine and Healthcare</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background: #f4f4f9;
            overflow-x: hidden; /* Prevent horizontal scroll */
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
        .navbar-brand {
            font-size: 18px;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 0 10px;
            font-size: 16px;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
        .search-bar {
            display: flex;
            align-items: center;
            background-color: white;
            border-radius: 5px;
            padding: 5px;
            margin-right: 20px;
        }
        .search-bar input {
            border: none;
            padding: 5px;
            outline: none;
            border-radius: 5px;
            width: 200px;
        }
        .search-bar button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-bar button:hover {
            background-color: #45a049;
        }
        .navbar-links {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
        }
        .navbar-links a {
            margin-left: 10px;
        }
        .container {
            padding: 100px 20px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .welcome {
            text-align: center;
            margin-bottom: 40px;
        }
        .welcome h1 {
            margin: 0;
            color: #333;
            animation: fadeIn 2s ease-in-out;
        }
        .welcome p {
            color: #666;
            animation: fadeIn 3s ease-in-out;
        }
        .dashboard {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            animation: slideIn 2s ease-out;
        }
        .card {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            transition: transform 0.2s;
            animation: fadeInUp 1s ease-in-out;
        }
        .card:hover {
            transform: translateY(-5px);
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
        .notifications {
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
        }
        .notification {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .notification:last-child {
            border-bottom: none;
        }
        .notification p {
            margin: 0;
            color: #666;
        }
        .marquee {
            width: 100%;
            overflow: hidden;
            position: relative;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            box-sizing: border-box;
            text-align: center;
        }
        .marquee div {
            display: inline-block;
            white-space: nowrap;
            padding-left: 100%;
            animation: marquee 4s linear infinite;
        }
        @keyframes marquee {
            from {
                transform: translateX(100%);
            }
            to {
                transform: translateX(-100%);
            }
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
    <script>
        function confirmLogout(event) {
            event.preventDefault(); // Prevent default link behavior
            var userConfirmed = confirm("Are you sure you want to log out?");
            if (userConfirmed) {
                window.location.href = "ulogin.jsp"; // Redirect to ulogin.jsp
            }
        }
    </script>
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">
            <a href="uhome.jsp">Telemedicine and Healthcare</a>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Search...">
            <button type="submit">Search</button>
        </div>
        <div class="navbar-links">
            <a href="uhome.jsp">Home</a>
            <a href="profile.jsp">Profile</a>
            <a href="appointment.jsp">Appointments</a>
            <a href="DoctorDetails.jsp">Doctors</a>
            <a href="aboutus.jsp">About Us</a>
            <a href="contactus.jsp">Contact</a>
            <a href="ulogin.jsp" id="logoutLink" onclick="confirmLogout(event)">Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="welcome">
            <h1>Welcome, User</h1>
            <p>Your health, our priority. Manage your healthcare services efficiently.</p>
        </div>

        <div class="dashboard">
            <div class="card">
                <h3>Schedule Appointment</h3>
                <p>Book an appointment with your doctor.</p>
                <a href="appointment.jsp">Book Now</a>
            </div>
            <div class="card">
                <h3>Medical Records</h3>
                <p>View your medical history and records.</p>
                <a href="addMedicalRecord.jsp">View Records</a>
            </div>
            <div class="card">
                <h3>Prescriptions</h3>
                <p>Access your prescribed medicines.</p>
                <a href="message.jsp">View Prescriptions</a>
            </div>
            <div class="card">
                <h3>Consultations</h3>
                <p>Join a virtual consultation with a doctor.</p>
                <a href="vediodesign.jsp">Start Consultation</a>
            </div>
        </div>

        <div class="notifications">
            <h2>Notifications</h2>
            <div class="notification">
                <p>Your appointment with Dr. Smith is confirmed for tomorrow at 10 AM.</p>
            </div>
            <div class="notification">
                <p>You have a new prescription available in your account.</p>
            </div>
        </div>
    </div>

    <div class="marquee">
        <div>
            <p>Stay updated with the latest health tips and news. Health is wealth! Regular check-ups are important. Don't miss your next appointment!</p>
        </div>
    </div>
</body>
</html>
