<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME</title>
<!-- Link to Font Awesome CSS for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #e0f7fa, #f1f8e9);
        text-align: center;
        padding: 50px;
        animation: backgroundAnimation 5s infinite alternate;
        margin: 0;
    }

    h2 {
        color: #333;
        font-size: 2.5em;
        margin-bottom: 20px;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        animation: textGlow 1.5s ease-in-out infinite alternate;
    }

    div {
        background-color: #ffffff;
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        display: inline-block;
        padding: 40px 30px;
        margin-top: 30px;
        max-width: 300px;
    }

    a {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        color: #fff;
        background-color: #007bff;
        padding: 15px 25px;
        border-radius: 8px;
        margin: 15px 0;
        position: relative;
        overflow: hidden;
        transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
        box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3);
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 1px;
        cursor: pointer;
        font-size: 1.2em;
        gap: 10px;
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

    a:active {
        transform: translateY(4px);
        box-shadow: 0 3px 8px rgba(0, 123, 255, 0.3);
    }

    a:active::before {
        opacity: 0;
    }

    a:hover {
        background-color: #0056b3;
        transform: translateY(-5px) scale(1.05);
        box-shadow: 0 8px 18px rgba(0, 86, 179, 0.4);
    }

    @keyframes backgroundAnimation {
        from {
            background: linear-gradient(135deg, #e0f7fa, #f1f8e9);
        }
        to {
            background: linear-gradient(135deg, #f1f8e9, #e0f7fa);
        }
    }

    @keyframes textGlow {
        from {
            text-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        to {
            text-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
        }
    }

    .icon {
        font-size: 1.3em;
        margin-right: 10px;
    }
</style>
</head>
<body>
<h2><i class="fas fa-handshake icon"></i> Welcome to BankingSystem</h2>
<div>
    <a href="login.jsp" target="_blank" style="background-color: #28a745;"><i class="fas fa-user-shield icon"></i> Admin Page</a><br>
    <a href="customerLogin.jsp" target="_blank" style="background-color: #dc3545;"><i class="fas fa-user icon"></i> Customer Page</a>
</div>
</body>
</html>
