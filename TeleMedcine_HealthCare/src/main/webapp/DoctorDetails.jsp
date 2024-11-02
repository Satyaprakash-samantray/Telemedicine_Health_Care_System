<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meet Our Doctors</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            width: 90%;
            margin: 0 auto;
            padding: 20px 10px;
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .doctor-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            margin-bottom: 15px;
        }
        .doctor-image {
            width: 15%;
            height:20%;
            background-color: #f8f9fa;
        }
        .doctor-image img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        .doctor-details {
            width: 75%;
            padding: 15px;
        }
        .doctor-details h2 {
            color: #007bff;
            margin: 0;
            font-size: 20px;
        }
        .doctor-details p {
            margin: 8px 0;
            line-height: 1.5;
            font-size: 14px;
        }
        .specialty {
            font-weight: bold;
            color: #555;
        }
        @media (max-width: 768px) {
            .doctor-card {
                flex-direction: column;
            }
            .doctor-image, .doctor-details {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Meet Our Doctors</h1>
        <div class="doctor-card">
            <div class="doctor-image">
                <img src="Image/doctor2.jpeg" alt="Dr. Arjun Mehta">
            </div>
            <div class="doctor-details">
                <h2>Dr. Arjun Mehta</h2>
                <p class="specialty">Specialty: General Physician</p>
                <p>Qualifications: MBBS, MD (General Medicine)</p>
                <p>Experience: 10 years in diagnosing and treating a wide range of medical conditions, providing comprehensive care to patients.</p>
            </div>
        </div>
        <div class="doctor-card">
            <div class="doctor-image">
                <img src="Image/doctor1.jpg" alt="Dr. Priya Kapoor">
            </div>
            <div class="doctor-details">
                <h2>Dr. Priya Kapoor</h2>
                <p class="specialty">Specialty: General Physician</p>
                <p>Qualifications: MBBS, DNB (General Medicine)</p>
                <p>Experience: 8 years of experience in preventive care, patient education, and holistic treatment approaches.</p>
            </div>
        </div>
        <div class="doctor-card">
            <div class="doctor-image">
                <img src="Image/doctor3.jpg" alt="Dr. Rajiv Singh">
            </div>
            <div class="doctor-details">
                <h2>Dr. Rajiv Singh</h2>
                <p class="specialty">Specialty: Cardiologist</p>
                <p>Qualifications: MBBS, MD (Cardiology), DM (Cardiology)</p>
                <p>Experience: 15 years in treating heart-related conditions, performing complex procedures like angioplasty and heart surgeries.</p>
            </div>
        </div>
        <div class="doctor-card">
            <div class="doctor-image">
                <img src="Image/doctor4.jpg" alt="Dr. Rohan Malhotra">
            </div>
            <div class="doctor-details">
                <h2>Dr. Rohan Malhotra</h2>
                <p class="specialty">Specialty: Dermatologist</p>
                <p>Qualifications: MBBS, MD (Dermatology)</p>
                <p>Experience: 12 years of expertise in diagnosing and treating skin, hair, and nail disorders, with a focus on cosmetic dermatology.</p>
            </div>
        </div>
        <div class="doctor-card">
            <div class="doctor-image">
                <img src="Image/doctor5.jpg" alt="Dr. Vaishali Sinha">
            </div>
            <div class="doctor-details">
                <h2>Dr. Vaishali Sinha</h2>
                <p class="specialty">Specialty: Neurologist</p>
                <p>Qualifications: MBBS, MD (Neurology)</p>
                <p>Experience: 14 years in diagnosing and treating neurological conditions such as epilepsy, stroke, and Parkinson's disease.</p>
            </div>
        </div>
    </div>
</body>
</html>
