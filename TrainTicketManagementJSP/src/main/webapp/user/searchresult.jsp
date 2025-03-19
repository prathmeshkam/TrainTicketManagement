<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String usersession = (String) session.getAttribute("username");
    if (usersession == null) {
        response.sendRedirect("../login.jsp?error=sessionExpired");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RailBooker - User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-50">
    <!-- Navigation -->
    <nav class="bg-white shadow-md fixed w-full z-50 fixed top-0 w-full ">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <i class="fas fa-train text-blue-600 text-2xl"></i>
                    <span class="ml-2 text-xl font-bold text-gray-900">Train Ticket Management System</span>
                </div>
                
                <!-- Desktop Navigation -->
                <div class="hidden md:flex items-center space-x-8">
                    <a href="<%= request.getContextPath() %>/user/userportal.jsp" class="text-gray-900 hover:text-blue-600">Home</a>
<!--                     <a href="#" class="text-gray-900 hover:text-blue-600">Ticket Booking</a>
                    <a href="#" class="text-gray-900 hover:text-blue-600">Login/Signup</a> -->
                   
                </div>

                <!-- Mobile menu button -->
                <div class="md:hidden flex items-center">
                    <button onclick="toggleMenu()" class="text-gray-900 hover:text-blue-600">
                        <i class="fas fa-bars"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Mobile Navigation -->
        <div id="mobileMenu" class="hidden md:hidden">
            <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
                <a href="index.jsp" class="block px-3 py-2 text-gray-900 hover:text-blue-600">Home</a>
                <a href="#" class="block px-3 py-2 text-gray-900 hover:text-blue-600">Login</a>
            </div>
        </div>
    </nav>

<!-- Search Section -->
    <div class="container mx-auto px-4 mt-24">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <form action="<%= request.getContextPath() %>/searchTrainServlet" method="post" class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="flex flex-col">
                    <label class="mb-2 text-sm font-medium text-gray-700">From</label>
                    <div class="relative">
                        <i class="fas fa-map-marker-alt absolute left-3 top-3 text-gray-400"></i>
                        <input type="text" name="from" 
                               class="pl-10 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                               placeholder="Departure Station" required>
                    </div>
                </div>
                <div class="flex flex-col">
                    <label class="mb-2 text-sm font-medium text-gray-700">To</label>
                    <div class="relative">
                        <i class="fas fa-map-marker-alt absolute left-3 top-3 text-gray-400"></i>
                        <input type="text" name="to"
                               class="pl-10 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                               placeholder="Destination Station" required>
                    </div>
                </div>
                <div class="flex flex-col">
                    <label class="mb-2 text-sm font-medium text-gray-700">Date</label>
                    <div class="relative">
                        <i class="fas fa-calendar absolute left-3 top-3 text-gray-400"></i>
                        <input type="date" name="date"
                               class="pl-10 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                               required>
                    </div>
                </div>
                <div class="col-span-full">
                    <input type="submit" 
                            class="w-full bg-blue-600 text-white font-bold py-3 px-6 rounded-lg hover:bg-blue-700 transition duration-300" value="Search Train">
                   
                </div>
            </form>
        </div>
    </div>

	<jsp:include page="/user/searchdata.jsp" />


    <!-- JavaScript for mobile menu toggle -->
    <script>
        function toggleMenu() {
            const menu = document.getElementById('mobileMenu');
            menu.classList.toggle('hidden');
        }
    </script>
    <!-- JavaScript -->
    <script>
        // Mobile menu toggle
        function toggleMenu() {
            const menu = document.getElementById('mobileMenu');
            menu.classList.toggle('hidden');
        }

        // Form validation
        function validateForm() {
            const password = document.getElementById('password').value;
            const contact = document.getElementById('contact').value;

            // Password validation
            if (password.length < 6 || password.length > 12) {
                alert('Password must be between 6 and 12 characters');
                return false;
            }

            // Contact number validation
            if (!/^\d{10}$/.test(contact)) {
                alert('Contact number must be exactly 10 digits');
                return false;
            }

            return true;
        }
    </script>
    
</body>
</html>