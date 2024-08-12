import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("account_no");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingSystem", "root", "mani12");

            // Retrieve the current balance
            String getBalanceQuery = "SELECT initial_balance FROM customer WHERE account_no = ?";
            PreparedStatement ps1 = con.prepareStatement(getBalanceQuery);
            ps1.setString(1, accountNo);
            ResultSet rs = ps1.executeQuery();
            double balance = -1;
            if (rs.next()) {
                balance = rs.getDouble("initial_balance");
            }

            if (balance != 0) {
                sendAlert(response, "Account cannot be closed because it does not have a zero balance.");
                return;
            }

            // Retrieve customer_id
            String getCustomerIdQuery = "SELECT customer_id FROM customer WHERE account_no = ?";
            PreparedStatement ps2 = con.prepareStatement(getCustomerIdQuery);
            ps2.setString(1, accountNo);
            rs = ps2.executeQuery();
            int customerId = -1;
            if (rs.next()) {
                customerId = rs.getInt("customer_id");
            }

            // Delete transactions and customer
            String deleteTransactionsQuery = "DELETE FROM transactions WHERE customer_id = ?";
            PreparedStatement ps3 = con.prepareStatement(deleteTransactionsQuery);
            ps3.setInt(1, customerId);
            ps3.executeUpdate();

            PreparedStatement ps4 = con.prepareStatement("DELETE FROM customer WHERE account_no = ?");
            ps4.setString(1, accountNo);
            ps4.executeUpdate();

            // Invalidate the session and redirect to login page
            session.invalidate();
            response.sendRedirect("customerLogin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void sendAlert(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<script type=\"text/javascript\">");
        response.getWriter().println("alert('" + message + "');");
        response.getWriter().println("location='viewCustomers.jsp';"); // Redirect to the appropriate page
        response.getWriter().println("</script>");
    }
}
