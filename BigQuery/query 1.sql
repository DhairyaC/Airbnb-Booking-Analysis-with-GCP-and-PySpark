-- Find the total number of reservations for each hotel, categorizing them by whether they were canceled or not. Display the hotel name, cancellation status, and the count of reservations for each group.
SELECT
  hotel,
  is_canceled,
  COUNT(*) AS reservation_count
FROM
  `sp24-i535-dhchhed-airbnb.AirbnbBookings.airbnb_bookings_processed`
GROUP BY
  hotel, is_canceled;