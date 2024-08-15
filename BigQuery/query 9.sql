-- Create a temporary view (airbnb_cancelled_rsvp_rooms_diff) that calculates statistics for each hotel about cancellations related to room assignment discrepancies. It counts the total number of cancellations where the assigned room type differs from the reserved one, the total cancellations, and calculates the percentage of such cases among all cancellations, rounded to two decimal places. The final result selects all columns from this dataset, giving a detailed breakdown for each hotel.

WITH airbnb_cancelled_rsvp_rooms_diff AS (
  SELECT
    hotel,
    SUM(1 - isRequestedRoom) AS total_not_assigned_room,
    COUNT(hotel) AS total_cancellation,
    ROUND((SUM(1 - isRequestedRoom) * 100 / COUNT(hotel)), 2) AS canceled_not_requested_room_per
  FROM
    `sp24-i535-dhchhed-airbnb.AirbnbBookings.rsvp_rooms`
  WHERE
    is_canceled = 1
  GROUP BY
    hotel
)

SELECT
  *
FROM
  airbnb_cancelled_rsvp_rooms_diff;
