<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <%
 session.setMaxInactiveInterval(10 * 60); 
        String usersession = (String)session.getAttribute("username");
        if(usersession == null)
        {
        	response.sendRedirect("../login.jsp?error=sessionExpired");
        	return;
        }
        %>
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
        <h3>User Portal</h3>
        <div>
       
   
            <span>Welcome, <strong><%=usersession %></strong></span>
            <a href="<%= request.getContextPath() %>/LogoutServlet" class="logout-btn">Logout</a>

        </div>
    </div>

    <!-- Admin Portal Content -->
    <div class="container">
        <h2 class="text-center text-primary mb-4">User Dashboard</h2>
        <div class="row">
            <!-- Add Train -->
            <div class="col-md-6">
                <div class="card bg-light">
                    <div class="card-body text-center">
                        <h5 class="card-title">Find Train</h5>
                        <p class="card-text">Find a train to book.</p>
                        <a href="<%= request.getContextPath() %>/user/searchresult.jsp" class="btn btn-primary">Search Trains</a>
                    </div>
                </div>
            </div>

            <!-- Update Train -->
            <div class="col-md-6">
                <div class="card bg-light">
                    <div class="card-body text-center">
                        <h5 class="card-title">Bookings</h5>
                        <p class="card-text">Manage your bookings.</p>
                        <a href="<%= request.getContextPath() %>/user/showbookings.jsp" class="btn btn-warning">Manage Bookings</a>
                    </div>
                </div>
            </div>

            <!-- Delete Train -->
         <%--    <div class="col-md-4">
                <div class="card bg-light">
                    <div class="card-body text-center">
                        <h5 class="card-title">Delete Train</h5>
                        <p class="card-text">Remove train details from the system.</p>
                        <a href="<%= request.getContextPath() %>/Admin/deletetrain.jsp" class="btn btn-danger">Cancel Booking</a>
                    </div>
                </div>
            </div> --%>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
