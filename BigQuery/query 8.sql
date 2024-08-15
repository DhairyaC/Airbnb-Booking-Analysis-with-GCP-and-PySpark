-- Create a temporary view (airbnb_rsvp_rooms) that calculates the percentage of guests in each hotel who get the room type they requested. This percentage is calculated by dividing the count of guests who received the requested room type by the total number of guests, then rounding to two decimal places. Finally, select all records from the airbnb_rsvp_rooms dataset to display this information.
WITH airbnb_rsvp_rooms AS (
  SELECT
    hotel,
    ROUND((SUM(isRequestedRoom) * 100 / COUNT(hotel)), 2) AS getting_requested_room_per
  FROM
    `sp24-i535-dhchhed-airbnb.AirbnbBookings.rsvp_rooms`
  GROUP BY
    hotel
)

SELECT
  *
FROM
  airbnb_rsvp_rooms;
