<%@ page import="java.sql.*" %>
<%@ page import="dao.showtrains" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Train Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"></script>

    <style>
        .table th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>

<!-- Header -->
<div class="container-fluid py-3" style="background-color: #007bff; color: white;">
    <div class="row align-items-center">
        <div class="col-auto">
            <a href="<%= request.getContextPath() %>/Admin/adminportal.jsp" class="btn btn-outline-light">
                <i class="bi bi-arrow-left"></i> Back
            </a>
        </div>
        <div class="col text-center">
            <h3 class="mb-0">Delete Trains</h3>
        </div>
        <%-- <div class="col-auto">
            <span class="me-3">Welcome, <strong><%= request.getAttribute("username") %></strong></span>
            <a href="login.jsp" class="btn btn-danger">Logout</a>
        </div> --%>
    </div>
</div>

<!-- Train List -->
<div class="container mt-4">
    <h2 class="text-center">Train List</h2>
    <table class="table table-bordered text-center">
        <thead>
            <tr>
                <th>Train Number</th>
                <th>Train Name</th>
                <th>Origin</th>
                <th>Destination</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                ResultSet rs = showtrains.display();
                while (rs.next()) { 
            %>
            <tr id="row-<%= rs.getInt("trainNumber") %>">
                <td><%= rs.getInt("trainNumber") %></td>
                <td><%= rs.getString("trainName") %></td>
                <td><%= rs.getString("originStation") %></td>
                <td><%= rs.getString("destinationStation") %></td>
                <td>
    <form action="../deleteTrainServlet" method="post">
        <input type="hidden" name="trainNumber" value="<%= rs.getInt("trainNumber") %>">
        <input type="submit" class="btn btn-danger btn-sm" value="Delete">
      
    </form>
</td>

            </tr>
            <% } %>
        </tbody>
    </table>
</div>



</body>
</html>
