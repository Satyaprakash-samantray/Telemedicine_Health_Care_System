<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Telemedicine and Healthcare</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background: #f4f4f9;
            color: #333;
        }

        header {
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .navbar {
            background-color: #4CAF50;
            padding: 10px 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand a {
            color: white;
            text-decoration: none;
            font-size: 24px;
            font-weight: bold;
        }

        .navbar-links a {
            color: white;
            text-decoration: none;
            padding: 0 15px;
            font-size: 18px;
        }

        .navbar-links a:hover {
            text-decoration: underline;
        }

        .container {
            padding: 100px 20px 20px;
        }

        .hero {
            text-align: center;
            margin-bottom: 40px;
        }

        .hero h1 {
            font-size: 36px;
            color: #4CAF50;
            margin: 0;
        }

        .hero p {
            font-size: 18px;
            color: #666;
        }

        .content {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 1s ease, transform 1s ease;
        }

        .card h2 {
            margin-top: 0;
            color: #4CAF50;
        }

        .card ul {
            list-style-type: disc;
            padding-left: 20px;
        }

        .card ul li {
            margin-bottom: 10px;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        footer p {
            margin: 0;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="navbar-brand">
                <a href="uhome.jsp">Telemedicine and Healthcare</a>
            </div>
            <div class="navbar-links">
                <a href="uhome.jsp">Home</a>
                <a href="about.html">Services</a>
                <a href="contactus.jsp">Contact</a>
                <a href="ulogin.jsp">Logout</a>
            </div>
        </nav>
    </header>

    <main class="container">
        <section class="hero">
            <h1>About Us</h1>
            <p>At Telemedicine and Healthcare, we are dedicated to providing innovative and accessible healthcare solutions to improve the quality of life for individuals worldwide.</p>
        </section>

        <section class="content">
            <div class="card">
                <h2>Our Mission</h2>
                <p>Our mission is to revolutionize healthcare by leveraging cutting-edge technology to make medical services more accessible, efficient, and patient-centered. We strive to bridge the gap between patients and healthcare providers through our telemedicine platform.</p>
            </div>
            <div class="card">
                <h2>Why Health Matters</h2>
                <ul>
                    <li><strong>Prevention and Early Detection:</strong> Regular health screenings and check-ups help in early diagnosis and prevention of serious conditions.</li>
                    <li><strong>Access to Quality Care:</strong> Telemedicine provides access to quality healthcare services even in remote or underserved areas.</li>
                    <li><strong>Convenience:</strong> Patients can consult with doctors from the comfort of their homes, saving time and reducing travel stress.</li>
                    <li><strong>Continuity of Care:</strong> Ongoing management of chronic conditions is easier with regular virtual follow-ups and monitoring.</li>
                    <li><strong>Cost-Effective:</strong> Reduces the need for unnecessary hospital visits and cuts down on overall healthcare costs.</li>
                </ul>
            </div>
            <div class="card">
                <h2>Our Team</h2>
                <p>Our team comprises experienced healthcare professionals and technology experts who are committed to improving patient care through innovative solutions. We work collaboratively to ensure that our telemedicine platform meets the highest standards of quality and reliability.</p>
                <ul>
                    <li><strong>Doctors:</strong> Certified and experienced professionals providing consultations and medical advice.</li>
                    <li><strong>Technologists:</strong> Engineers and developers ensuring the platform is user-friendly and secure.</li>
                    <li><strong>Support Staff:</strong> Dedicated to assisting patients and ensuring smooth operation of our services.</li>
                </ul>
            </div>
            <div class="card">
                <h2>Our Values</h2>
                <ul>
                    <li><strong>Integrity:</strong> We uphold the highest ethical standards in all our interactions.</li>
                    <li><strong>Innovation:</strong> We continuously seek to improve and advance our services through technology.</li>
                    <li><strong>Compassion:</strong> We care about the well-being of our patients and strive to provide empathetic support.</li>
                    <li><strong>Excellence:</strong> We are committed to delivering the highest quality of healthcare services.</li>
                </ul>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Telemedicine and Healthcare. All rights reserved.</p>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.card');
            cards.forEach((card, index) => {
                setTimeout(() => {
                    card.style.opacity = 1;
                    card.style.transform = 'translateY(0)';
                }, index * 300);
            });
        });
    </script>
</body>
</html>
