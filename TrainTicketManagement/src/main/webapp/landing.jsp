<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RailBooker - Train Ticket Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
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
                    <a href="#" class="text-gray-900 hover:text-blue-600">Home</a>
                    <!-- <a href="#" class="text-gray-900 hover:text-blue-600">Ticket Booking</a> -->
                    <a href="login.jsp" class="text-gray-900 hover:text-blue-600">Login/Signup</a>
                   
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

    </nav>

    <!-- Hero Section -->
    <div class="relative pt-16 pb-32 flex content-center items-center justify-center min-h-screen bg-cover bg-center"
         style="background-image: url('https://images.unsplash.com/photo-1474487548417-781cb71495f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=2000&q=80');">
        <div class="absolute top-0 w-full h-full bg-black opacity-40"></div>
        <div class="container relative mx-auto">
            <div class="items-center flex flex-wrap">
                <div class="w-full lg:w-6/12 px-4 ml-auto mr-auto text-center">
                    <div class="text-white">
                        <h1 class="text-5xl font-semibold">Book Your Train Tickets Easily</h1>
                        <p class="mt-4 text-lg">Travel seamlessly with our simple and secure booking platform. Get instant confirmations and hassle-free journeys.</p>
                        <button class="mt-8 bg-blue-600 text-white font-bold py-3 px-8 rounded-full hover:bg-blue-700 transition duration-300" 
        onclick="window.location.href='login.jsp'">
    Book Now
</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Search Section -->
<!--     <div class="container mx-auto px-4 -mt-24">
        <div class="bg-white rounded-lg shadow-lg p-6">
            <form action="search" method="post" class="grid grid-cols-1 md:grid-cols-3 gap-4">
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
                    <button type="submit" 
                            class="w-full bg-blue-600 text-white font-bold py-3 px-6 rounded-lg hover:bg-blue-700 transition duration-300">
                        Search Trains
                    </button>
                </div>
            </form>
        </div>
    </div> -->

    <!-- Features Section -->
    <div class="py-24 bg-gray-50">
        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-bold text-center mb-16">Why Choose This application?</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                <div class="text-center">
                    <div class="bg-blue-100 rounded-full p-4 w-16 h-16 flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-credit-card text-blue-600 text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Easy Booking</h3>
                    <p class="text-gray-600">Simple and quick booking process with multiple payment options</p>
                </div>
                <div class="text-center">
                    <div class="bg-blue-100 rounded-full p-4 w-16 h-16 flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-clock text-blue-600 text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Real-time Availability</h3>
                    <p class="text-gray-600">Check seat availability instantly and book with confidence</p>
                </div>
                <div class="text-center">
                    <div class="bg-blue-100 rounded-full p-4 w-16 h-16 flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-shield-alt text-blue-600 text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Secure Payments</h3>
                    <p class="text-gray-600">Your transactions are protected with bank-level security</p>
                </div>
                <div class="text-center">
                    <div class="bg-blue-100 rounded-full p-4 w-16 h-16 flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-times text-blue-600 text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Easy Cancellation</h3>
                    <p class="text-gray-600">Hassle-free cancellation with quick refunds</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Testimonials Section -->
    <div class="py-24">
        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-bold text-center mb-16">What Our Customers Say</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <div class="flex items-center mb-4">
                        <img
                             class="w-12 h-12 rounded-full mr-4">
                        <div>
                            <h3 class="font-semibold">Prem Kumar</h3>
                            <p class="text-gray-600 text-sm">Regular Traveler</p>
                        </div>
                    </div>
                    <p class="text-gray-600 italic">It made my frequent travels so much easier. The booking process is smooth, and I love the instant confirmation feature!</p>
                </div>
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <div class="flex items-center mb-4">
                        <img 
                             class="w-12 h-12 rounded-full mr-4">
                        <div>
                            <h3 class="font-semibold">Prathmesh Kamble</h3>
                            <p class="text-gray-600 text-sm">Business Traveler</p>
                        </div>
                    </div>
                    <p class="text-gray-600 italic">As a business traveler, I appreciate the reliability and efficiency of This Application. This Application tickets are a great touch!</p>
                </div>
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <div class="flex items-center mb-4">
                        <img 
                             class="w-12 h-12 rounded-full mr-4">
                        <div>
                            <h3 class="font-semibold">Mohit Nagde</h3>
                            <p class="text-gray-600 text-sm">Family Traveler</p>
                        </div>
                    </div>
                    <p class="text-gray-600 italic">Booking tickets for family trips has never been easier. The interface is user-friendly and the customer service is excellent!</p>
                </div>
            </div>
        </div>
    </div>

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
        </div>
    </footer>

    <!-- JavaScript for mobile menu toggle -->
    <script>
        function toggleMenu() {
            const menu = document.getElementById('mobileMenu');
            menu.classList.toggle('hidden');
        }
    </script>
</body>
</html>