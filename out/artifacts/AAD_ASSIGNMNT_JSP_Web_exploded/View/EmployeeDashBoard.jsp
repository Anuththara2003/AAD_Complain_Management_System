<%@ page import="Documents.AAD.JavaEE.Test_Project.Model.EmployeeModel" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Enhanced</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.05)"/><circle cx="50" cy="10" r="0.5" fill="rgba(255,255,255,0.08)"/><circle cx="10" cy="90" r="0.8" fill="rgba(255,255,255,0.03)"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            pointer-events: none;
            z-index: 1;
        }

        .floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .shape:nth-child(1) {
            width: 80px;
            height: 80px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            width: 120px;
            height: 120px;
            top: 60%;
            right: 10%;
            animation-delay: 2s;
        }

        .shape:nth-child(3) {
            width: 60px;
            height: 60px;
            top: 40%;
            left: 80%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 25px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: slideInUp 1s ease-out;
            position: relative;
            z-index: 2;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(60px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
            flex-wrap: wrap;
            gap: 20px;
        }

        h2 {
            background: linear-gradient(45deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 2.5rem;
            position: relative;
            animation: titleGlow 2s ease-in-out infinite alternate;
            margin: 0;
        }

        .logout-btn {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
        }

        .logout-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .logout-btn:hover::before {
            left: 100%;
        }

        .logout-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(231, 76, 60, 0.5);
        }

        .logout-btn:active {
            transform: translateY(-1px);
        }

        @keyframes titleGlow {
            from { filter: drop-shadow(0 0 10px rgba(102, 126, 234, 0.3)); }
            to { filter: drop-shadow(0 0 20px rgba(118, 75, 162, 0.5)); }
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            border-radius: 2px;
            animation: lineExpand 1s ease-out 0.5s both;
        }

        @keyframes lineExpand {
            from { width: 0; }
            to { width: 100px; }
        }

        .form-container {
            background: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 20px;
            margin-bottom: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            animation: formSlideIn 0.8s ease-out 0.3s both;
        }

        @keyframes formSlideIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            margin-top: 20px;
            color: #2c3e50;
            font-size: 1.1rem;
            position: relative;
            padding-left: 20px;
        }

        label::before {
            content: '→';
            position: absolute;
            left: 0;
            color: #667eea;
            font-weight: bold;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid transparent;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            font-size: 16px;
            position: relative;
        }

        input[type="text"]:focus, textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            transform: translateY(-2px);
            background: white;
        }

        textarea {
            resize: vertical;
            height: 120px;
            font-family: inherit;
        }

        .buttons {
            margin-top: 30px;
            text-align: center;
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .buttons button {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            min-width: 120px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .buttons button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .buttons button:hover::before {
            left: 100%;
        }

        .buttons button:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }

        .buttons button:active {
            transform: translateY(-1px);
        }

        .buttons button[type="reset"] {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
        }

        .buttons button[type="reset"]:hover {
            box-shadow: 0 10px 25px rgba(231, 76, 60, 0.4);
        }

        .table-container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            animation: tableSlideIn 1s ease-out 0.6s both;
            overflow: hidden;
        }

        @keyframes tableSlideIn {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        th {
            background: linear-gradient(45deg, #2c3e50, #34495e);
            color: white;
            padding: 20px 15px;
            text-align: center;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
        }

        th::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(45deg, #667eea, #764ba2);
        }

        td {
            padding: 18px 15px;
            text-align: center;
            background: white;
            transition: all 0.3s ease;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        tr:hover td {
            background: linear-gradient(45deg, rgba(102, 126, 234, 0.05), rgba(118, 75, 162, 0.05));
            transform: scale(1.01);
        }

        .no-data {
            text-align: center;
            padding: 50px;
            color: #7f8c8d;
            font-style: italic;
            font-size: 1.2rem;
        }

        .loading-animation {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(102, 126, 234, 0.3);
            border-radius: 50%;
            border-top-color: #667eea;
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            h2 {
                font-size: 2rem;
            }

            .buttons {
                flex-direction: column;
                align-items: center;
            }

            .buttons button {
                width: 100%;
                max-width: 200px;
            }

            table {
                font-size: 14px;
            }

            th, td {
                padding: 12px 8px;
            }
        }
    </style>

</head>
<body>
<div class="floating-shapes">
    <div class="shape"></div>
    <div class="shape"></div>
    <div class="shape"></div>
</div>

<div class="container">
    <div class="header-section">
        <div class="header">
            <div class="user-info">
                Welcome, <%= session.getAttribute("full_name") != null ? session.getAttribute("full_name") : "Employee" %>
            </div>
            <div class="user-info">
                User ID, <%= session.getAttribute("user_id") != null ? session.getAttribute("user_id") : "Employee" %>
            </div>
            <h1>🏛 Municipal Complaint Management</h1>
            <p>Employee Dashboard - Submit and Track Your Complaints</p>
        </div>
        <h2>User Dashboard - Complaint Management</h2>
        <button class="logout-btn" onclick="logout()">
            🚪 Logout
        </button>
    </div>

    <!-- Success/Failure Message -->
    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null) { %>
    <div style="padding: 10px; margin-bottom: 20px; background: <%= message.contains("successfully") ? "#d4edda" : "#f8d7da" %>; color: <%= message.contains("successfully") ? "#155724" : "#721c24" %>; border-radius: 5px;">
        <%= message %>
    </div>
    <% } %>

    <div class="form-container">
        <form method="post" action="employee" id="complaintForm">
            <input type="hidden" name="complaint_id" id="complaint_id" value="">
            <label for="title">Complaint Title:</label>
            <input type="text" id="title" name="title" required placeholder="Enter your complaint title...">

            <label for="description">Complaint Description:</label>
            <textarea id="description" name="description" required placeholder="Describe your complaint in detail..."></textarea>

            <div class="buttons">
                <button type="submit" name="action" value="add">➕ Add Complaint</button>
                <button type="submit" name="action" value="update" id="updateBtn" disabled>🔄 Update Complaint</button>
                <button type="submit" name="action" value="delete" id="deleteBtn" disabled>🗑️ Delete Complaint</button>
                <button type="reset" onclick="resetForm()">🧹 Clear Form</button>
            </div>
        </form>
    </div>

    <div class="table-container">
        <h2>📋 My Complaints</h2>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>User ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Status</th>
                <th>Remarks</th>
                <th>Created</th>
                <th>Updated</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<EmployeeModel> complaintList = (List<EmployeeModel>) request.getAttribute("complaintList");
                if (complaintList != null && !complaintList.isEmpty()) {
                    for (EmployeeModel complaint : complaintList) {
            %>
            <tr onclick="selectComplaint('<%= complaint.getComplaint_id() %>', '<%= complaint.getTitle() %>', '<%= complaint.getDescription() %>')">
                <td><%= complaint.getComplaint_id() %></td>
                <td><%= complaint.getUser_id() %></td>
                <td><%= complaint.getTitle() %></td>
                <td><%= complaint.getDescription() %></td>
                <td><%= complaint.getStatus() != null ? complaint.getStatus() : "Pending" %></td>
                <td><%= complaint.getRemark() %></td>
                <td><%= complaint.getCreated_at() != null ? complaint.getCreated_at() : "--" %></td>
                <td><%= complaint.getUpdated_at() != null ? complaint.getUpdated_at() : "--" %></td>
                <td>
                    <button onclick="selectComplaint('<%= complaint.getComplaint_id() %>', '<%= complaint.getTitle() %>', '<%= complaint.getDescription() %>')">Select</button>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="8" class="no-data">No complaints found.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<script>
    function selectComplaint(id, title, description) {
        document.getElementById('complaint_id').value = id;
        document.getElementById('title').value = title;
        document.getElementById('description').value = description;
        document.getElementById('updateBtn').disabled = false;
        document.getElementById('deleteBtn').disabled = false;
    }

    function resetForm() {
        document.getElementById('complaintForm').reset();
        document.getElementById('complaint_id').value = '';
        document.getElementById('updateBtn').disabled = true;
        document.getElementById('deleteBtn').disabled = true;
    }

    function logout() {
        if (confirm('Are you sure you want to logout? 🤔')) {
            document.body.style.transition = 'opacity 0.5s ease-out';
            document.body.style.opacity = '0';
            setTimeout(() => {
                window.location.href = 'logout';
            }, 500);
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        const inputs = document.querySelectorAll('input, textarea');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.style.transform = 'scale(1.02)';
            });
            input.addEventListener('blur', function() {
                this.style.transform = 'scale(1)';
            });
        });

        const buttons = document.querySelectorAll('button');
        buttons.forEach(button => {
            button.addEventListener('click', function(e) {
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;

                ripple.style.cssText = `
                    position: absolute;
                    width: ${size}px;
                    height: ${size}px;
                    left: ${x}px;
                    top: ${y}px;
                    background: rgba(255, 255, 255, 0.6);
                    border-radius: 50%;
                    transform: scale(0);
                    animation: ripple 0.6s linear;
                    pointer-events: none;
                `;
                this.appendChild(ripple);
                setTimeout(() => ripple.remove(), 600);
            });
        });

        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to { transform: scale(4); opacity: 0; }
            }
        `;
        document.head.appendChild(style);
    });
</script>
</body>
</html>