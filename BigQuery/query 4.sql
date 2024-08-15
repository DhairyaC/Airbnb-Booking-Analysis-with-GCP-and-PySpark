-- Analyze the total reservations, the number of cancellations, and the cancellation rate for each type of deposit. Group the results by the type of deposit, then order them by the cancellation percentage from highest to lowest. Display the deposit type, total reservations, cancellation count, and cancellation percentage.
SELECT
  deposit_type,
  COUNT(*) AS total_reservations,
  SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS cancellation_count,
  (SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS cancellation_percentage
FROM
  `sp24-i535-dhchhed-airbnb.AirbnbBookings.airbnb_bookings_processed`
GROUP BY
  deposit_type
ORDER BY
  cancellation_percentage DESC;