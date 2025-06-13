package Documents.AAD.JavaEE.Test_Project.Controller;

import Documents.AAD.JavaEE.Test_Project.Dao.UserDao;
import Documents.AAD.JavaEE.Test_Project.Model.UserModel;
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
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String role = request.getParameter("role");
            String fullName = request.getParameter("fullname");

            UserModel userModel = new UserModel();
            userModel.setUsername(username);
            userModel.setPassword(password);
            userModel.setRole(role);
            userModel.setFullName(fullName);

            int result = new UserDao(this.dataSource).signup(userModel);


            if (result > 0) {
//            response.sendRedirect(request.getContextPath() + "/View/signin.jsp?success=true");
                request.getRequestDispatcher("View/signin.jsp?success=true").forward(request, response);
            } else {
//            response.sendRedirect(request.getContextPath() + "/View/signup.jsp?success=true");
                request.getRequestDispatcher("View/signup.jsp?success=true").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
//            response.sendRedirect(request.getContextPath() + "/View/signup.jsp?success=true");
            request.getRequestDispatcher("View/signup.jsp?success=true").forward(request, response);
        }
    }
}
