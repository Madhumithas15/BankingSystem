import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.Period;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterCustomerServlet")
public class RegisterCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobile_no");
        String emailId = request.getParameter("email_id");
        String accountType = request.getParameter("account_type");
        double initialBalance = Double.parseDouble(request.getParameter("initial_balance"));
        String dob = request.getParameter("date_of_birth");
        String idProof = request.getParameter("id_proof");
        String accountNo = generateAccountNo();
        String password = generateTemporaryPassword();

        LocalDate birthDate = LocalDate.parse(dob);
        LocalDate currentDate = LocalDate.now();
        int age = Period.between(birthDate, currentDate).getYears();

        // Check if the user is at least 18 years old
        if (age < 18) {
            sendAlert(response, "Registration failed: You must be at least 18 years old to register.");
            return;
        }

        // Check if the initial balance is at least 1000
        if (initialBalance < 1000) {
            sendAlert(response, "Registration failed: Initial balance must be at least 1000.");
            return;
        }

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the connection to the database
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/BankingSystem", "root", "mani12");

            // Prepare the SQL statement for inserting a new customer
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO customer (full_name, address, mobile_no, email_id, account_type, initial_balance, dob, id_proof, account_no, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            
            // Set the parameters for the SQL statement
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, mobileNo);
            ps.setString(4, emailId);
            ps.setString(5, accountType);
            ps.setDouble(6, initialBalance);
            ps.setDate(7, java.sql.Date.valueOf(dob));
            ps.setString(8, idProof);
            ps.setString(9, accountNo);
            ps.setString(10, password);

            // Execute the SQL statement
            ps.executeUpdate();

            // Redirect to the admin dashboard on successful registration
            response.sendRedirect("adminDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            sendAlert(response, "Registration failed: An error occurred. Please try again.");
        }
    }

    // Generate a random account number
    private String generateAccountNo() {
        return "ACC" + (int)(Math.random() * 1000000);
    }

    // Generate a temporary password
    private String generateTemporaryPassword() {
        return "TEMP" + (int)(Math.random() * 10000);
    }

    // Send an alert message to the client
    private void sendAlert(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<script type=\"text/javascript\">");
        response.getWriter().println("alert('" + escapeJavaScript(message) + "');");
        response.getWriter().println("location='registerCustomer.jsp';");
        response.getWriter().println("</script>");
    }

    // Escape JavaScript special characters in the message
    private String escapeJavaScript(String message) {
        return message.replace("'", "\\'").replace("\"", "\\\"");
    }
}
