<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/addtrain.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Train Details</title>

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
            <h3 class="mb-0">Add Train</h3>
        </div>


    </div>
</div>

<!-- Bootstrap Icons (for the back arrow) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">


</head>
<body>
    <section class="form-container">
        <form id="trainForm" action="AddTrainServlet" method="post">
            <label for="trainNumber">Train Number:</label>
            <input type="number" id="trainNumber" name="trainNumber" min="0" required>
            <label for="trainName">Train Name:</label>
            <input type="text" id="trainName" name="trainName" min="0" required>
            <label for="originStation">Origin Station:</label>
            <input type="text" id="originStation" name="originStation" required>
            <label for="destinationStation">Destination Station:</label>
            <input type="text" id="destinationStation" name="destinationStation" required>
            <label for="trainDate">Train Date:</label>
            <input type="date" id="trainDate" name="trainDate" min="2025-03-12" required>
            <label for="arrivalTime">Arrival Time:</label>
            <input type="time" id="arrivalTime" name="arrivalTime" required>
            <label for="departureTime">Departure Time:</label>
            <input type="time" id="departureTime" name="departureTime" required>
            <label for="sleeper">Sleeper:</label>
            <input type="number" id="sleeper" name="sleeper" min="0" required>
            <label for="secondSitting">Second Sitting:</label>
            <input type="number" id="secondSitting" name="secondSitting" min="0" required>
            <label for="thirdAC">3rd AC:</label>
            <input type="number" id="thirdAC" name="thirdAC" min="0" required>
            <label for="secondAC">2nd AC:</label>
            <input type="number" id="secondAC" name="secondAC" min="0" required>
            <label for="firstAC">1st AC:</label>
            <input type="number" id="firstAC" name="firstAC" min="0" required>
            <label for="numberOfSeats">Total Seats:</label>
            <input type="number" id="numberOfSeats" name="numberOfSeats" min="0" required>
            <input type="submit" value="Submit">
        </form>
    </section>
</body>
</html>