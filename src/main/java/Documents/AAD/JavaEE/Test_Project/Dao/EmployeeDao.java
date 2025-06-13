package Documents.AAD.JavaEE.Test_Project.Dao;

import Documents.AAD.JavaEE.Test_Project.Model.EmployeeModel;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {
    private DataSource dataSource;

    public EmployeeDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public int addComplain(EmployeeModel employeeModel) throws SQLException {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO complaints (title, description, user_id) VALUES (?, ?, ?)")) {
            preparedStatement.setString(1, employeeModel.getTitle());
            preparedStatement.setString(2, employeeModel.getDescription());
            preparedStatement.setInt(3, employeeModel.getUser_id());
            return preparedStatement.executeUpdate();
        }
    }

    public int updateComplaint(EmployeeModel employeeModel) throws SQLException {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE complaints SET title = ?, description = ? WHERE complaint_id = ? AND user_id = ?")) {
            preparedStatement.setString(1, employeeModel.getTitle());
            preparedStatement.setString(2, employeeModel.getDescription());
            preparedStatement.setInt(3, employeeModel.getComplaint_id());
            preparedStatement.setInt(4, employeeModel.getUser_id());
            return preparedStatement.executeUpdate();
        }
    }

    public int deleteComplaint(int complaintId) throws SQLException {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "DELETE FROM complaints WHERE complaint_id = ?")) {
            preparedStatement.setInt(1, complaintId);
            return preparedStatement.executeUpdate();
        }
    }

    public List<EmployeeModel> getComplaintsByUser(int userId) throws SQLException {
        List<EmployeeModel> list = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM complaints WHERE user_id = ?")) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    EmployeeModel model = new EmployeeModel();
                    model.setComplaint_id(rs.getInt("complaint_id"));
                    model.setUser_id(rs.getInt("user_id"));
                    model.setTitle(rs.getString("title"));
                    model.setDescription(rs.getString("description"));
                    model.setStatus(rs.getString("status"));
                    model.setCreated_at(rs.getString("created_at"));
                    model.setUpdated_at(rs.getString("updated_at"));
                    list.add(model);
                }
            }
        }
        return list;
    }
}