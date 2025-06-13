package Documents.AAD.JavaEE.Test_Project.Controller;


import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;

@WebServlet("/signin")
public class SignInServlet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?")) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                if ("Admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("adminDashboard.jsp");
                } else if ("Employee".equalsIgnoreCase(role)) {
                    response.sendRedirect("employeeDashboard.jsp");
                } else {
                    response.sendRedirect("signin.jsp?error=true");
                }
            } else {
                response.sendRedirect("signin.jsp?error=true");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("signin.jsp?error=true");
        }
    }
}
