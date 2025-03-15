<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="bookingModal" class="hidden fixed inset-0 flex items-center justify-center bg-gray-900 bg-opacity-50">
    <div class="bg-white p-6 rounded-lg shadow-lg w-96">
        <h2 class="text-lg font-bold mb-4">Book Train Ticket</h2>
        
        <!-- Booking Form -->
        <form action="<%= request.getContextPath() %>/bookTicketServlet" method="post">
            <!-- Hidden Fields for Train Details -->
            <input type="hidden" id="trainNumber" name="trainNumber">
            <input type="hidden" id="trainName" name="trainName">
            <input type="hidden" id="origin" name="origin">
            <input type="hidden" id="destination" name="destination">
            <input type="hidden" id="departureTime" name="departureTime">
            <input type="hidden" id="arrivalTime" name="arrivalTime">
            <input type="hidden" id="trainDate" name="trainDate">
            
            <!-- Passenger Details -->
            <label>Name:</label>
            <input type="text" name="passengerName" class="w-full border p-2 mb-2" required>

            <label>Age:</label>
            <input type="number" name="passengerAge" class="w-full border p-2 mb-2" required>

            <label>Gender:</label>
            <div class="mb-2">
                <input type="radio" name="gender" value="Male" required> Male
                <input type="radio" name="gender" value="Female"> Female
            </div>

            <label>Class:</label>
            <div class="mb-2">
                <input type="radio" name="class" value="1AC" required> 1AC
                <input type="radio" name="class" value="2AC"> 2AC
                <input type="radio" name="class" value="3AC"> 3AC
                <input type="radio" name="class" value="SS"> SS
                <input type="radio" name="class" value="Sleeper"> Sleeper
            </div>

            <label>Number of Tickets:</label>
           <input type="number" id="numTickets" name="numTickets" class="w-full border p-2 mb-2" min="1" required>

            <p class="text-sm text-gray-700">Amount to Pay: <span id="amountToPay">₹0</span></p>

            <label>Payment Method:</label>
            <div class="mb-2">
                <input type="radio" name="paymentMethod" value="Google Pay" required> Google Pay
                <input type="radio" name="paymentMethod" value="PhonePe"> PhonePe
            </div>

            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Book</button>
            <button type="button" id="closeModal" class="bg-red-500 text-white px-4 py-2 rounded">Close</button>
        </form>
    </div>
</div>

<!-- JavaScript to Handle Modal and Amount Calculation -->
<script>
    function calculateAmount() {
        let numTickets = document.getElementById('numTickets').value;
        let amount = parseInt(numTickets) * 100; // ₹100 per ticket
        if (isNaN(amount)) {
            amount = 0; // Set to zero if invalid input
        }
        document.getElementById('amountToPay').innerText = "₹" + amount;
    }

    document.addEventListener("DOMContentLoaded", function () {
        let numTicketsField = document.getElementById("numTickets");
        if (numTicketsField) {
            numTicketsField.addEventListener("input", calculateAmount);
        }
    });

    document.querySelectorAll('.open-modal').forEach(button => {
        button.addEventListener('click', function () {
            document.getElementById('trainNumber').value = this.dataset.trainNumber;
            document.getElementById('trainName').value = this.dataset.trainName;
            document.getElementById('origin').value = this.dataset.origin;
            document.getElementById('destination').value = this.dataset.destination;
            document.getElementById('departureTime').value = this.dataset.departureTime;
            document.getElementById('arrivalTime').value = this.dataset.arrivalTime;
            document.getElementById('trainDate').value = this.dataset.trainDate;
            document.getElementById('bookingModal').classList.remove('hidden');
        });
    });

    document.getElementById('closeModal').addEventListener('click', function () {
        document.getElementById('bookingModal').classList.add('hidden');
    });
</script>
