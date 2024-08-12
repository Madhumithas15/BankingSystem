<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Close Account</title>
    <!-- Link to Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px;
            margin: 0;
        }
        h2 {
            color: #333;
            font-size: 2.5em;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: fadeIn 1s ease-in-out;
        }
        form {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            padding: 30px;
            width: 350px; /* Adjust form width */
            position: relative;
            overflow: hidden;
            transition: box-shadow 0.3s ease;
        }
        form:hover {
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }
        label {
            display: block;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 1.1em;
        }
        input[type="submit"], a {
            display: inline-flex;
            align-items: center;
            text-decoration: none;
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
            border: none;
            font-size: 1.1em;
            gap: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        input[type="submit"] {
            background-color: #dc3545; /* Red color */
        }
        input[type="submit"]:hover {
            background-color: #c82333; /* Darker red on hover */
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(220, 53, 69, 0.4);
        }
        input[type="submit"]:active {
            transform: translateY(2px);
            box-shadow: 0 2px 6px rgba(220, 53, 69, 0.3);
        }
        a {
            background-color: #28a745; /* Green color */
            margin-left: 10px;
        }
        a:hover {
            background-color: #218838; /* Darker green on hover */
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(40, 167, 69, 0.4);
        }
        a:active {
            transform: translateY(2px);
            box-shadow: 0 2px 6px rgba(40, 167, 69, 0.3);
        }
        .icon {
            font-size: 1.2em;
            margin-right: 8px;
        }

        /* Animation Keyframes */
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
    <h2><i class="fas fa-user-times icon"></i> Close Account</h2>
    <form action="CloseAccountServlet" method="post">
        <label for="confirm"><i class="fas fa-exclamation-triangle icon"></i> Are you sure you want to close your account?</label><br><br>
        <input type="submit" value="Yes"><br>
        <a href="viewCustomers.jsp"><i class="fas fa-arrow-left icon"></i> No</a>
    </form>
</body>
</html>
