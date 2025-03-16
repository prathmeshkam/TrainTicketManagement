<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            transition: 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logout-btn {
            background-color: #dc3545;
            border: none;
            padding: 8px 15px;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <h3>Admin Portal</h3>
        <div>
            <span>Welcome, <strong><%= (String)session.getAttribute("username") %></strong></span>
            <a href="<%= request.getContextPath() %>/login.jsp" class="logout-btn">Logout</a>

        </div>
    </div>

    <!-- Admin Portal Content -->
    <div class="container">
        <h2 class="text-center text-primary mb-4">Admin Dashboard</h2>
        <div class="row">
            <!-- Add Train -->
            <div class="col-md-4">
                <div class="card bg-light">
                    <div class="card-body text-center">
                        <h5 class="card-title">Add Train</h5>
                        <p class="card-text">Register a new train with all necessary details.</p>
                        <a href="<%= request.getContextPath() %>/Admin/AddTrain.jsp" class="btn btn-primary">Go to Registration</a>
                    </div>
                </div>
            </div>

            <!-- Update Train -->
            <div class="col-md-4">
                <div class="card bg-light">
                    <div class="card-body text-center">
                        <h5 class="card-title">Update Train</h5>
                        <p class="card-text">Modify existing train details.</p>
                        <a href="<%= request.getContextPath() %>/Admin/updatetrain.jsp" class="btn btn-warning">Update Train</a>
                    </div>
                </div>
            </div>

            <!-- Delete Train -->
            <div class="col-md-4">
                <div class="card bg-light">
                    <div class="card-body text-center">
                        <h5 class="card-title">Delete Train</h5>
                        <p class="card-text">Remove train details from the system.</p>
                        <a href="<%= request.getContextPath() %>/Admin/deletetrain.jsp" class="btn btn-danger">Delete Train</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
