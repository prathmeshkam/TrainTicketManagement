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
        <%-- <div class="col-auto">
            <span class="me-3">Welcome, <strong><%= request.getAttribute("username") %></strong></span>
            <a href="login.jsp" class="btn btn-danger">Logout</a>
        </div> --%>
    </div>
</div>

<div class="container mt-5">
    <% if (rs != null && rs.next()) { %>  
    <div class="card shadow-lg p-4">
        <h2 class="text-center text-primary mb-4">Your Bookings</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
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
                        <td><%= rs.getInt("totalpay") %></td> <!-- Assuming 1 ticket per booking -->
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
