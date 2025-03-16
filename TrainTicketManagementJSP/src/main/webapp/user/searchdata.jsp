<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Train" %>

<% List<Train> trainList = (List<Train>) request.getAttribute("trainList"); %>

<div class="container mx-auto px-4 mt-6">
    <% if (trainList != null && !trainList.isEmpty()) { %>
    <div class="bg-white rounded-lg shadow-lg p-6">
        <h2 class="text-lg font-bold text-gray-800 mb-4">Available Trains</h2>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border border-gray-200">
                <thead>
                    <tr class="bg-gray-100 border-b">
                        <th class="py-2 px-4 border">Train Number</th>
                        <th class="py-2 px-4 border">Train Name</th>
                        <th class="py-2 px-4 border">Origin</th>
                        <th class="py-2 px-4 border">Destination</th>
                        <th class="py-2 px-4 border">Departure</th>
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

<!-- Include the Popup Modal -->
<jsp:include page="bookingpopup.jsp" />
