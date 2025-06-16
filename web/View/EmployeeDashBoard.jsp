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
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
            animation: backgroundShift 15s ease-in-out infinite;
        }

        @keyframes backgroundShift {
            0%, 100% { background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%); }
            25% { background: linear-gradient(135deg, #f093fb 0%, #f5576c 50%, #4facfe 100%); }
            50% { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 50%, #667eea 100%); }
            75% { background: linear-gradient(135deg, #a8edea 0%, #fed6e3 50%, #f093fb 100%); }
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.15)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.08)"/><circle cx="50" cy="10" r="0.5" fill="rgba(255,255,255,0.12)"/><circle cx="10" cy="90" r="0.8" fill="rgba(255,255,255,0.06)"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            pointer-events: none;
            z-index: 1;
            animation: particleFloat 20s linear infinite;
        }

        @keyframes particleFloat {
            0% { transform: translateY(0px); }
            100% { transform: translateY(-100px); }
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
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            animation: float 8s ease-in-out infinite, pulse 4s ease-in-out infinite alternate;
            box-shadow: 0 0 30px rgba(255, 255, 255, 0.3);
        }

        .shape:nth-child(1) {
            width: 150px;
            height: 150px;
            top: 10%;
            left: 5%;
            animation-delay: 0s;
            background: linear-gradient(45deg, rgba(102, 126, 234, 0.3), rgba(118, 75, 162, 0.3));
        }

        .shape:nth-child(2) {
            width: 200px;
            height: 200px;
            top: 60%;
            right: 5%;
            animation-delay: 3s;
            background: linear-gradient(45deg, rgba(240, 147, 251, 0.3), rgba(245, 87, 108, 0.3));
        }

        .shape:nth-child(3) {
            width: 120px;
            height: 120px;
            top: 40%;
            left: 80%;
            animation-delay: 6s;
            background: linear-gradient(45deg, rgba(79, 172, 254, 0.3), rgba(0, 242, 254, 0.3));
        }

        .shape:nth-child(4) {
            width: 80px;
            height: 80px;
            top: 80%;
            left: 20%;
            animation-delay: 9s;
            background: linear-gradient(45deg, rgba(168, 237, 234, 0.3), rgba(254, 214, 227, 0.3));
        }

        .shape:nth-child(5) {
            width: 100px;
            height: 100px;
            top: 20%;
            right: 30%;
            animation-delay: 12s;
            background: linear-gradient(45deg, rgba(102, 126, 234, 0.2), rgba(240, 147, 251, 0.2));
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg) scale(1); }
            25% { transform: translateY(-30px) rotate(90deg) scale(1.1); }
            50% { transform: translateY(-60px) rotate(180deg) scale(0.9); }
            75% { transform: translateY(-30px) rotate(270deg) scale(1.05); }
        }

        @keyframes pulse {
            0% { opacity: 0.6; box-shadow: 0 0 30px rgba(255, 255, 255, 0.3); }
            100% { opacity: 0.9; box-shadow: 0 0 60px rgba(255, 255, 255, 0.6); }
        }

        .container {
            max-width: 1400px;
            margin: 30px auto;
            padding: 50px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 30px;
            box-shadow: 0 30px 100px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(30px);
            border: 2px solid rgba(255, 255, 255, 0.2);
            animation: slideInUp 1.2s ease-out, containerGlow 8s ease-in-out infinite;
            position: relative;
            z-index: 2;
        }

        @keyframes containerGlow {
            0%, 100% { box-shadow: 0 30px 100px rgba(0, 0, 0, 0.2), 0 0 50px rgba(102, 126, 234, 0.1); }
            50% { box-shadow: 0 30px 100px rgba(0, 0, 0, 0.3), 0 0 80px rgba(240, 147, 251, 0.2); }
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
            margin-bottom: 50px;
            flex-wrap: wrap;
            gap: 30px;
            padding-bottom: 30px;
            border-bottom: 2px solid rgba(30, 60, 114, 0.1);
        }

        .header {
            flex: 1;
        }

        .user-info {
            font-size: 0.95rem;
            color: #666;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .header h1 {
            font-size: 2.5rem;
            background: linear-gradient(45deg, #667eea, #764ba2, #f093fb);
            background-size: 300% 300%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin: 15px 0 8px 0;
            font-weight: 800;
            letter-spacing: -1px;
            animation: gradientShift 6s ease-in-out infinite, titleBounce 4s ease-in-out infinite;
        }

        @keyframes titleBounce {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.02); }
        }

        .header p {
            color: #666;
            font-size: 1.1rem;
            font-weight: 400;
        }

        h2 {
            background: linear-gradient(45deg, #667eea, #764ba2, #f093fb);
            background-size: 300% 300%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 2.5rem;
            font-weight: 800;
            margin: 0;
            letter-spacing: -1px;
            animation: gradientShift 6s ease-in-out infinite, textFloat 3s ease-in-out infinite;
            text-shadow: 0 0 30px rgba(102, 126, 234, 0.3);
        }

        @keyframes gradientShift {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        @keyframes textFloat {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-3px); }
        }

        .logout-btn {
            background: linear-gradient(45deg, #dc3545, #c82333);
            color: white;
            border: none;
            padding: 14px 28px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 15px rgba(220, 53, 69, 0.3);
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
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(220, 53, 69, 0.4);
        }

        .logout-btn:active {
            transform: translateY(0);
        }

        .form-container {
            background: linear-gradient(145deg, rgba(255, 255, 255, 0.25), rgba(255, 255, 255, 0.1));
            padding: 50px;
            border-radius: 25px;
            margin-bottom: 50px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            animation: formSlideIn 1s ease-out 0.3s both, formPulse 6s ease-in-out infinite;
            backdrop-filter: blur(20px);
        }

        @keyframes formPulse {
            0%, 100% { transform: scale(1); box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1); }
            50% { transform: scale(1.01); box-shadow: 0 25px 80px rgba(102, 126, 234, 0.15); }
        }

        @keyframes formSlideIn {
            from {
                opacity: 0;
                transform: scale(0.98);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 10px;
            margin-top: 25px;
            color: #1e3c72;
            font-size: 1.05rem;
            position: relative;
            padding-left: 25px;
        }

        label::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 4px;
            height: 18px;
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            border-radius: 2px;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 16px 20px;
            border: 2px solid #e1e8ed;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 8px rgba(30, 60, 114, 0.05);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            font-size: 15px;
            font-family: inherit;
            position: relative;
        }

        input[type="text"]:focus, textarea:focus {
            outline: none;
            border-color: #2a5298;
            box-shadow: 0 4px 20px rgba(42, 82, 152, 0.15);
            transform: translateY(-1px);
            background: white;
        }

        input[type="text"]::placeholder, textarea::placeholder {
            color: #94a3b8;
            font-weight: 400;
        }

        textarea {
            resize: vertical;
            height: 120px;
            font-family: inherit;
        }

        .buttons {
            margin-top: 35px;
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .buttons button {
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            color: white;
            border: none;
            padding: 16px 32px;
            font-size: 14px;
            font-weight: 600;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            min-width: 140px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 15px rgba(30, 60, 114, 0.3);
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
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(30, 60, 114, 0.4);
        }

        .buttons button:active {
            transform: translateY(0);
        }

        .buttons button:disabled {
            background: linear-gradient(45deg, #94a3b8, #64748b);
            cursor: not-allowed;
            opacity: 0.6;
        }

        .buttons button:disabled:hover {
            transform: none;
            box-shadow: 0 4px 15px rgba(148, 163, 184, 0.3);
        }

        .buttons button[type="reset"] {
            background: linear-gradient(45deg, #6b7280, #4b5563);
        }

        .buttons button[type="reset"]:hover {
            box-shadow: 0 8px 25px rgba(107, 114, 128, 0.4);
        }

        .buttons button[name="action"][value="delete"] {
            background: linear-gradient(45deg, #dc3545, #c82333);
        }

        .buttons button[name="action"][value="delete"]:hover {
            box-shadow: 0 8px 25px rgba(220, 53, 69, 0.4);
        }

        .table-container {
            background: linear-gradient(145deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.1));
            border-radius: 25px;
            padding: 50px;
            box-shadow: 0 25px 80px rgba(0, 0, 0, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            animation: tableSlideIn 1.2s ease-out 0.6s both, tableFloat 8s ease-in-out infinite;
            backdrop-filter: blur(20px);
            overflow: hidden;
        }

        @keyframes tableFloat {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-5px); }
        }

        .table-container h2 {
            margin-bottom: 30px;
            font-size: 1.8rem;
        }

        @keyframes tableSlideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 32px rgba(30, 60, 114, 0.1);
        }

        th {
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            color: white;
            padding: 18px 15px;
            text-align: center;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.85rem;
            position: relative;
        }

        td {
            padding: 16px 15px;
            text-align: center;
            background: white;
            transition: all 0.3s ease;
            border-bottom: 1px solid rgba(30, 60, 114, 0.05);
            font-size: 0.9rem;
        }

        tr:hover td {
            background: linear-gradient(45deg, rgba(30, 60, 114, 0.03), rgba(42, 82, 152, 0.03));
            transform: scale(1.005);
        }

        .no-data {
            text-align: center;
            padding: 60px;
            color: #64748b;
            font-style: italic;
            font-size: 1.1rem;
        }

        .action-btn {
            background: linear-gradient(45deg, #059669, #047857);
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 12px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .action-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(5, 150, 105, 0.3);
        }

        .message {
            padding: 16px 20px;
            margin-bottom: 30px;
            border-radius: 10px;
            font-weight: 500;
            border-left: 4px solid;
            animation: messageSlideIn 0.5s ease-out;
        }

        .message.success {
            background: linear-gradient(45deg, #d1fae5, #a7f3d0);
            color: #065f46;
            border-left-color: #059669;
        }

        .message.error {
            background: linear-gradient(45deg, #fee2e2, #fecaca);
            color: #991b1b;
            border-left-color: #dc2626;
        }

        @keyframes messageSlideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Remove all media queries and responsive design sections */
    </style>
</head>
<body>
<div class="floating-shapes">
    <div class="shape"></div>
    <div class="shape"></div>
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
                User ID: <%= session.getAttribute("user_id") != null ? session.getAttribute("user_id") : "Employee" %>
            </div>
            <h1>Municipal Complaint Management</h1>
            <p>Employee Dashboard - Submit and Track Your Complaints</p>
        </div>
        <button class="logout-btn" onclick="logout()">
            Logout
        </button>
    </div>

    <!-- Success/Failure Message -->
    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null) { %>
    <div class="message <%= message.contains("successfully") ? "success" : "error" %>">
        <%= message %>
    </div>
    <% } %>

    <div class="form-container">
        <h2>Complaint Management</h2>
        <form method="post" action="employee" id="complaintForm">
            <input type="hidden" name="complaint_id" id="complaint_id" value="">

            <label for="title">Complaint Title:</label>
            <input type="text" id="title" name="title" required placeholder="Enter your complaint title...">

            <label for="description">Complaint Description:</label>
            <textarea id="description" name="description" required placeholder="Describe your complaint in detail..."></textarea>

            <div class="buttons">
                <button type="submit" name="action" value="add">Add Complaint</button>
                <button type="submit" name="action" value="update" id="updateBtn" disabled>Update Complaint</button>
                <button type="submit" name="action" value="delete" id="deleteBtn" disabled>Delete Complaint</button>
                <button type="reset" onclick="resetForm()">Clear Form</button>
            </div>
        </form>
    </div>

    <div class="table-container">
        <h2>My Complaints</h2>
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
                    <button class="action-btn" onclick="selectComplaint('<%= complaint.getComplaint_id() %>', '<%= complaint.getTitle() %>', '<%= complaint.getDescription() %>')">Select</button>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="9" class="no-data">No complaints found.</td>
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

        // Scroll to form
        document.querySelector('.form-container').scrollIntoView({
            behavior: 'smooth',
            block: 'start'
        });
    }

    function resetForm() {
        document.getElementById('complaintForm').reset();
        document.getElementById('complaint_id').value = '';
        document.getElementById('updateBtn').disabled = true;
        document.getElementById('deleteBtn').disabled = true;
    }

    function logout() {
        if (confirm('Are you sure you want to logout?')) {
            document.body.style.transition = 'opacity 0.5s ease-out';
            document.body.style.opacity = '0';
            setTimeout(() => {
                window.location.href = 'logout';
            }, 500);
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        // Enhanced input interactions
        const inputs = document.querySelectorAll('input, textarea');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.style.transform = 'translateY(-1px)';
                this.style.boxShadow = '0 6px 20px rgba(42, 82, 152, 0.15)';
            });
            input.addEventListener('blur', function() {
                this.style.transform = 'translateY(0)';
                this.style.boxShadow = '0 2px 8px rgba(30, 60, 114, 0.05)';
            });
        });

        // Enhanced button interactions
        const buttons = document.querySelectorAll('button');
        buttons.forEach(button => {
            button.addEventListener('click', function(e) {
                if (this.disabled) return;

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
                    background: rgba(255, 255, 255, 0.5);
                    border-radius: 50%;
                    transform: scale(0);
                    animation: ripple 0.6s linear;
                    pointer-events: none;
                `;
                this.appendChild(ripple);
                setTimeout(() => ripple.remove(), 600);
            });
        });

        // Add ripple animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to { transform: scale(4); opacity: 0; }
            }
        `;
        document.head.appendChild(style);

        // Auto-hide messages
        const messages = document.querySelectorAll('.message');
        messages.forEach(message => {
            setTimeout(() => {
                message.style.opacity = '0';
                message.style.transform = 'translateX(-20px)';
                setTimeout(() => message.remove(), 300);
            }, 5000);
        });
    });
</script>
</body>
</html>