<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.showbookingsDao" %>

<%
    ResultSet rs = null;
    try {
        rs = showbookingsDao.display();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Your Bookings</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid py-3" style="background-color: #007bff; color: white;">
    <div class="row align-items-center">
        <div class="col-auto">
            <a href="<%= request.getContextPath() %>/user/userportal.jsp" class="btn btn-outline-light">
                <i class="bi bi-arrow-left"></i> Back
            </a>
        </div>
        <div class="col text-center">
            <h3 class="mb-0">Manage Tickets</h3>
        </div>
    </div>
</div>

<!-- Search Box -->
<div class="container mt-3">
    <input type="text" id="searchInput" class="form-control" placeholder="Search by Train Name, Number, or Date...">
</div>

<div class="container mt-4">
    <% if (rs != null && rs.next()) { %>  
    <div class="card shadow-lg p-4">
        <h2 class="text-center text-primary mb-4">Your Bookings</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover" id="bookingsTable">
                <thead class="table-dark">
                    <tr>
                        <th>Train Number</th>
                        <th>Train Name</th>
                        <th>Class</th>
                        <th>No of Tickets</th>
                        <th>Status</th>
                        <th>Total Pay</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% do { %> 
                    <tr>
                        <td><%= rs.getString("trainnumber") %></td>
                        <td><%= rs.getString("trainname") %></td>
                        <td><%= rs.getString("class") %></td>
                        <td><%= rs.getString("noofticket") %></td>
                        <td><%= rs.getString("status") %></td>
                        <td><%= rs.getInt("totalpay") %></td>
                        <td>
                            <form action="<%= request.getContextPath() %>/deleteTicketServlet" method="post">
                                <input type="hidden" name="bookingId" value="<%= rs.getInt("id") %>">
                                <input type="submit" class="btn btn-danger" value="Cancel">
                            </form>
                        </td>
                    </tr>
                    <% } while (rs.next()); %>
                </tbody>
            </table>
        </div>
    </div>
    <% } else { %>  
    <!-- If no bookings found -->
    <div class="card shadow-lg p-4 text-center">
        <h2 class="text-danger">No Bookings Found</h2>
        <p class="text-muted">You have not made any bookings yet.</p>
    </div>
    <% } %>  
</div>

<!-- JavaScript for Filtering Table -->
<script>
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let filter = this.value.toUpperCase();
        let table = document.getElementById("bookingsTable").getElementsByTagName("tbody")[0];
        let rows = table.getElementsByTagName("tr");

        for (let i = 0; i < rows.length; i++) {
            let trainNumber = rows[i].getElementsByTagName("td")[0]; // Train Number column
            let trainName = rows[i].getElementsByTagName("td")[1]; // Train Name column
            let trainClass = rows[i].getElementsByTagName("td")[2]; // Class column

            if (trainNumber && trainName && trainClass) {
                let textValue =
                    trainNumber.textContent.toUpperCase() + 
                    trainName.textContent.toUpperCase() + 
                    trainClass.textContent.toUpperCase();

                rows[i].style.display = textValue.includes(filter) ? "" : "none";
            }
        }
    });
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
    }
%>
