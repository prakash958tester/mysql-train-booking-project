-- Create Stored Procedures
-- To quickly find all train ticket bookings for a specific date
DELIMITER $$

CREATE PROCEDURE GetBookingsByDate(IN book_date DATE)
BEGIN
  SELECT T.ticket_id, P.name, TR.train_name, T.seat_class
  FROM Tickets T
  JOIN Passengers P ON T.passenger_id = P.passenger_id
  JOIN Trains TR ON T.train_id = TR.train_id
  WHERE T.travel_date = book_date;
END $$

Delimiter ;

CALL GetBookingsByDate('2025-08-02');

/* This stored procedure is designed to generate a summary report for each train that includes:
Total number of tickets booked
Average age of passengers who booked those tickets*/

DELIMITER $$
CREATE PROCEDURE GetTrainSummary()
BEGIN
  SELECT TR.train_name,
         COUNT(T.ticket_id) AS total_tickets,
         AVG(P.age) AS avg_passenger_age
  FROM Tickets T
  JOIN Passengers P ON T.passenger_id = P.passenger_id
  JOIN Trains TR ON T.train_id = TR.train_id
  GROUP BY TR.train_name;
END $$

DELIMITER ;

CALL GetTrainSummary();

-- CTE Examples
-- 1. Passengers with more than 1 booking
-- (To be used in queries, not stored)
WITH booking_counts AS (
SELECT passenger_id, COUNT(*) AS total_bookings
FROM Tickets
GROUP BY passenger_id
)
SELECT P.name, bc.total_bookings
FROM booking_counts bc
JOIN Passengers P ON bc.passenger_id = P.passenger_id
WHERE total_bookings > 1 order by total_bookings desc ;

-- 2. Trains with average passenger age > 30
WITH avg_age_per_train AS (
SELECT T.train_id, AVG(P.age) AS avg_age
FROM Tickets T
JOIN Passengers P ON T.passenger_id = P.passenger_id
GROUP BY T.train_id
)
SELECT TR.train_name, a.avg_age
FROM avg_age_per_train a
JOIN Trains TR ON a.train_id = TR.train_id
WHERE a.avg_age > 30 order by a.avg_age desc;


-- Total Bookings
SELECT COUNT(*) AS total_bookings FROM Tickets;

-- Unique Passengers
SELECT COUNT(DISTINCT passenger_id) AS unique_passengers FROM Tickets;

-- Bookings by Train
SELECT TR.train_name, COUNT(*) AS total_bookings
FROM Tickets T
JOIN Trains TR ON T.train_id = TR.train_id
GROUP BY TR.train_name;

-- Bookings by Seat Class
SELECT seat_class, COUNT(*) AS total FROM Tickets GROUP BY seat_class;

-- Daily Bookings Trend
SELECT travel_date, COUNT(*) AS daily_bookings
FROM Tickets
GROUP BY travel_date
ORDER BY travel_date;

-- Average Passenger Age by Train
SELECT TR.train_name, AVG(P.age) AS avg_age
FROM Tickets T
JOIN Passengers P ON T.passenger_id = P.passenger_id
JOIN Trains TR ON T.train_id = TR.train_id
GROUP BY TR.train_name;

-- Top 5 Busiest route

SELECT 
    tr.train_name,
    COUNT(t.ticket_id) AS total_tickets
FROM Tickets t
JOIN Trains tr ON t.train_id = tr.train_id
GROUP BY t.train_id
ORDER BY total_tickets DESC
LIMIT 5;

-- Peak Booking Hours

SELECT 
    HOUR(booking_time) AS hour_of_day,
    COUNT(*) AS total_bookings
FROM Tickets
GROUP BY hour_of_day
ORDER BY total_bookings DESC
LIMIT 3;


