package com.pbl;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class Admin {
    public static void main(String[] args) {
        TrainManagementDao tm = new TrainManagementDao();
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("\n===== Welcome to Train Management System =====");
            System.out.println("1 - Admin Login");
            System.out.println("2 - User Login");
            System.out.println("3 - Admin Register");
            System.out.println("4 - User Register");
            System.out.println("5 - Exit");
            System.out.print("Enter your choice: ");
            int choice = sc.nextInt();
            sc.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    login(sc, tm, "admin");
                    break;
                case 2:
                    login(sc, tm, "user");
                    break;
                case 3:
                    register(sc, tm, "admin");
                    break;
                case 4:
                    register(sc, tm, "user");
                    break;
                case 5:
                    System.out.println("Thank you for using Train Management System!");
                    sc.close();
                    return;
                default:
                    System.out.println("Invalid choice! Please try again.");
            }
        }
    }

    private static void login(Scanner sc, TrainManagementDao tm, String role) {
        try {
            System.out.print("\nEnter Username: ");
            String username = sc.nextLine();
            System.out.print("Enter Password: ");
            String password = sc.nextLine();

            if (tm.validateDao(username, password, role)) {
                System.out.println("Login Successful as " + role.toUpperCase() + "!");
                if (role.equals("admin")) {
                    adminMenu(sc, tm);
                } else {
                    userMenu(sc, tm);
                }
            } else {
                System.out.println("Invalid credentials. Try again.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Login Error: " + e.getMessage());
        }
    }

    private static void register(Scanner sc, TrainManagementDao tm, String role) {
        try {
            System.out.print("\nEnter Username: ");
            String username = sc.nextLine();
            System.out.print("Enter Password: ");
            String password = sc.nextLine();
            System.out.print("Enter Email: ");
            String email = sc.nextLine();
            System.out.print("Enter Contact Number: ");
            String contact = sc.nextLine();
            System.out.print("Enter Address: ");
            String address = sc.nextLine();

            if (tm.registerUser(username, password, email, contact, address, role)) {
                System.out.println(role.toUpperCase() + " Registration Successful!");
            } else {
                System.out.println("Registration Failed.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Registration Error: " + e.getMessage());
        }
    }

    private static void adminMenu(Scanner sc, TrainManagementDao tm) {
        while (true) {
            System.out.println("\n===== Admin Menu =====");
            System.out.println("1 - Add Train");
            System.out.println("2 - Update Train");
            System.out.println("3 - Delete Train");
            System.out.println("4 - Display Trains");
            System.out.println("5 - Search Train");
            System.out.println("6 - Logout");
            System.out.print("Enter your choice: ");
            int choice = sc.nextInt();
            sc.nextLine();

            switch (choice) {
                case 1:
                    addTrain(tm, sc);
                    break;
                case 2:
                    updateTrain(tm, sc);
                    break;
                case 3:
                    deleteTrain(tm, sc);
                    break;
                case 4:
                    displayTrains(tm);
                    break;
                case 5:
                    searchTrain(tm, sc);
                    break;
                case 6:
                    System.out.println("Logging out...");
                    return;
                default:
                    System.out.println("Invalid choice! Try again.");
            }
        }
    }

    private static void userMenu(Scanner sc, TrainManagementDao tm) {
        while (true) {
            System.out.println("\n===== User Menu =====");
            System.out.println("1 - Search Train");
            System.out.println("2 - Manage Ticket");
            System.out.println("3 - Logout");
            System.out.print("Enter your choice: ");
            int choice = sc.nextInt();
            sc.nextLine();

            switch (choice) {
                case 1:
                    searchTrain(tm, sc);
                    break;
                case 2:
                	manageTickets(tm, sc);
                    break;
                case 3:
                    System.out.println("Logging out...");
                    return;
                default:
                    System.out.println("Invalid choice! Try again.");
            }
        }
    }

    private static void addTrain(TrainManagementDao tm, Scanner sc) {
        try {
            Train train = getTrainDetailsFromInput(sc);
            tm.addTrain(train);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error adding train: " + e.getMessage());
        }
    }

    private static void updateTrain(TrainManagementDao tm, Scanner sc) {
        try {
            System.out.print("\nEnter train number to update: ");
            int trainNumber = sc.nextInt();
            sc.nextLine();

            Train updatedTrain = getTrainDetailsFromInput(sc);
            updatedTrain.setTrainNumber(trainNumber);

            tm.updateTrain(updatedTrain);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error updating train: " + e.getMessage());
        }
    }

    private static void deleteTrain(TrainManagementDao tm, Scanner sc) {
        try {
            System.out.print("\nEnter train number to delete: ");
            int trainNumber = sc.nextInt();
            sc.nextLine();
            tm.deleteTrain(trainNumber);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error deleting train: " + e.getMessage());
        }
    }

    private static void displayTrains(TrainManagementDao tm) {
        try {
            tm.display();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error displaying trains: " + e.getMessage());
        }
    }

    private static void searchTrain(TrainManagementDao tm, Scanner sc) {
        try {
            System.out.print("\nEnter Source Station: ");
            String source = sc.nextLine();
            System.out.print("Enter Destination Station: ");
            String destination = sc.nextLine();
            System.out.print("Enter Travel Date (YYYY-MM-DD): ");
            String travelDateStr = sc.nextLine();
            
            java.sql.Date travelDate = java.sql.Date.valueOf(travelDateStr);
            
            List<Train> availableTrains = tm.searchTrain(source, destination, travelDate);
            
            if (availableTrains.isEmpty()) {
                System.out.println("No trains available for the given details.");
                return;
            }
            
            System.out.println("\nAvailable Trains:");
            for (int i = 0; i < availableTrains.size(); i++) {
                System.out.println((i + 1) + ". " + availableTrains.get(i)); // Show indexed list
            }

            System.out.print("\nDo you want to book a ticket? (Y/N): ");
            String choice = sc.nextLine().trim().toUpperCase();
            
            if (choice.equals("Y")) {
                System.out.print("\nSelect Train (Enter Number): ");
                int selectedIndex = sc.nextInt();
                sc.nextLine(); // Consume newline

                if (selectedIndex < 1 || selectedIndex > availableTrains.size()) {
                    System.out.println("Invalid selection. Returning to main menu.");
                    return;
                }

                Train selectedTrain = availableTrains.get(selectedIndex - 1);
                bookTicket(tm, sc, selectedTrain);
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error searching train: " + e.getMessage());
        }
    }

    private static void bookTicket(TrainManagementDao tm, Scanner sc, Train selectedTrain) {
        try {
            System.out.print("Enter Number of Tickets: ");
            int numTickets = sc.nextInt();
            sc.nextLine(); // Consume newline

            int totalPrice = numTickets * 100;
            System.out.println("\nTotal Amount: ₹" + totalPrice);

            System.out.print("Confirm Booking (Y/N): ");
            String confirm = sc.nextLine().trim().toUpperCase();

            if (confirm.equals("Y")) {
                for (int i = 1; i <= numTickets; i++) {
                    System.out.println("\nEnter Details for Passenger " + i + ":");

                    System.out.print("Enter Passenger Name: ");
                    String name = sc.nextLine();

                    System.out.print("Enter Age: ");
                    int age = sc.nextInt();
                    sc.nextLine(); // Consume newline

                    System.out.print("Enter Gender (Male/Female/Other): ");
                    String gender = sc.nextLine();

                    System.out.print("Enter Class (1AC, 2AC, 3AC, Sleeper, SS): ");
                    String travelClass = sc.nextLine();

                    System.out.print("Enter Payment Mode (Google Pay, PhonePe): ");
                    String paymentMode = sc.nextLine();

                    // ✅ Book each passenger separately
                    tm.bookTicket(
                        selectedTrain.getTrainNumber(), selectedTrain.getTrainName(), selectedTrain.getTraindate(), 
                        name, age, gender, travelClass, paymentMode, 1 // Booking 1 ticket per passenger
                    );

                    System.out.println("Passenger " + i + " Ticket Booked Successfully!\n");
                }
            } else {
                System.out.println("Booking Cancelled.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error booking ticket: " + e.getMessage());
        }
    }

    
    private static void manageTickets(TrainManagementDao tm, Scanner sc) {
        try {
            // Fetch all bookings from the database
            List<Booking> bookings = tm.getAllBookings();
            
            if (bookings.isEmpty()) {
                System.out.println("No bookings found.");
                return;
            }

            // Display all bookings in list format
            System.out.println("\nYour Bookings:");
            System.out.println("---------------------------------------------------------------");
            System.out.printf("%-5s %-10s %-20s %-12s %-10s %-6s %-10s %-10s %-8s\n", 
                              "ID", "TrainNo", "TrainName", "Date", "Name", "Age", "Class", "Tickets", "Total ₹");
            System.out.println("---------------------------------------------------------------");
            for (Booking b : bookings) {
                System.out.printf("%-5d %-10d %-20s %-12s %-10s %-6d %-10s %-8d %-8d\n", 
                                  b.getId(), b.getTrainNumber(), b.getTrainName(), b.getTrainDate(),
                                  b.getName(), b.getAge(), b.getTravelClass(), b.getNumTickets(), b.getTotalPay());
            }

            // Ask if user wants to cancel a ticket
            System.out.print("\nDo you want to cancel any booking? (Y/N): ");
            String choice = sc.nextLine().trim().toUpperCase();

            if (choice.equals("Y")) {
                System.out.print("Enter Booking ID to cancel: ");
                int bookingId = sc.nextInt();
                sc.nextLine();  // Consume newline

                boolean success = tm.cancelBooking(bookingId);
                if (success) {
                    System.out.println("Booking cancelled successfully.");
                } else {
                    System.out.println("Invalid Booking ID. No booking cancelled.");
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error managing tickets: " + e.getMessage());
        }
    }




    private static Train getTrainDetailsFromInput(Scanner sc) {
        System.out.println("\nEnter Train Details:");
        
        System.out.print("Train Number: ");
        int trainNumber = sc.nextInt();
        sc.nextLine(); // Consume the leftover newline
        
        System.out.print("Train Name: ");
        String trainName = sc.nextLine();
        System.out.print("Origin Station: ");
        String originStation = sc.nextLine();
        System.out.print("Destination Station: ");
        String destinationStation = sc.nextLine();
        System.out.print("Departure Time: ");
        String departureTime = sc.nextLine();
        System.out.print("Arrival Time: ");
        String arrivalTime = sc.nextLine();
        System.out.print("Number of Seats: ");
        int numberOfSeats = sc.nextInt();
        System.out.print("First AC: ");
        int firstAC = sc.nextInt();
        System.out.print("Second AC: ");
        int secondAC = sc.nextInt();
        System.out.print("Third AC: ");
        int thirdAC = sc.nextInt();
        System.out.print("Second Sitting: ");
        int secondSitting = sc.nextInt();
        System.out.print("Sleeper: ");
        int sleeper = sc.nextInt();
        sc.nextLine(); // Consume newline
        System.out.print("Train Date (YYYY-MM-DD): ");
        String trainDateStr = sc.nextLine();

        java.sql.Date trainDate = java.sql.Date.valueOf(trainDateStr);

        return new Train(trainNumber, trainName, originStation, destinationStation, departureTime, 
                         arrivalTime, numberOfSeats, firstAC, secondAC, thirdAC, secondSitting, sleeper, trainDate);
    }

}
