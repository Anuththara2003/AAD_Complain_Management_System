package Documents.AAD.JavaEE.Test_Project.Controller;

import Documents.AAD.JavaEE.Test_Project.Dao.EmployeeDao;
import Documents.AAD.JavaEE.Test_Project.Model.EmployeeModel;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/employee")
public class EmployeeServlet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            EmployeeDao employeeDao = new EmployeeDao(dataSource);
            String userIdStr = (String) req.getSession().getAttribute("user_id");
            int userId = Integer.parseInt(userIdStr);

            if ("add".equals(action)) {
                String title = req.getParameter("title");
                String description = req.getParameter("description");

                EmployeeModel employeeModel = new EmployeeModel();
                employeeModel.setTitle(title);
                employeeModel.setDescription(description);
                employeeModel.setUser_id(userId);

                int result = employeeDao.addComplain(employeeModel);
                if (result > 0) {
                    req.setAttribute("message", "Complain added successfully");
                } else {
                    req.setAttribute("message", "Failed to add complaint");
                }
            } else if ("update".equals(action)) {
                int complaintId = Integer.parseInt(req.getParameter("complaint_id"));
                String title = req.getParameter("title");
                String description = req.getParameter("description");

                EmployeeModel employeeModel = new EmployeeModel();
                employeeModel.setComplaint_id(complaintId);
                employeeModel.setTitle(title);
                employeeModel.setDescription(description);
                employeeModel.setUser_id(userId);
                int result = employeeDao.updateComplaint(employeeModel);
                if (result > 0) {
                    req.setAttribute("message", "Complaint updated successfully");
                } else {
                    req.setAttribute("message", "Failed to update complaint");
                }
            } else if ("delete".equals(action)) {
                int complaintId = Integer.parseInt(req.getParameter("complaint_id"));
                int result = employeeDao.deleteComplaint(complaintId);
                if (result > 0) {
                    req.setAttribute("message", "Complaint deleted successfully");
                } else {
                    req.setAttribute("message", "Failed to delete complaint");
                }
            }

            List<EmployeeModel> list = employeeDao.getComplaintsByUser(userId);
            req.setAttribute("complaintList", list);
            req.getRequestDispatcher("View/EmployeeDashBoard.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String userIdStr = (String) req.getSession().getAttribute("user_id");
            int userId = Integer.parseInt(userIdStr);
            List<EmployeeModel> list = new EmployeeDao(dataSource).getComplaintsByUser(userId);
            req.setAttribute("complaintList", list);
            req.getRequestDispatcher("View/EmployeeDashBoard.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage(), e);
        }
    }
}