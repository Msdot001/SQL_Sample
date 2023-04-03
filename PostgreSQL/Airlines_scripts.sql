/*
Selecting all item from aircrafts table using aircraft_code to order then in ascending order
*/

SELECT * FROM aircrafts
ORDER BY aircraft_code ASC;

/*Select one column */
SELECT aircraft_code, model FROM aircrafts
ORDER BY model ASC;

SELECT * FROM  airports;
SELECT airport_code, city, coordinates from airports;

SELECT * FROM  boarding_passes
WHERE boarding_no < 5 AND flight_id >20000;

SELECT * FROM  bookings;

SELECT * FROM flights
WHERE status='Scheduled' AND aircraft_code='763'
ORDER BY flight_no DESC;

SELECT * FROM seats
WHERE fare_conditions='Business';

SELECT fare_conditions, amount FROM ticket_flights
WHERE amount >= 14000 AND fare_conditions='Comfort';

SELECT * FROM tickets;