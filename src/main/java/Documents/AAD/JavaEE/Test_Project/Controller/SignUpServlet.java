package Documents.AAD.JavaEE.Test_Project.Controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");
        String fullName = request.getParameter("fullname"); // ✅ match with JSP field

        // Basic validations
        if (username == null || password == null || confirmPassword == null || role == null || fullName == null ||
                username.isEmpty() || password.isEmpty() || confirmPassword.isEmpty() || role.isEmpty() || fullName.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/View/signup.jsp?success=true");

            return;
        }

        if (!password.equals(confirmPassword)) {
            response.sendRedirect(request.getContextPath() + "/View/signup.jsp?success=true");
            return;
        }

        try (Connection connection = dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(
                     "INSERT INTO users (username, password, role, full_name) VALUES (?, ?, ?, ?)")) {

            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, role);
            stmt.setString(4, fullName);

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect(request.getContextPath() + "/View/signin.jsp?success=true"); // ✅ redirect to login
            } else {
                response.sendRedirect(request.getContextPath() + "/View/signup.jsp?success=true");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/View/signup.jsp?success=true");
        }
    }
}
