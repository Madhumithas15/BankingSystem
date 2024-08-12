<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Login</title>
    <!-- Link to Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
            font-size: 3em;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            text-transform: uppercase;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            animation: glow 1.5s infinite alternate;
        }

        form {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 400px;
            text-align: left;
            transition: box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        form::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            z-index: 0;
            clip-path: circle(200px at 50% 0);
            transition: clip-path 0.5s ease;
        }

        form:hover::before {
            clip-path: circle(300px at 50% 50%);
        }

        form label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
            z-index: 1;
            position: relative;
        }

        form input[type="text"],
        form input[type="password"] {
            width: calc(100% - 22px);
            padding: 12px;
            margin-bottom: 20px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1em;
            transition: border-color 0.3s ease;
            z-index: 1;
            position: relative;
            background-color: #f8f8f8;
        }

        form input[type="text"]:focus,
        form input[type="password"]:focus {
            border-color: #66a6ff;
            outline: none;
            box-shadow: 0 0 8px rgba(102, 166, 255, 0.4);
        }

        form input[type="submit"] {
            display: inline-block;
            text-decoration: none;
            color: white;
            background-color: #28a745;
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 1.1em;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
            cursor: pointer;
            border: none;
            box-shadow: 0 4px 10px rgba(40, 167, 69, 0.4);
            position: relative;
            z-index: 1;
        }

        form input[type="submit"]:hover {
            background-color: #218838;
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(33, 136, 56, 0.5);
        }

        form input[type="submit"]:active {
            transform: translateY(2px);
            box-shadow: 0 3px 8px rgba(33, 136, 56, 0.4);
        }

        form input[type="submit"] i {
            margin-right: 8px;
        }

        @keyframes glow {
            from {
                text-shadow: 0 0 10px #89f7fe, 0 0 20px #89f7fe, 0 0 30px #66a6ff, 0 0 40px #66a6ff;
            }
            to {
                text-shadow: 0 0 20px #66a6ff, 0 0 30px #89f7fe, 0 0 40px #66a6ff, 0 0 50px #89f7fe;
            }
        }
    </style>
</head>
<body>
    <h2>
        <i class="fas fa-user-lock"></i> Customer Login
    </h2>
    <form action="CustomerLoginServlet" method="post">
        <label for="account_no">Account No:</label>
        <input type="text" id="account_no" name="account_no" placeholder="Enter your account number" style="background-color: #e9f5ff;">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" style="background-color: #e9f5ff;">
        <input type="submit" value="Login">
    </form>
</body>
</html>
