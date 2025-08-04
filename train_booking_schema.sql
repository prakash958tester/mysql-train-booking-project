-- Create Database
CREATE DATABASE IF NOT EXISTS TrainBooking;
USE TrainBooking;

-- Create Tables
CREATE TABLE Stations (
    station_id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE Trains (
    train_id INT AUTO_INCREMENT PRIMARY KEY,
    train_name VARCHAR(100),
    source_station_id INT,
    destination_station_id INT,
    departure_time TIME,
    arrival_time TIME,
    FOREIGN KEY (source_station_id) REFERENCES Stations(station_id),
    FOREIGN KEY (destination_station_id) REFERENCES Stations(station_id)
);

CREATE TABLE Passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender ENUM('Male', 'Female', 'Other')
);

CREATE TABLE Tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    train_id INT,
    travel_date DATE,
    seat_class ENUM('Sleeper', 'AC', 'First Class'),
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (train_id) REFERENCES Trains(train_id)
);

SHOW TABLES;
