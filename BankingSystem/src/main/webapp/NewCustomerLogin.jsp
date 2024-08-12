<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Password Reset</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @keyframes backgroundAnimation {
            0% { background-color: #f0f8ff; }
            50% { background-color: #e0f7fa; }
            100% { background-color: #f0f8ff; }
        }
        @keyframes buttonHoverAnimation {
            0% {
                background: linear-gradient(145deg, #007bff, #0056b3);
                color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transform: perspective(1000px) rotateX(0) rotateY(0) scale(1);
            }
            50% {
                background: linear-gradient(145deg, #0056b3, #003d7a);
                color: #fff;
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
                transform: perspective(1000px) rotateX(15deg) rotateY(15deg) scale(1.1);
            }
            100% {
                background: linear-gradient(145deg, #007bff, #0056b3);
                color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transform: perspective(1000px) rotateX(0) rotateY(0) scale(1);
            }
        }
        body {
            font-family: Arial, sans-serif;
            animation: backgroundAnimation 10s infinite alternate;
            text-align: center;
            padding: 50px;
            background: linear-gradient(135deg, #f0f8ff, #e0f7fa);
        }
        .container {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: inline-block;
            padding: 20px;
            margin: 0 auto;
            max-width: 400px;
            text-align: left;
        }
        h2 {
            color: #333;
            font-size: 2.5em;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        input[type="text"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }
        input[type="submit"] {
            background: linear-gradient(145deg, #007bff, #0056b3);
            color: #fff;
            border: none;
            padding: 12px 25px;
            border-radius: 10px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            font-size: 1.2em;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            perspective: 1000px;
        }
        input[type="submit"]::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            transform: scaleX(0) scaleY(0);
            transition: transform 0.3s ease;
            z-index: 0;
        }
        input[type="submit"]::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            transform: scaleX(0) scaleY(0);
            transition: transform 0.3s ease;
            z-index: 0;
        }
        input[type="submit"]:hover::before {
            transform: scaleX(1) scaleY(1);
        }
        input[type="submit"]:hover::after {
            transform: scaleX(1) scaleY(1);
        }
        input[type="submit"]:hover {
            background: linear-gradient(145deg, #0056b3, #003d7a);
            transform: perspective(1000px) rotateX(10deg) rotateY(10deg) scale(1.1);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
            animation: buttonHoverAnimation 0.6s ease;
        }
        .fa {
            color: #007bff;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fa fa-lock"></i>Customer Password Reset</h2>
        <form action="NewCustomerLogin" method="post">
            <label for="acc_no"><i class="fa fa-id-card"></i>Account No:</label>
            <input type="text" id="acc_no" name="acc_no">
            <label for="newPassword"><i class="fa fa-key"></i>Enter New Password:</label>
            <input type="text" id="newPassword" name="newPassword">
            <input type="submit" value="Reset Password">
        </form>
    </div>
</body>
</html>
