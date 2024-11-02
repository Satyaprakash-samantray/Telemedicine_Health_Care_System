<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Appointment Booking System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('Image/image2.png'); /* Background image */
            background-size: cover; /* Cover the entire page */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent repeating */
            margin: 0;
            padding: 0;
        }
        .form-container {
            width: 45%;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            color: #495057;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 16px;
            color: #495057;
        }
        .form-group select {
            appearance: none;
        }
        .form-group button {
            width: 100%;
            padding: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
        .form-group .reset-button {
            background-color: #dc3545;
        }
        .form-group .reset-button:hover {
            background-color: #c82333;
        }
        @media (max-width: 768px) {
            .form-container {
                width: 80%;
            }
        }
        @media (max-width: 480px) {
            .form-container {
                width: 95%;
            }
        }
        .select-wrapper {
            position: relative;
        }
        .select-wrapper:after {
            content: '\25BC';
            position: absolute;
            right: 10px;
            top: calc(50% - 10px);
            pointer-events: none;
        }
        #speciality {
            padding-right: 30px;
        }
        img {
            height: 80px;
            padding: 10px;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const doctorDropdown = document.getElementById("doctor");
            const specialityDropdown = document.getElementById("speciality");
            const form = document.querySelector('form');
            
            const doctors = {
                "General Physician": ["Dr. Arjun Mehta", "Dr. Priya Kapoor", "Dr. Rohit Sharma", "Dr. Meena Desai", "Dr. Suresh Nair"],
                "Dentist": ["Dr. Sanjay Patel", "Dr. Neha Verma", "Dr. Rakesh Gupta", "Dr. Preeti Malhotra", "Dr. Anil Kumar"],
                "Cardiologist": ["Dr. Rajiv Singh", "Dr. Kavita Joshi", "Dr. Amit Agarwal", "Dr. Sunita Rao", "Dr. Manish Kapoor"],
                "Dermatologist": ["Dr. Rohan Malhotra", "Dr. Sneha Patel", "Dr. Vinay Sharma", "Dr. Anjali Sinha", "Dr. Kunal Mehra"],
                "Neurologist": ["Dr. Vishal Sinha", "Dr. Anita Reddy", "Dr. Deepak Bhattacharya", "Dr. Anu Kapoor", "Dr. Mukesh Pandey"]
            };

            function updateDoctorList() {
                var speciality = specialityDropdown.value;
                var selectedDoctors = doctors[speciality] || [];
                doctorDropdown.innerHTML = "";

                selectedDoctors.forEach(function (doctor) {
                    var option = document.createElement("option");
                    option.value = doctor;
                    option.textContent = doctor;
                    doctorDropdown.appendChild(option);
                });
            }

            specialityDropdown.addEventListener("input", function () {
                filterSpecialities();
                updateDoctorList();
            });

            function filterSpecialities() {
                var input = specialityDropdown.value.toUpperCase();
                var options = specialityDropdown.getElementsByTagName("option");

                for (var i = 0; i < options.length; i++) {
                    var txtValue = options[i].textContent || options[i].innerText;
                    if (txtValue.toUpperCase().indexOf(input) > -1) {
                        options[i].style.display = "";
                    } else {
                        options[i].style.display = "none";
                    }
                }
            }

            specialityDropdown.addEventListener("change", updateDoctorList);

            // Clear specialty and doctor selection on reset button click
            document.querySelector('.reset-button').addEventListener('click', function () {
                specialityDropdown.value = "";
                doctorDropdown.innerHTML = '<option value="" disabled selected>Select Doctor</option>';
            });

            // Confirmation before form submission
            form.addEventListener('submit', function (e) {
                const speciality = specialityDropdown.value;
                const doctor = doctorDropdown.value;

                if (!speciality || !doctor) {
                    alert("Please select both a specialty and a doctor.");
                    e.preventDefault();
                } else {
                    if (!confirm(`You have selected ${speciality} and Dr. ${doctor}. Do you want to proceed?`)) {
                        e.preventDefault();
                    }
                }
            });
        });
    </script>
</head>
<body>
    <div class="form-container">
    <center>
        <img src="Image/TrustLogo.jpg" alt="Trust Logo">
    </center>
        <h2>Book Your Appointment Here!</h2>
        <form action="scheduleAppointment.jsp" method="post">
            <div class="form-group">
                <label for="patientName">Patient Name</label>
                <input type="text" id="patientName" name="patientName" required>
            </div>
            <div class="form-group">
                <label for="patientAge">Patient Age</label>
                <input type="number" id="patientAge" name="patientAge" required>
            </div>
            <div class="form-group">
                <label for="email">Email ID</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile No</label>
                <input type="text" id="mobile" name="mobile" required>
            </div>
            <div class="form-group">
                <label for="appointmentDate">Appointment Date</label>
                <input type="date" id="appointmentDate" name="appointmentDate" required>
            </div>
            <div class="form-group">
                <label for="time">Select Time</label>
                <div style="display: flex; gap: 10px;">
                    <input type="time" id="time" name="time" required style="flex: 1;">
                    <select id="ampm" name="ampm" required style="width: 100px;">
                        <option value="AM">AM</option>
                        <option value="PM">PM</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="speciality">Select Specialty</label>
                <div class="select-wrapper">
                    <select id="speciality" name="speciality" required>
                        <option value="" disabled selected>Search or select specialty</option>
                        <option value="General Physician">General Physician</option>
                        <option value="Dentist">Dentist</option>
                        <option value="Cardiologist">Cardiologist</option>
                        <option value="Dermatologist">Dermatologist</option>
                        <option value="Neurologist">Neurologist</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="doctor">Select Doctor</label>
                <select id="doctor" name="doctor" required>
                    <option value="" disabled selected>Select Doctor</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit">Book Appointment</button>
                <button type="button" class="reset-button">Clear Specialty & Doctor</button>
            </div>
        </form>
    </div>
</body>
</html>
