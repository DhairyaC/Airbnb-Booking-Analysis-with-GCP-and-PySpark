-- Create a view called rsvp_rooms that shows information about hotels, cancellation status, reserved room type, assigned room type, and whether the assigned room matches the reserved room. The view displays 1 if the room types match, and 0 otherwise.
CREATE OR REPLACE VIEW `sp24-i535-dhchhed-airbnb.AirbnbBookings.rsvp_rooms` 
AS
SELECT
  hotel,
  is_canceled,
  reserved_room_type,
  assigned_room_type,
  CASE WHEN reserved_room_type = assigned_room_type THEN 1 ELSE 0 END AS isRequestedRoom
FROM
  `sp24-i535-dhchhed-airbnb.AirbnbBookings.airbnb_bookings_processed`;
