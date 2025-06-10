select * from users where phone_no LIKE '%7290';
explain analyze select * from users where phone_no LIKE '%7290';

SELECT * FROM users WHERE email = 'jacksonlarry@example.com';
explain analyze SELECT * FROM users WHERE email = 'jacksonlarry@example.com';

select * from ride_bookings where pickup_location = 'MG Road';
explain analyze select * from ride_bookings where pickup_location = 'MG Road';

select * from ride_bookings where user_id = 1234;

-- explain analyze
select * from drivers where star_rating = 4
union
select * from drivers where star_rating = 5;


select * from drivers where star_rating in (4, 5);

select * from payments where payment_status = 'failed';

select * from ride_bookings where pickup_location = 'Nagawara' and drop_location = 'kammanahalli';


-- select r.booking_id, u.user_name, d.driver_name, r.pickup_location, r.drop_location from ride_bookings as r 
-- join users as u on ride_bookings.user_id = users.user_id 
-- join drivers as d on ride_bookings.driver_id = drivers.driver_id;

-- explain analyze
select r.booking_id, u.user_name, d.driver_name, r.pickup_location, r.drop_location 
from ride_bookings as r 
join users as u on r.user_id = u.user_id 
join drivers as d on r.driver_id = d.driver_id;

-- explain analyze
select * from ride_bookings 
join users on ride_bookings.user_id = users.user_id 
join drivers on ride_bookings.driver_id = drivers.driver_id;

explain analyze 
select * 
from drivers d
join vehicles v on d.driver_id = v.driver_id
where v.vehicle_status = 'active';


select rb.booking_id, rb.pickup_location, rb.drop_location, rb.ride_cost, rb.booking_status, p.payment_status
from ride_bookings rb
join users u on rb.user_id = u.user_id
join payments p on rb.booking_id = p.booking_id
where u.user_name = 'TEJAS GOWRISH';


-- explain analyze
select rb.booking_id, u.user_name, d.driver_name, rb.ride_cost, p.payment_status
from ride_bookings rb
join users u on rb.user_id = u.user_id
join drivers d on rb.driver_id = d.driver_id
join payments p on rb.booking_id = p.booking_id
where p.payment_status = 'completed';


explain analyze
select rb.booking_id, u.user_name, d.driver_name, rb.ride_cost, p.payment_status
from payments p
join ride_bookings rb on p.booking_id = rb.booking_id
join users u on rb.user_id = u.user_id
join drivers d on rb.driver_id = d.driver_id
where p.payment_status = 'completed';



select rb.booking_id, u.user_name, d.driver_name, rb.ride_cost, p.payment_status
from ride_bookings rb
join users u on rb.user_id = u.user_id
join drivers d on rb.driver_id = d.driver_id
left join payments p on rb.booking_id = p.booking_id;


-- explain analyze 
select rb.booking_id, u.user_name, d.driver_name, rb.ride_cost
from ride_bookings rb
join users u on rb.user_id = u.user_id
join drivers d on rb.driver_id = d.driver_id
where exists (
    select 1 from payments p where p.booking_id = rb.booking_id and p.payment_status = 'completed'
);



select rb.booking_id, u.user_name, d.driver_name, rb.ride_cost, p.payment_status
from ride_bookings rb
join users u on rb.user_id = u.user_id
join drivers d on rb.driver_id = d.driver_id
join payments p on rb.booking_id = p.booking_id
where p.payment_status = 'completed';




SELECT *
FROM 
( 
(ride_bookings rb JOIN users u ON rb.user_id = u.user_id) 
JOIN drivers d ON rb.driver_id = d.driver_id) 
JOIN payments p ON rb.booking_id = p.booking_id
WHERE p.payment_status = 'completed';


select rb.booking_id, u.user_name, d.driver_name, rb.ride_cost, p.payment_status
from payments p
join ride_bookings rb on p.booking_id = rb.booking_id
join users u on rb.user_id = u.user_id
join drivers d on rb.driver_id = d.driver_id
where p.payment_status = 'completed';


select rb.booking_id, u.user_name, d.driver_name, rb.ride_cost, p.payment_status
from payments p, ride_bookings rb, users u, drivers d
where p.payment_status = 'completed'
and p.booking_id = rb.booking_id
and rb.user_id = u.user_id
and rb.driver_id = d.driver_id;
-- and p.payment_status = 'completed';
