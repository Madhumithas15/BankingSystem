<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Customers</title>
    <!-- Link to Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
            text-transform: uppercase;
            font-size: 2.5em;
            animation: textGlow 1.5s ease-in-out infinite alternate;
        }

        table {
            width: 100%;
            max-width: 1200px;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border-radius: 10px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            font-size: 1em;
        }

        th {
            background-color: #4CAF50;
            color: white;
            position: sticky;
            top: 0;
            z-index: 1;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        th:hover {
            background-color: #45a049;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
            transition: background-color 0.3s ease;
        }

        tr:hover {
            background-color: #ddd;
        }

        td {
            transition: background-color 0.3s ease;
        }

        .back-link {
            display: inline-block;
            text-align: center;
            margin-top: 30px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
            cursor: pointer;
            overflow: hidden;
            position: relative;
        }

        .back-link:hover {
            background-color: #45a049;
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 8px 18px rgba(69, 160, 73, 0.4);
        }

        .back-link:active {
            transform: translateY(3px);
            box-shadow: 0 3px 8px rgba(69, 160, 73, 0.2);
        }

        .back-link i {
            margin-right: 10px;
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
        <i class="fas fa-users"></i> Customer List
    </h2>
    <table>
        <tr>
            <th>Customer ID</th>
            <th>Full Name</th>
            <th>Address</th>
            <th>Mobile No</th>
            <th>Email ID</th>
            <th>Account Type</th>
            <th>Initial Balance</th>
            <th>Date of Birth</th>
            <th>Account No</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingSystem", "root", "mani12");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
                
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("customer_id") %></td>
                        <td><%= rs.getString("full_name") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><%= rs.getString("mobile_no") %></td>
                        <td><%= rs.getString("email_id") %></td>
                        <td><%= rs.getString("account_type") %></td>
                        <td><%= rs.getDouble("initial_balance") %></td>
                        <td><%= rs.getDate("dob") %></td>
                        <td><%= rs.getString("account_no") %></td>
                    </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <a href="adminDashboard.jsp" class="back-link">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
    </a>
</body>
</html>
