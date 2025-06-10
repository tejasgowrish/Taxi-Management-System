create database DBT25_A1_PES1UG22CS650_TEJAS_GOWRISH;
-- drop database DBT25_A1_PES1UG22CS650_TEJAS_GOWRISH;
use DBT25_A1_PES1UG22CS650_TEJAS_GOWRISH;

-- *****************************************************************************************

create table users
(
	user_id int auto_increment primary key,
    user_name varchar(50) not null,
    password varchar(20) not null,
    email varchar(100) not null,
    phone_no varchar(10) not null
);
-- drop table users;

-- *****************************************************************************************

create table drivers
(
    driver_id int auto_increment primary key,
    driver_name varchar(50) not null,
    -- vehicle_id int unique not null,
    driver_status enum('available', 'unavailable') default 'available',
    star_rating int,
    check (star_rating >= 0 and star_rating <= 5)
    -- constraint fk_driver_vehicle foreign key(vehicle_id) references vehicles(vehicle_id)
    -- foreign key(vehicle_id) references vehicles(vehicle_id)
);
-- drop table drivers;

-- *****************************************************************************************

create table vehicles
(
	vehicle_id int auto_increment not null primary key,		-- vehicle ID in the system
    vehicle_number varchar(10) unique not null,		-- license number plate 
    driver_id int unique,
    vehicle_model varchar(50),
	seating_capacity int not null,
    vehicle_status enum('active', 'inactive', 'maintenance') default 'active',
    constraint fk_vehicle_driver foreign key(driver_id) references drivers(driver_id) on delete cascade
);
-- drop table vehicles;

-- *****************************************************************************************

-- create table driver_vehicle
-- (
-- 	driver_id int,
-- 	vehicle_id int,
--     constraint fk_driver foreign key(driver_id) references drivers(driver_id),
--     constraint fk_vehicle foreign key(vehicle_id) references vehicles(vehicle_id),
--     primary key(driver_id, vehicle_id)
-- );
-- drop table driver_vehicle;

-- *****************************************************************************************

create table ride_bookings
(
	booking_id int auto_increment primary key,
    user_id int,
    driver_id int,
    ride_cost decimal(10, 2) not null,
    pickup_location varchar(200) not null,
    drop_location varchar(200) not null,
    booking_status enum('confirmed', 'pending', 'on-the-way', 'arrived', 'canceled') not null default 'pending',
    booking_timestamp datetime,
    constraint fk_booking_user foreign key(user_id) references users(user_id),
	constraint fk_booking_driver foreign key(driver_id) references drivers(driver_id)
);
-- drop table ride_bookings; 

-- *****************************************************************************************

create table payments
(
	payment_id int auto_increment primary key,
    booking_id int,
    ride_cost decimal(10, 2) not null,
    payment_method enum('cash', 'card', 'upi', 'net-banking', 'coupon') not null,
    payment_status enum('processing', 'completed', 'failed') not null default 'processing',
    payment_timestamp datetime,
    constraint fk_payment_booking foreign key(booking_id) references ride_bookings(booking_id)
);
-- drop table payments;


-- *****************************************************************************************
-- *****************************************************************************************

insert into users(user_name, password, email, phone_no) values ('TEJAS GOWRISH', 'PES1UG22CS650', 'tejasgowrish@gmail.com', '9876543210');

-- drop table vehicles;
-- drop table users;
-- drop table drivers;
-- drop table ride_bookings;
-- drop table payments;

-- truncate table vehicles;
-- truncate table users;
-- truncate table drivers;
-- truncate table ride_bookings;
-- truncate table payments;


-- select all records from tables
select * from vehicles;
select * from users;
select * from drivers;
select * from ride_bookings;
select * from payments;


-- count records in each table
select count(*) from vehicles;
select count(*) from users;
select count(*) from drivers;
select count(*) from ride_bookings;
select count(*) from payments;

-- *****************************************************************************************
-- *****************************************************************************************

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

drop index idx_drivers_status on drivers;
drop index idx_drivers_rating on drivers;

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


