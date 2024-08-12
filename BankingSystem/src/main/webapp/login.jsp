<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <!-- Link to Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        /* Body Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #a8e6cf, #dcedc1); /* Initial background */
            text-align: center;
            padding: 50px;
            animation: backgroundAnimation 10s infinite alternate;
            margin: 0;
        }

        /* Heading Style */
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

        /* Form Styling */
        form {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.15);
            display: inline-block;
            padding: 40px 30px;
            margin-top: 30px;
            text-align: left;
            max-width: 400px;
            width: 100%;
            transition: transform 0.3s ease;
        }

        /* Label Styling */
        label {
            display: block;
            margin-bottom: 15px;
            font-weight: bold;
            color: #333;
        }

        /* Input Text Field Styling */
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 24px);
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #e9f5ff;
            transition: border-color 0.3s ease;
        }

        /* Input Focus Effect */
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Button Styling */
        input[type="submit"] {
            display: inline-flex;
            align-items: center;
            text-decoration: none;
            color: #fff;
            background-color: #28a745;
            padding: 12px 30px;
            border-radius: 8px;
            margin-top: 15px;
            cursor: pointer;
            border: none;
            position: relative;
            overflow: hidden;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            gap: 10px;
        }

        /* Button 3D Effect */
        input[type="submit"]::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.15);
            border-radius: inherit;
            transition: opacity 0.3s;
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

        /* Keyframe Animations */
        @keyframes backgroundAnimation {
            0% {background: linear-gradient(135deg, #a8e6cf, #dcedc1);}
            50% {background: linear-gradient(135deg, #f1f8e9, #a8e6cf);}
            100% {background: linear-gradient(135deg, #dcedc1, #a8e6cf);}
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
    <h2><i class="fas fa-lock icon"></i> Admin Login</h2>
    <form action="AdminLoginServlet" method="post">
        <label for="username"><i class="fas fa-user icon"></i> Username:</label>
        <input type="text" id="username" name="username"><br>
        <label for="password"><i class="fas fa-key icon"></i> Password:</label>
        <input type="password" id="password" name="password"><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
