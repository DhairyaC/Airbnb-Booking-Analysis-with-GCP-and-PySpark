-- Get the total number of reservations for each month, separating them into those that were canceled and those that were not. Group the results by the month of arrival and cancellation status, then sort the output by the month of arrival. Display the month, cancellation status, and the count of reservations for each group.
SELECT
  arrival_date_month,
  is_canceled,
  COUNT(*) AS reservation_count
FROM
  `sp24-i535-dhchhed-airbnb.AirbnbBookings.airbnb_bookings_processed`
GROUP BY
  arrival_date_month, is_canceled
ORDER BY arrival_date_month;
