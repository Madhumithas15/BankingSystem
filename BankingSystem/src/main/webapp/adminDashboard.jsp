<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <!-- Link to Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            text-align: center;
            padding: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        h2 {
            color: #333;
            font-size: 2.5em;
            margin-bottom: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
            text-transform: uppercase;
            animation: textGlow 1.5s ease-in-out infinite alternate;
        }

        ul.button-list {
            list-style: none;
            padding: 0;
            margin: 0;
            width: 100%;
            max-width: 400px;
        }

        ul.button-list li {
            margin-bottom: 15px;
        }

        a {
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 15px;
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3);
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            width: 100%;
            position: relative;
            overflow: hidden;
            font-size: 1.1em;
            gap: 10px;
        }

        a:hover {
            background-color: #0056b3;
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 8px 18px rgba(0, 86, 179, 0.4);
        }

        a:active {
            transform: translateY(3px);
            box-shadow: 0 3px 8px rgba(0, 86, 179, 0.2);
        }

        a::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            border-radius: inherit;
            transition: opacity 0.3s;
            opacity: 0;
        }

        a:hover::before {
            opacity: 1;
        }

        i {
            font-size: 1.2em;
        }

        @keyframes textGlow {
            from {
                text-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            }
            to {
                text-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
            }
        }
    </style>
</head>
<body>
    <h2>
        <i class="fas fa-user-shield"></i>
        Welcome, <%= session.getAttribute("username") %>
    </h2>

    <ul class="button-list">
        <li>
            <a href="registerCustomer.jsp" style="background-color: #28a745;">
                <i class="fas fa-user-plus"></i> Register Customer
            </a>
        </li>
        <li>
            <a href="listCustomer.jsp" style="background-color: #FFA62F;">
                <i class="fas fa-users"></i> List Customers
            </a>
        </li>
        <li>
            <a href="logout.jsp" style="background-color: #dc3545;">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </li>
    </ul>
</body>
</html>
