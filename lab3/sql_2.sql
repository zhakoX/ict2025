create database sql_2;

create table companies (
    company_id int primary key,
    company_name varchar(255)
);

create table vehicles (
    vehicle_id int primary key,
    vehicle_type varchar(255),
    company_id int,
    foreign key (company_id) references companies(company_id)
);

create table cities (
    city_id int primary key,
    city_name varchar(255),
    country_id int
);

create table routes (
    route_id int primary key,
    city_id int,
    foreign key (city_id) references cities(city_id)
);

create table transport_types (
    transport_id int primary key,
    transport_name varchar(255),
    average_speed decimal
);


--task 2
insert into companies (company_id, company_name) values
(1, 'Speedy Wheels'),
(2, 'Acme Transport'),
(3, 'Global Logistics'),
(4, 'Rapid Transit'),
(5, 'City Movers');

insert into vehicles (vehicle_id, vehicle_type, company_id) values
(1, 'Truck', 1),
(2, 'Van', 2),
(3, 'Bus', 3),
(4, 'Train', 4),
(5, 'Airplane', 5),
(6, 'Scooter', 1),
(7, 'Bicycle', 2);

insert into cities (city_id, city_name, country_id) values
(1, 'Almaty', 1),
(2, 'Astana', 1),
(3, 'New York', 2),
(4, 'London', 3),
(5, 'Tokyo', 4),
(6, 'Paris', 5),
(7, 'Berlin', 6);

insert into routes (route_id, city_id) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 3);

insert into transport_types (transport_id, transport_name, average_speed) values
(1, 'Truck', 80),
(2, 'Van', 70),
(3, 'Bus', 60),
(4, 'Train', 120),
(5, 'Airplane', 800),
(6, 'Scooter', 30);


-- task 3

--a.
select c.company_name, count(v.vehicle_id) as number_of_vehicles
from companies c
left join vehicles v on c.company_id = v.company_id
group by c.company_name;


--b.
select *
from companies
where company_name like 'A%';


--c.
select *
from cities
where country_id between 3 and 10;


--d.
select *
from vehicles;


--e.
select r.route_id, c.city_name
from routes r join cities c on r.city_id = c.city_id;



--f.
select * from transport_types;


update transport_types
set average_speed = average_speed + 10
where average_speed < 100;


select * from transport_types;



--g.
select city_name, country_id
from cities;

--h.
select * from transport_types;
