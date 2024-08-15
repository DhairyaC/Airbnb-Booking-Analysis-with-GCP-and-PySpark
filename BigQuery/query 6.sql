-- Find the total number of reservations from each country, along with the number of cancellations and the cancellation rate. Group the results by country, then order them by the cancellation percentage from highest to lowest. Display the country, total reservations, cancellation count, and cancellation percentage.
SELECT
  country,
  COUNT(*) AS total_reservations,
  SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS cancellation_count,
  (SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS cancellation_percentage
FROM
  `sp24-i535-dhchhed-airbnb.AirbnbBookings.airbnb_bookings_processed`
GROUP BY
  country
ORDER BY
  cancellation_percentage DESC;