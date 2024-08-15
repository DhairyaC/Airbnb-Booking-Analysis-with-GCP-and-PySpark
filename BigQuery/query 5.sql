-- Find the total number of reservations for each meal plan, along with the number of cancellations and the cancellation rate. Group the results by meal plan, then order them by the cancellation percentage from highest to lowest. Display the meal plan, total reservations, cancellation count, and cancellation percentage.
SELECT
  meal,
  COUNT(*) AS total_reservations,
  SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS cancellation_count,
  (SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS cancellation_percentage
FROM
  `sp24-i535-dhchhed-airbnb.AirbnbBookings.airbnb_bookings_processed`
GROUP BY
  meal
ORDER BY
  cancellation_percentage DESC;