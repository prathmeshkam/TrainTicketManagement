<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Booking Popup (Popup 1) -->
<div id="bookingModal" class="hidden fixed inset-0 flex items-center justify-center bg-gray-900 bg-opacity-50">
    <div class="bg-white p-6 rounded-lg shadow-lg w-96">
        <h2 class="text-lg font-bold mb-4">Book Train Ticket</h2>
        
        <form id="ticketForm">
            <!-- Hidden Fields for Train Details -->
            <input type="hidden" id="trainNumber" name="trainNumber">
            <input type="hidden" id="trainName" name="trainName">
            <input type="hidden" id="trainDate" name="trainDate">

            <label>Number of Tickets:</label>
            <input type="number" id="numTickets" name="numTickets" class="w-full border p-2 mb-2" min="1" required>

            <p class="text-sm text-gray-700">Amount to Pay: <span id="amountToPay">₹0</span></p>

            <label>Payment Method:</label>
            <div class="mb-2">
                <input type="radio" name="paymentMethod" value="Google Pay" required> Google Pay
                <input type="radio" name="paymentMethod" value="PhonePe"> PhonePe
            </div>

            <button type="button" id="addPassengerBtn" class="bg-green-500 text-white px-4 py-2 rounded mb-2">Add Passenger</button>
            <button type="button" id="closeBookingModal" class="bg-red-500 text-white px-4 py-2 rounded">Close</button>
        </form>
    </div>
</div>

<!-- Passenger Popup (Popup 2) -->
<div id="passengerModal" class="hidden fixed inset-0 flex items-center justify-center bg-gray-900 bg-opacity-50">
    <div class="bg-white p-6 rounded-lg shadow-lg w-96">
        <h2 class="text-lg font-bold mb-4">Add Passenger</h2>

        <form id="passengerForm" action="<%= request.getContextPath() %>/bookTicketServlet" method="post">
            <!-- Hidden Fields to Pass Train Details -->
            <input type="hidden" name="trainNumber" id="pTrainNumber">
            <input type="hidden" name="trainName" id="pTrainName">
            <input type="hidden" name="trainDate" id="pTrainDate">
            <input type="hidden" name="paymentMethod" id="pPaymentMethod">
            <input type="hidden" name="numTickets" id="pNumTickets">

            <label>Passenger Name:</label>
            <input type="text" name="passengerName[]" class="w-full border p-2 mb-2" required>

            <label>Age:</label>
            <input type="number" name="passengerAge[]" class="w-full border p-2 mb-2" required>

            <label>Gender:</label>
            <div class="mb-2">
                <input type="radio" name="gender1" value="Male" required> Male
                <input type="radio" name="gender1" value="Female"> Female
            </div>

            <label>Class:</label>
            <div class="mb-2">
                <input type="radio" name="class1" value="1AC" required> 1AC
                <input type="radio" name="class1" value="2AC"> 2AC
                <input type="radio" name="class1" value="3AC"> 3AC
                <input type="radio" name="class1" value="SS"> SS
                <input type="radio" name="class1" value="Sleeper"> Sleeper
            </div>

            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Book</button>
            <button type="button" id="closePassengerModal" class="bg-red-500 text-white px-4 py-2 rounded">Close</button>
        </form>
    </div>
</div>

<!-- JavaScript to Handle Modal and Booking Flow -->
<script>
    let totalPassengers = 0;
    let addedPassengers = 0;
    let passengers = [];

    function openPassengerModal() {
        totalPassengers = parseInt(document.getElementById('numTickets').value);
        if (addedPassengers >= totalPassengers) {
            alert("You have added all passengers.");
            return;
        }
        
        // Show the passenger modal
        document.getElementById("passengerModal").classList.remove("hidden");
    }

    function addPassenger() {
        // Get passenger details
        let name = document.querySelector('input[name="passengerName[]"]').value;
        let age = document.querySelector('input[name="passengerAge[]"]').value;
        let gender = document.querySelector('input[name="gender1"]:checked').value;
        let travelClass = document.querySelector('input[name="class1"]:checked').value;

        // Store passenger in array
        passengers.push({ name, age, gender, travelClass });

        addedPassengers++;

        if (addedPassengers < totalPassengers) {
            alert(`Passenger ${addedPassengers} added! Add next passenger.`);
            document.querySelector('input[name="passengerName[]"]').value = '';
            document.querySelector('input[name="passengerAge[]"]').value = '';
        } else {
            alert("All passengers added! Submitting the form...");
            submitForm();
        }
    }

    function submitForm() {
        let form = document.createElement("form");
        form.method = "POST";
        form.action = "<%= request.getContextPath() %>/bookTicketServlet";

        // Add train details
        form.appendChild(createHiddenField("trainNumber", document.getElementById('trainNumber').value));
        form.appendChild(createHiddenField("trainName", document.getElementById('trainName').value));
        form.appendChild(createHiddenField("trainDate", document.getElementById('trainDate').value));
        form.appendChild(createHiddenField("paymentMethod", document.querySelector('input[name="paymentMethod"]:checked').value));

        // Add passenger details
        passengers.forEach((passenger, index) => {
            form.appendChild(createHiddenField(`passengerName${index + 1}`, passenger.name));
            form.appendChild(createHiddenField(`passengerAge${index + 1}`, passenger.age));
            form.appendChild(createHiddenField(`gender${index + 1}`, passenger.gender));
            form.appendChild(createHiddenField(`class${index + 1}`, passenger.travelClass));
        });

        document.body.appendChild(form);
        form.submit();
    }

    function createHiddenField(name, value) {
        let input = document.createElement("input");
        input.type = "hidden";
        input.name = name;
        input.value = value;
        return input;
    }

    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("numTickets").addEventListener("input", function () {
            document.getElementById('amountToPay').innerText = "₹" + (parseInt(this.value) * 100);
        });

        document.getElementById("addPassengerBtn").addEventListener("click", openPassengerModal);
        document.getElementById("closePassengerModal").addEventListener("click", function () {
            document.getElementById("passengerModal").classList.add("hidden");
        });

        document.querySelector("#passengerForm").addEventListener("submit", function (event) {
            event.preventDefault();
            addPassenger();
        });
    });
</script>
