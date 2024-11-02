<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Telemedicine and Healthcare</title>
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
        .container {
            padding: 100px 20px;
            text-align: center;
        }
        .contact-form {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        .contact-form h2 {
            margin-top: 0;
            color: #4CAF50;
            animation: fadeIn 2s ease-in-out;
        }
        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .contact-form button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .contact-form button:hover {
            background-color: #45a049;
        }
        .repeating-content {
            width: 100%;
            overflow: hidden;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            box-sizing: border-box;
            position: relative;
            margin-top: 30px;
        }
        .repeating-content div {
            display: inline-block;
            white-space: nowrap;
            padding-left: 100%;
            animation: marquee 15s linear infinite;
            font-size: 18px;
            line-height: 1.5;
        }
        .contact-info {
            margin-top: 40px;
        }
        .contact-info h3 {
            color: #4CAF50;
        }
        .contact-info p {
            margin: 5px 0;
            color: #666;
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
            <a href="#">Appointments</a>
            <a href="DoctorDetails.jsp">Doctors</a>
            <a href="aboutus.jsp">About Us</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </div>

    <div class="container">
        <div class="contact-form">
            <h2>Contact Us</h2>
            <form id="contactForm">
                <input type="text" id="name" name="name" placeholder="Your Name" required>
                <input type="email" id="email" name="email" placeholder="Your Email" required>
                <textarea id="message" name="message" rows="5" placeholder="Your Message" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>

        <div class="contact-info">
            <h3>Our Contact Details</h3>
            <p><strong>Email:</strong> support@telemedicine.com</p>
            <p><strong>Phone:</strong> +1-234-567-8901</p>
            <p><strong>Address:</strong> 123 Health St, Wellness City, HC 45678</p>
        </div>

        <div class="repeating-content">
            <div>
                <p>We are here to help you with any queries. Feel free to reach out to us anytime!</p>
                <p>For urgent matters, please contact us via phone. Our support team is available 24/7.</p>
                <p>We value your feedback. Let us know how we can improve our services for you.</p>
            </div>
        </div>
    </div>

    <script>
        // JavaScript to handle form submission (for demonstration purposes, no actual form processing)
        document.getElementById('contactForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form from submitting
            alert('Thank you for your message. We will get back to you soon!');
        });
    </script>
</body>
</html>
