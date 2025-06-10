-- Indexes for faster lookup

-- *****************************************************************************************

-- Users Table
create index idx_users_email on users(email);	-- email 
create index idx_users_phone on users(phone_no);  	-- phone number

-- drop index idx_users_email on users;
-- drop index idx_users_phone on users;

-- *****************************************************************************************

-- drivers table
create index idx_drivers_status on drivers(driver_status);
create index idx_drivers_rating on drivers(star_rating);

-- drop index idx_drivers_status on drivers;
-- drop index idx_drivers_rating on drivers;

-- *****************************************************************************************

-- ride_bookings table
create index idx_ride_bookings_user on ride_bookings(user_id);  
create index idx_ride_bookings_driver on ride_bookings(driver_id);  
create index idx_ride_bookings_status on ride_bookings(booking_status); 

-- drop index idx_ride_bookings_user on ride_bookings;
-- drop index idx_ride_bookings_driver on ride_bookings;
-- drop index idx_ride_bookings_status on ride_bookings;

create index idx_ride_bookings_pickup_location on ride_bookings(pickup_location);
create index idx_ride_bookings_drop_location on ride_bookings(drop_location);
create index idx_ride_bookings_cost on ride_bookings(ride_cost desc);

-- drop index idx_ride_bookings_pickup_location on ride_bookings;
-- drop index idx_ride_bookings_drop_location on ride_bookings;
-- drop index idx_ride_bookings_cost on ride_bookings;

-- *****************************************************************************************

-- payments table
create index idx_payments_booking on payments(booking_id);  
create index idx_payments_status on payments(payment_status);  
create index idx_payments_timestamp on payments(payment_timestamp desc);  
create index idx_payments_ride_cost on payments(ride_cost desc);

-- drop index idx_payments_booking on payments;
-- drop index idx_payments_status on payments;
-- drop index idx_payments_timestamp on payments;
-- drop index idx_payments_ride_cost on payments;

-- *****************************************************************************************

-- vehicles table
create index idx_vehicles_number on vehicles(vehicle_number);  
create index idx_vehicles_status on vehicles(vehicle_status);  
create index idx_vehicles_driver on vehicles(driver_id);  

-- drop index idx_vehicles_number on vehicles;
-- drop index idx_vehicles_status on vehicles;
-- drop index idx_vehicles_driver on vehicles;

-- *****************************************************************************************