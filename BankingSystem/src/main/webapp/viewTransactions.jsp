<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Transactions</title>
    <!-- Link to Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5em;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: fadeIn 1s ease-in-out;
        }

        .transaction {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin: 10px 0;
            padding: 15px;
            width: 80%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        .transaction:nth-child(even) {
            background-color: #f9f9f9;
        }

        .transaction:hover {
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            transform: scale(1.02);
        }

        .transaction p {
            margin: 5px 0;
            font-size: 1.1em;
        }

        .back-link, .download-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            padding: 12px 24px;
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
            width: 220px;
            margin: 10px auto;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
        }

        .back-link {
            background-color: #4CAF50;
        }

        .back-link:hover {
            background-color: #45a049;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 123, 255, 0.4);
        }

        .download-link {
            background-color: #008CBA;
        }

        .download-link:hover {
            background-color: #007B9E;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 123, 255, 0.4);
        }

        .back-link i, .download-link i {
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
    <h2><i class="fas fa-history"></i> Last 10 Transactions</h2>
    <%
        String accountNo = (String) session.getAttribute("account_no");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingSystem", "root", "mani12");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM transactions WHERE customer_id=(SELECT customer_id FROM customer WHERE account_no=?) ORDER BY transaction_date DESC LIMIT 10");
        ps.setString(1, accountNo);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
    %>
        <div class="transaction">
            <p><strong>Date:</strong> <%= rs.getTimestamp("transaction_date") %></p>
            <p><strong>Amount:</strong> $<%= rs.getDouble("amount") %></p>
            <p><strong>Type:</strong> <%= rs.getString("type") %></p>
        </div>
    <%
        }
        con.close(); // Close the database connection
    %>
    <a href="viewCustomers.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    <a href="DownloadPDFServlet" class="download-link"><i class="fas fa-file-pdf"></i> Download Transactions as PDF</a>
</body>
</html>
