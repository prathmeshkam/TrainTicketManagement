<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Train" %>

<% List<Train> trainList = (List<Train>) request.getAttribute("trainList"); %>

<div class="container mx-auto px-4 mt-6">
    
    <!-- Search Box -->
    <div class="mb-4">
        <input type="text" id="searchInput" class="w-full p-2 border border-gray-300 rounded" 
               placeholder="Search by Train Name, Number, Origin, Destination, or Date...">
    </div>

    <% if (trainList != null && !trainList.isEmpty()) { %>
    <div class="bg-white rounded-lg shadow-lg p-6">
        <h2 class="text-lg font-bold text-gray-800 mb-4">Available Trains</h2>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border border-gray-200" id="trainsTable">
                <thead>
                    <tr class="bg-gray-100 border-b">
                        <th class="py-2 px-4 border">Train Number</th>
                        <th class="py-2 px-4 border">Train Name</th>
                        <th class="py-2 px-4 border">Origin</th>
                        <th class="py-2 px-4 border">Destination</th>
<th class="py-2 px-4 border cursor-pointer" onclick="sortTableByDeparture()">
    Departure ⬍
</th>
                        <th class="py-2 px-4 border">Arrival</th>
                        <th class="py-2 px-4 border">Seats Available</th>
                        <th class="py-2 px-4 border">Date</th>
                        <th class="py-2 px-4 border">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Train train : trainList) { %>
                    <tr class="border-b">
                        <td class="py-2 px-4 border"><%= train.getTrainNumber() %></td>
                        <td class="py-2 px-4 border"><%= train.getTrainName() %></td>
                        <td class="py-2 px-4 border"><%= train.getOriginStation() %></td>
                        <td class="py-2 px-4 border"><%= train.getDestinationStation() %></td>
                        <td class="py-2 px-4 border"><%= train.getDepartureTime() %></td>
                        <td class="py-2 px-4 border"><%= train.getArrivalTime() %></td>
                        <td class="py-2 px-4 border"><%= train.getNumberOfSeats() %></td>
                        <td class="py-2 px-4 border"><%= train.getTraindate() %></td>
                        <td class="py-2 px-4 border">
                            <button type="button" class="open-modal bg-blue-500 text-white px-4 py-2 rounded"
                                    data-train-number="<%= train.getTrainNumber() %>"
                                    data-train-name="<%= train.getTrainName() %>"
                                    data-origin="<%= train.getOriginStation() %>"
                                    data-destination="<%= train.getDestinationStation() %>"
                                    data-departure-time="<%= train.getDepartureTime() %>"
                                    data-arrival-time="<%= train.getArrivalTime() %>"
                                    data-train-date="<%= train.getTraindate() %>">
                                Book
                            </button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <% } else { %>
    <div class="bg-white rounded-lg shadow-lg p-6 text-center">
        <h2 class="text-lg font-bold text-gray-800">No Trains Found</h2>
        <p class="text-gray-600">No trains are available for the selected route and date.</p>
    </div>
    <% } %>
</div>

<!-- JavaScript for Filtering Trains -->
<script>
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let filter = this.value.toUpperCase();
        let table = document.getElementById("trainsTable").getElementsByTagName("tbody")[0];
        let rows = table.getElementsByTagName("tr");

        for (let i = 0; i < rows.length; i++) {
            let trainNumber = rows[i].getElementsByTagName("td")[0]; // Train Number column
            let trainName = rows[i].getElementsByTagName("td")[1]; // Train Name column
            let origin = rows[i].getElementsByTagName("td")[2]; // Origin column
            let destination = rows[i].getElementsByTagName("td")[3]; // Destination column
            let trainDate = rows[i].getElementsByTagName("td")[7]; // Date column

            if (trainNumber && trainName && origin && destination && trainDate) {
                let textValue =
                    trainNumber.textContent.toUpperCase() + 
                    trainName.textContent.toUpperCase() + 
                    origin.textContent.toUpperCase() + 
                    destination.textContent.toUpperCase() +
                    trainDate.textContent.toUpperCase();

                rows[i].style.display = textValue.includes(filter) ? "" : "none";
            }
        }
    });
    
    
    let sortOrder = 1; // 1 for ascending, -1 for descending

    function sortTableByDeparture() {
        let table = document.getElementById("trainsTable").getElementsByTagName("tbody")[0];
        let rows = Array.from(table.getElementsByTagName("tr"));

        rows.sort((rowA, rowB) => {
            let timeA = rowA.getElementsByTagName("td")[4].textContent.trim();
            let timeB = rowB.getElementsByTagName("td")[4].textContent.trim();

            // Convert "HH:mm" format to Date object for comparison
            let dateA = new Date("1970-01-01 " + timeA);
            let dateB = new Date("1970-01-01 " + timeB);

            return (dateA - dateB) * sortOrder;
        });

        // Reorder table rows
        rows.forEach(row => table.appendChild(row));

        // Toggle sorting order for next click
        sortOrder *= -1;
    }
</script>

<!-- Include the Popup Modal -->
<jsp:include page="bookingpopup.jsp" />
