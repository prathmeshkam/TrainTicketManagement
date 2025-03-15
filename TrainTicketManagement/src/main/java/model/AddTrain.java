
package model;

import java.sql.Date;

public class AddTrain {
    private int trainNumber;
    private String trainName;
    private String originStation;
    private String destinationStation;
    private String departureTime;
    private String arrivalTime;
    private int numberOfSeats;
    private int firstac;
    private int secondac;
    private int thirdac;
    private int secondsitting;
    private int sleeper;
    private Date traindate;

    public AddTrain(int trainNumber, String trainName, String originStation, String destinationStation, String departureTime,
            String arrivalTime, int numberOfSeats, int firstac, int secondac, int thirdac, int secondsitting, int sleeper,
            Date traindate) {
        this.trainNumber = trainNumber;
        this.trainName = trainName;
        this.originStation = originStation;
        this.destinationStation = destinationStation;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.numberOfSeats = numberOfSeats;
        this.firstac = firstac;
        this.secondac = secondac;
        this.thirdac = thirdac;
        this.secondsitting = secondsitting;
        this.sleeper = sleeper;
        this.traindate = traindate;
    }

    public int getTrainNumber() {
        return trainNumber;
    }

    public void setTrainNumber(int trainNumber) {
        this.trainNumber = trainNumber;
    }

    public String getTrainName() {
        return trainName;
    }

    public void setTrainName(String trainName) {
        this.trainName = trainName;
    }

    public String getOriginStation() {
        return originStation;
    }

    public void setOriginStation(String originStation) {
        this.originStation = originStation;
    }

    public String getDestinationStation() {
        return destinationStation;
    }

    public void setDestinationStation(String destinationStation) {
        this.destinationStation = destinationStation;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getNumberOfSeats() {
        return numberOfSeats;
    }

    public void setNumberOfSeats(int numberOfSeats) {
        this.numberOfSeats = numberOfSeats;
    }

    public int getFirstac() {
        return firstac;
    }

    public void setFirstac(int firstac) {
        this.firstac = firstac;
    }

    public int getSecondac() {
        return secondac;
    }

    public void setSecondac(int secondac) {
        this.secondac = secondac;
    }

    public int getThirdac() {
        return thirdac;
    }

    public void setThirdac(int thirdac) {
        this.thirdac = thirdac;
    }

    public int getSecondsitting() {
        return secondsitting;
    }

    public void setSecondsitting(int secondsitting) {
        this.secondsitting = secondsitting;
    }

    public int getSleeper() {
        return sleeper;
    }

    public void setSleeper(int sleeper) {
        this.sleeper = sleeper;
    }

    public Date getTraindate() {
        return traindate;
    }

    public void setTraindate(Date traindate) {
        this.traindate = traindate;
    }
}