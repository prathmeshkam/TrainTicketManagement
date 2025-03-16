package com.pbl;

public class Booking {
    private int id;
    private int trainNumber;
    private String trainName;
    private java.sql.Date trainDate;
    private String name;
    private int age;
    private String travelClass;
    private int numTickets;
    private int totalPay;

    // Constructor
    public Booking(int id, int trainNumber, String trainName, java.sql.Date trainDate, 
                   String name, int age, String travelClass, int numTickets, int totalPay) {
        this.id = id;
        this.trainNumber = trainNumber;
        this.trainName = trainName;
        this.trainDate = trainDate;
        this.name = name;
        this.age = age;
        this.travelClass = travelClass;
        this.numTickets = numTickets;
        this.totalPay = totalPay;
    }

    // Getters
    public int getId() { return id; }
    public int getTrainNumber() { return trainNumber; }
    public String getTrainName() { return trainName; }
    public java.sql.Date getTrainDate() { return trainDate; }
    public String getName() { return name; }
    public int getAge() { return age; }
    public String getTravelClass() { return travelClass; }
    public int getNumTickets() { return numTickets; }
    public int getTotalPay() { return totalPay; }

    // toString() method for debugging (Optional)
    @Override
    public String toString() {
        return "Booking [ID=" + id + ", TrainNumber=" + trainNumber + ", TrainName=" + trainName + 
               ", TrainDate=" + trainDate + ", Name=" + name + ", Age=" + age + 
               ", Class=" + travelClass + ", Tickets=" + numTickets + ", TotalPay=₹" + totalPay + "]";
    }
}
