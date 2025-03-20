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
    </div>
</div>

<!-- Train List -->
<div class="container mt-4">
    <h2 class="text-center">Train List</h2>

    <!-- Search Bar -->
    <div class="mb-3">
        <input type="text" id="searchInput" class="form-control" placeholder="Search by Train Number, Name, Origin, or Destination..." onkeyup="searchTable()">
    </div>

    <table class="table table-bordered text-center" id="trainTable">
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
            <tr>
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

<!-- JavaScript for Searching -->
<script>
    function searchTable() {
        let input = document.getElementById("searchInput").value.toLowerCase();
        let table = document.getElementById("trainTable");
        let rows = table.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) { // Skip header row
            let cols = rows[i].getElementsByTagName("td");
            let trainNumber = cols[0].innerText.toLowerCase();
            let trainName = cols[1].innerText.toLowerCase();
            let origin = cols[2].innerText.toLowerCase();
            let destination = cols[3].innerText.toLowerCase();

            if (trainNumber.includes(input) || trainName.includes(input) || origin.includes(input) || destination.includes(input)) {
                rows[i].style.display = "";
            } else {
                rows[i].style.display = "none";
            }
        }
    }
</script>

</body>
</html>
