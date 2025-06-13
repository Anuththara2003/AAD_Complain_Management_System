<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>
</head>
<style>
    body {
        font-family: "Segoe UI", sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: #333;
    }

    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 12px 15px;
        border: 1px solid #ddd;
        text-align: center;
    }

    th {
        background-color: #222;
        color: white;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

</style>
<body>
<h1>Employee Dashboard</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Description</th>
        <th>Status</th>
        <th>Remarks</th>
        <th>Created At</th>
    </tr>
    <tr>
        <td>1</td>
        <td>Computer not working</td>
        <td>PENDING</td>
        <td>-</td>
        <td>2025-06-13 10:45:00</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Network issue</td>
        <td>IN_PROGRESS</td>
        <td>Assigned to IT</td>
        <td>2025-06-12 14:30:00</td>
    </tr>
    <tr>
        <td>3</td>
        <td>Software crash</td>
        <td>RESOLVED</td>
        <td>Fixed and updated</td>
        <td>2025-06-11 09:15:00</td>
    </tr>
</table>
</body>
</html>
