<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
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
            font-size: 2.5em;
            margin-bottom: 20px;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            gap: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }

        .dashboard-info {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            display: inline-block;
            padding: 30px;
            margin-top: 30px;
            text-align: left;
            width: 350px; /* Adjusted width */
            position: relative;
            overflow: hidden;
            transition: box-shadow 0.3s ease;
        }

        .dashboard-info:hover {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .dashboard-info p {
            margin-bottom: 15px;
            font-size: 1.2em;
            color: #444;
            animation: slideIn 0.8s ease-in-out;
        }

        .nav-links {
            margin-top: 40px;
            display: flex;
            flex-direction: column; /* Stack buttons vertically */
            align-items: center; /* Center buttons horizontally */
            gap: 15px; /* Space between buttons */
            width: 300px; /* Set a fixed width for alignment */
        }

        .nav-links a {
            text-decoration: none;
            color: white;
            background-color: #007bff;
            border: none;
            padding: 15px 25px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 1em;
            text-transform: uppercase;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px; /* Space between icon and text */
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.4);
            cursor: pointer;
            z-index: 1;
            width: 100%; /* Make buttons full-width */
            text-align: center; /* Center text inside buttons */
        }

        .nav-links a:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 86, 179, 0.5);
        }

        .nav-links a:active {
            transform: translateY(2px);
            box-shadow: 0 3px 8px rgba(0, 86, 179, 0.4);
        }

        .nav-links a i {
            margin-right: 8px;
        }

        /* Animation Keyframes */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

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
    <h2><i class="fas fa-user-circle"></i> Welcome, Customer</h2>
    <div class="dashboard-info">
        <%
            String accountNo = (String) session.getAttribute("account_no");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingSystem", "root", "mani12");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE account_no=?");
            ps.setString(1, accountNo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                out.print("<p><i class='fas fa-id-card'></i> Account No: " + rs.getString("account_no") + "</p>");
                out.print("<p><i class='fas fa-wallet'></i> Balance: $" + rs.getDouble("initial_balance") + "</p>");
            }
            con.close(); // Close the database connection
        %>
    </div>
    <div class="nav-links">
        <a href="viewTransactions.jsp"><i class="fas fa-list"></i> View Transactions</a>
        <a href="deposit.jsp"><i class="fas fa-coins"></i> Deposit</a>
        <a href="withdraw.jsp"><i class="fas fa-money-bill-wave"></i> Withdraw</a>
        <a href="closeAccount.jsp"><i class="fas fa-times-circle"></i> Close Account</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</body>
</html>
