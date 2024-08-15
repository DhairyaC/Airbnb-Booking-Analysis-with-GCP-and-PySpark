-- Determine the total number of reservations for each market segment, the number of canceled reservations, and the percentage of cancellations. Group the results by market segment, then sort them by the cancellation percentage from highest to lowest. Display the market segment, total reservations, cancellation count, and cancellation percentage.
SELECT
  market_segment,
  COUNT(*) AS total_reservations,
  SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS cancellation_count,
  (SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS cancellation_percentage
FROM
  `sp24-i535-dhchhed-airbnb.AirbnbBookings.airbnb_bookings_processed`
GROUP BY
  market_segment
ORDER BY
  cancellation_percentage DESC;