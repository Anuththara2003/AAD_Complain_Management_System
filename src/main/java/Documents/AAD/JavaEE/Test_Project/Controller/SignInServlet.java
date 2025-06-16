package Documents.AAD.JavaEE.Test_Project.Controller;


import Documents.AAD.JavaEE.Test_Project.Dao.UserDao;
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

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            ResultSet rs = new UserDao(this.dataSource).signin(username, password);


            if (rs.next()) {
                String role = rs.getString("role");
                String name = rs.getString("full_name");
                String user_id = rs.getString("user_id");

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);
                session.setAttribute("full_name", name);
                session.setAttribute("user_id", user_id);

                if ("Admin".equalsIgnoreCase(role)) {
//                    response.sendRedirect("adminDashboard.jsp");
//                    request.getRequestDispatcher("View/AdminDashBoard.jsp?success=true").forward(request,response);
                    request.getRequestDispatcher("admin").forward(request,response);
                } else if ("Employee".equalsIgnoreCase(role)) {
//                    response.sendRedirect("employeeDashboard.jsp");
//                    request.getRequestDispatcher("View/EmployeeDashBoard.jsp?success=true").forward(request,response);
                 request.getRequestDispatcher("employee").forward(request,response);
                } else {

//                    response.sendRedirect("signin.jsp?error=true");
                    request.getRequestDispatcher("View/signin.jsp?success=true").forward(request,response);
                }
            } else {
//                response.sendRedirect("signin.jsp?error=true");
                request.getRequestDispatcher("View/signin.jsp?success=true").forward(request,response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
//            response.sendRedirect("signin.jsp?error=true");
            request.getRequestDispatcher("View/signin.jsp?success=true").forward(request,response);
        }
    }
}
