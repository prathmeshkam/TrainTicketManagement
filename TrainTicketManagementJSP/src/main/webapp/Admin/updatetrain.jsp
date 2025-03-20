<%@ page import="java.sql.*" %>
<%@ page import="dao.showtrains" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Trains</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"></script>
</head>
<body>

<div class="container-fluid py-3" style="background-color: #007bff; color: white;">
    <div class="row align-items-center">
        <div class="col-auto">
            <a href="adminportal.jsp" class="btn btn-outline-light">
                <i class="bi bi-arrow-left"></i> Back
            </a>
        </div>
        <div class="col text-center">
            <h3 class="mb-0">Update Train</h3>
        </div>
    </div>
</div>

<div class="container mt-4">
    <h2 class="text-center">Train List</h2>

    <!-- Search Bar -->
    <div class="mb-3">
        <input type="text" id="searchInput" class="form-control" placeholder="Search by Train Number, Name, or Date..." onkeyup="searchTable()">
    </div>

    <table class="table table-bordered" id="trainTable">
        <thead class="table-dark">
            <tr>
                <th>Train Number</th>
                <th>Train Name</th>
                <th>Origin</th>
                <th>Destination</th>
                <th>Train Date</th>
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
                <td><%= rs.getDate("trainDate") %></td> <!-- Train Date Column -->
                <td>
                    <button class="btn btn-warning btn-sm" onclick="openUpdatePopup(
                        '<%= rs.getInt("trainNumber") %>',
                        '<%= rs.getString("trainName") %>',
                        '<%= rs.getString("originStation") %>',
                        '<%= rs.getString("destinationStation") %>',
                        '<%= rs.getString("arrivalTime") %>',
                        '<%= rs.getString("departureTime") %>',
                        '<%= rs.getDate("trainDate") %>',
                        '<%= rs.getInt("sleeper") %>',
                        '<%= rs.getInt("secondSitting") %>',
                        '<%= rs.getInt("thirdAC") %>',
                        '<%= rs.getInt("secondAC") %>',
                        '<%= rs.getInt("firstAC") %>',
                        '<%= rs.getInt("numberOfSeats") %>'
                    )">Update</button>
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
            let trainDate = cols[4].innerText.toLowerCase();

            if (trainNumber.includes(input) || trainName.includes(input) || trainDate.includes(input)) {
                rows[i].style.display = "";
            } else {
                rows[i].style.display = "none";
            }
        }
    }
</script>

</body>
</html>
