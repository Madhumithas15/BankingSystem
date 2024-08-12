<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register Customer</title>
    <!-- Link to Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #f1f8e9); /* Smooth gradient */
            text-align: center;
            padding: 50px;
            margin: 0;
        }

        h2 {
            color: #333;
            font-size: 2.5em;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            animation: textGlow 2s ease-in-out infinite alternate;
        }

        form {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            display: inline-block;
            padding: 30px;
            margin-top: 30px;
            text-align: left;
            width: 400px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="date"],
        textarea,
        select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            background-color: #e9f5ff;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        textarea:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            display: inline-flex;
            align-items: center;
            text-decoration: none;
            color: #fff;
            background-color: #28a745;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            border: none;
            position: relative;
            overflow: hidden;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        input[type="submit"]::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.15);
            border-radius: inherit;
            transition: opacity 0.3s ease, transform 0.3s ease;
            opacity: 0;
            transform: translateX(-50%) skewX(-15deg);
        }

        input[type="submit"]:hover::before {
            opacity: 1;
            transform: translateX(150%) skewX(-15deg);
        }

        input[type="submit"]:hover {
            background-color: #218838;
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 8px 18px rgba(33, 136, 56, 0.4);
        }

        input[type="submit"]:active {
            transform: translateY(2px);
            box-shadow: 0 4px 8px rgba(33, 136, 56, 0.3);
        }

        @keyframes textGlow {
            from {text-shadow: 0 0 5px rgba(0, 0, 0, 0.2);}
            to {text-shadow: 0 0 15px rgba(0, 0, 0, 0.4);}
        }
        
        /* Icon Styling */
        .icon {
            font-size: 1.2em;
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <h2><i class="fas fa-user-plus icon"></i> Register Customer</h2>
    <form action="RegisterCustomerServlet" method="post">
        <label for="full_name"><i class="fas fa-user icon"></i> Full Name:</label>
        <input type="text" id="full_name" name="full_name"><br>
        <label for="address"><i class="fas fa-home icon"></i> Address:</label>
        <textarea id="address" name="address"></textarea><br>
        <label for="mobile_no"><i class="fas fa-phone icon"></i> Mobile No:</label>
        <input type="text" id="mobile_no" name="mobile_no"><br>
        <label for="email_id"><i class="fas fa-envelope icon"></i> Email ID:</label>
        <input type="text" id="email_id" name="email_id"><br>
        <label for="account_type"><i class="fas fa-briefcase icon"></i> Account Type:</label>
        <select id="account_type" name="account_type">
            <option value="Saving">Saving</option>
            <option value="Current">Current</option>
        </select><br>
        <label for="initial_balance"><i class="fas fa-dollar-sign icon"></i> Initial Balance:</label>
        <input type="text" id="initial_balance" name="initial_balance"><br>
        <label for="dob"><i class="fas fa-calendar-alt icon"></i> Date of Birth:</label>
        <input type="date" id="dob" name="date_of_birth"><br>
        <label for="id_proof"><i class="fas fa-id-card icon"></i> ID Proof:</label>
        <input type="text" id="id_proof" name="id_proof"><br>
        <input type="submit" value="Register">
    </form>
</body>
</html>
