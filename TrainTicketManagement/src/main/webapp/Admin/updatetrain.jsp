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
    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container-fluid py-3" style="background-color: #007bff; color: white;">
    <div class="row align-items-center">
        <!-- Back Button -->
        <div class="col-auto">
            <a href="adminportal.jsp" class="btn btn-outline-light">
                <i class="bi bi-arrow-left"></i> Back
            </a>
        </div>

        <!-- Centered Title -->
        <div class="col text-center">
            <h3 class="mb-0">Update Train</h3>
        </div>

    </div>
</div>

<!-- Bootstrap Icons (for the back arrow) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center">Train List</h2>
    <table class="table table-bordered">
        <thead class="table-dark">
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
                    <button class="btn btn-warning btn-sm" onclick="openUpdatePopup(
                        '<%= rs.getInt("trainNumber") %>',
                        '<%= rs.getString("trainName") %>',
                        '<%= rs.getString("originStation") %>',
                        '<%= rs.getString("destinationStation") %>',
                        '<%= rs.getString("arrivalTime") %>',
                        '<%= rs.getString("departureTime") %>',
                        '<%= rs.getDate("trainDate") %>',  // ✅ Passing trainDate
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

<!-- Update Train Modal -->
<div id="updateModal" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Train Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="updateForm" action="updateTrainServlet" method="post">
                    <input type="hidden" name="action" value="update">

                    <label>Train Number:</label>
                    <input type="text" name="trainNumber" id="trainNumber" class="form-control" readonly>

                    <label>Train Name:</label>
                    <input type="text" name="trainName" id="trainName" class="form-control">

                    <label>Origin Station:</label>
                    <input type="text" name="originStation" id="originStation" class="form-control">

                    <label>Destination Station:</label>
                    <input type="text" name="destinationStation" id="destinationStation" class="form-control">

                    <label>Arrival Time:</label>
                    <div class="input-group">
                        <input type="time" name="arrivalTime" id="arrivalTime" class="form-control">
                        <span class="input-group-text"><i class="bi bi-clock"></i></span>
                    </div>

                    <label>Departure Time:</label>
                    <div class="input-group">
                        <input type="time" name="departureTime" id="departureTime" class="form-control">
                        <span class="input-group-text"><i class="bi bi-clock"></i></span>
                    </div>

                    <label>Train Date:</label>
                    <div class="input-group">
                        <input type="date" name="trainDate" id="trainDate" class="form-control">
                        <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                    </div>

                    <label>Sleeper:</label>
                    <input type="number" name="sleeper" id="sleeper" class="form-control">

                    <label>Second Sitting:</label>
                    <input type="number" name="secondSitting" id="secondSitting" class="form-control">

                    <label>Third AC:</label>
                    <input type="number" name="thirdAC" id="thirdAC" class="form-control">

                    <label>Second AC:</label>
                    <input type="number" name="secondAC" id="secondAC" class="form-control">

                    <label>First AC:</label>
                    <input type="number" name="firstAC" id="firstAC" class="form-control">

                    <label>Number of Seats:</label>
                    <input type="number" name="numberOfSeats" id="numberOfSeats" class="form-control">

                    <button type="submit" class="btn btn-success mt-3">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function openUpdatePopup(trainNumber, trainName, originStation, destinationStation, arrivalTime, departureTime, trainDate, sleeper, secondSitting, thirdAC, secondAC, firstAC, numberOfSeats) {
        document.getElementById("trainNumber").value = trainNumber;
        document.getElementById("trainName").value = trainName;
        document.getElementById("originStation").value = originStation;
        document.getElementById("destinationStation").value = destinationStation;
        document.getElementById("arrivalTime").value = arrivalTime;
        document.getElementById("departureTime").value = departureTime;
        document.getElementById("trainDate").value = trainDate;  // ✅ Setting trainDate
        document.getElementById("sleeper").value = sleeper;
        document.getElementById("secondSitting").value = secondSitting;
        document.getElementById("thirdAC").value = thirdAC;
        document.getElementById("secondAC").value = secondAC;
        document.getElementById("firstAC").value = firstAC;
        document.getElementById("numberOfSeats").value = numberOfSeats;

        var modal = new bootstrap.Modal(document.getElementById('updateModal'));
        modal.show();
    }
</script>

</body>
</html>
