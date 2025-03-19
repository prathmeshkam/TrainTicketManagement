<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
    String errorMsg = request.getParameter("error");
    if (errorMsg != null && errorMsg.equals("sessionExpired")) {
%>
    <script>
        alert("Your session has expired. Please log in again.");
    </script>
<%
    }
%>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RailBooker - User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-50">
    <!-- Navigation -->
    <nav class="bg-white shadow-md fixed w-full z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <i class="fas fa-train text-blue-600 text-2xl"></i>
                    <span class="ml-2 text-xl font-bold text-gray-900">Train Ticket Management System</span>
                </div>
                
                <!-- Desktop Navigation -->
                <div class="hidden md:flex items-center space-x-8">
                    <a href="landing.jsp" class="text-gray-900 hover:text-blue-600">Home</a>
                    <!-- <a href="#" class="text-gray-900 hover:text-blue-600">Ticket Booking</a> -->
                    <!-- <a href="#" class="text-gray-900 hover:text-blue-600">Login/Signup</a> -->
                   
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

    <!-- Registration Form Section -->
    <div class="min-h-screen pt-16 pb-12">
        <div class="max-w-2xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
            <div class="bg-white rounded-lg shadow-lg p-8">
                <h2 class="text-3xl font-bold text-center text-gray-900 mb-8">Login Page</h2>
                
                <form action="LoginServlet" method="post" class="space-y-6" onsubmit="return validateForm()">
                    <!-- User Name -->
                    <div>
                        <label for="username" class="block text-sm font-medium text-gray-700">User Name</label>
                        <div class="mt-1 relative">
                            <i class="fas fa-user absolute left-3 top-3 text-gray-400"></i>
                            <input type="text" id="username" name="username" maxlength="50" required
                                   class="pl-10 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                   placeholder="Enter your username">
                        </div>
                    </div>

                    <!-- Password -->
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                        <div class="mt-1 relative">
                            <i class="fas fa-lock absolute left-3 top-3 text-gray-400"></i>
                            <input type="password" id="password" name="password" minlength="6" maxlength="12" required
                                   class="pl-10 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                                   placeholder="Enter your password">
                        </div>
                        <p class="mt-1 text-sm text-gray-500">Password must be 6-12 characters long</p>
                    </div>
                    <!-- Radio button -->
                       <div style="display: flex;">
                             <input type="radio" id="role1" name="role" value="admin" required>&nbsp;&nbsp;
                             <label for="admin">Admin </label>&nbsp;&nbsp;&nbsp;&nbsp;
                             <input type="radio" id="role2" name="role" value="user" required>&nbsp;&nbsp;
                             <label for="user">User </label>
                             
                    </div>
                    <!-- Submit Button -->
                    <div>
                        <input type="submit"
                                class="w-full bg-blue-600 text-white font-bold py-3 px-6 rounded-lg hover:bg-blue-700 transition duration-300" value="Login">
                        
                    </div>
                      <div class="text-center">
                        <p class="text-gray-600">
                            New user? 
                            <a href="Register.jsp" class="text-blue-600 hover:text-blue-800 font-semibold">Register here</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <!-- Footer -->
    <footer class="bg-gray-900 text-white">
        <div class="container mx-auto px-4 py-12">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <div>
                    <div class="flex items-center mb-4">
                        <i class="fas fa-train text-blue-400 text-2xl"></i>
                        <span class="ml-2 text-xl font-bold">Train Ticket Management System</span>
                    </div>
                    <p class="text-gray-400">Your trusted partner for hassle-free train travel booking.</p>
                </div>
                <div>
                    <h3 class="text-lg font-semibold mb-4">Quick Links</h3>
                    <ul class="space-y-2">
                        <li><a href="#" class="text-gray-400 hover:text-white">About Us</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-white">Contact</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-white">Terms & Conditions</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-white">Privacy Policy</a></li>
                    </ul>
                </div>
                <div>
                    <h3 class="text-lg font-semibold mb-4">Contact Info</h3>
                    <ul class="space-y-2 text-gray-400">
                        <li>Skylarks, waghbil road</li>
                        <li>Hiranandani Estate,Mumbai</li>
                        <li>Phone: 7634926994</li>
                        <li>Email: premkumar412k@gmail.com</li>
                    </ul>
                </div>
                <div>
                    <h3 class="text-lg font-semibold mb-4">Follow Us</h3>
                    <div class="flex space-x-4">
                        <a href="#" class="text-gray-400 hover:text-white">
                            <i class="fab fa-facebook text-xl"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-white">
                            <i class="fab fa-twitter text-xl"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-white">
                            <i class="fab fa-instagram text-xl"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="mt-8 pt-8 border-t border-gray-800 text-center text-gray-400">
                <p>&copy; <%= java.time.Year.now() %> Train Ticket Management System. All rights reserved.</p>
            </div>
            <%
            String status = (String) request.getAttribute("login");
            if ("failed".equals(status)) {
        %>
            <script>
                alert("Login Failed! Please check your username and password.");
            </script>
        <%
            }
        %>
        </div>
    </footer>


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

<%-- <body>
    <div class="container">
        <h2>User Login!</h2>
        <form action="LoginServlet" method="post">
            <label for="userName">User Name<sup>*</sup>:</label>
            <input type="text" id="userName" name="username" maxlength="50" required>
            
            <label for="password">Password<sup>*</sup>:</label>
            <input type="password" id="password" name="password" maxlength="20" required>
            
            <div style="display: flex;">
                <label for="admin">Admin<sup>*</sup>:</label>
                <input type="radio" id="role1" name="role" value="admin" required>
                <label for="user">User<sup>*</sup>:</label>
                <input type="radio" id="role2" name="role" value="user" required>
            </div>
            
            <input type="submit" value="Login">
        </form>
        
        <!-- Registration Link -->
        <p>Not registered? <a href="Register.jsp">Register Here</a></p>

        <%
            String status = (String) request.getAttribute("login");
            if ("failed".equals(status)) {
        %>
            <script>
                alert("Login Failed! Please check your username and password.");
            </script>
        <%
            }
        %>
    </div>
</body>--%>