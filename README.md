# 🚆 MySQL Train Booking System

This project simulates a train ticket booking system using MySQL. It includes realistic database schema design, sample data for 100 passengers and 20 trains, and several SQL queries to analyze bookings, passenger behavior, and train performance.

---

## 🔧 Tech Stack

- **Database**: MySQL
- **Skills Used**: Database Design, SQL Queries, CTEs, Stored Procedures, Data Analysis

---

## 📑 Project Objectives

- Design normalized tables for a train booking system.
- Populate the system with 100+ realistic records.
- Implement analytical SQL queries for insights.
- Create stored procedures for reusable reporting.
- Practice using CTEs (Common Table Expressions).

---

## 🧱 Database Schema

### Tables:
- `Stations`: Station ID, Name, City
- `Trains`: Train ID, Name, Source/Destination Stations, Times
- `Passengers`: Passenger ID, Name, Age, Gender
- `Tickets`: Ticket ID, Passenger ID, Train ID, Travel Date, Seat Class, Booking Time

---

## 📥 Sample Data

Includes:
- ✅ 20 Stations  
- ✅ 20 Trains  
- ✅ 100 Passengers  
- ✅ 100+ Bookings  

All data is inserted using SQL `INSERT INTO` statements.

---

## 🧠 Key Features & SQL Queries

### Stored Procedures:
- `GetBookingsByDate(date)`: Shows tickets booked on a specific date.
- `GetTrainSummary()`: Shows total tickets and average age of passengers per train.

### CTEs:
- Passengers with more than 1 booking.
- Trains with average passenger age over 30.

### Insights:
- Total Bookings
- Unique Passengers
- Bookings by Train
- Bookings by Seat Class
- Daily Booking Trends
- Peak Booking Hours
- Top 5 Busiest Routes

---

## 📊 Data Analyst Use Case

This project is suitable for:
- Practicing SQL joins, aggregates, and CTEs.
- Building dashboards in Excel or Power BI.
- Preparing for interviews in Data/QA roles.

---

## 📁 Files Included

- `train_booking_schema.sql`: Full schema and table creation
- `train_booking_inserts.sql`: Sample data for all tables
- `train_booking_queries.sql`: Analytical queries and stored procedures
- `README.md`: Project documentation

---

## 👤 About Me

I’m a career switcher transitioning into IT, aiming for roles in **SQL Development** and **Software Testing**. This project demonstrates my hands-on experience with database management and data analysis using SQL.

---

## 📫 Connect

- [LinkedIn](www.linkedin.com/in/jayaprakash-a-841078229)

---
