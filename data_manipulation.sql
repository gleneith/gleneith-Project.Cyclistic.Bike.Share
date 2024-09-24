Creating the database based on memberships' activity.

- creating, biketrips  table
  
create table `stately-minutia-402911.bikeshare.biketrips` as
select * from `stately-minutia-402911.bikeshare.jan`
union distinct
select * from `stately-minutia-402911.bikeshare.feb`
union distinct
select * from `stately-minutia-402911.bikeshare.march`
union distinct
select * from `stately-minutia-402911.bikeshare.april`
union distinct
select * from `stately-minutia-402911.bikeshare.may`
union distinct
select * from `stately-minutia-402911.bikeshare.june_one`
union distinct
select * from `stately-minutia-402911.bikeshare.june_two`
union distinct
select * from `stately-minutia-402911.bikeshare.july_one`
union distinct
select * from `stately-minutia-402911.bikeshare.july_two`
union distinct
select * from `stately-minutia-402911.bikeshare.aug_one`
union distinct
select * from `stately-minutia-402911.bikeshare.aug_two`
union distinct
select * from `stately-minutia-402911.bikeshare.sep`
union distinct
select * from `stately-minutia-402911.bikeshare.oct`
union distinct
select * from `stately-minutia-402911.bikeshare.nov`
union distinct
select * from `stately-minutia-402911.bikeshare.dec`

- create final version, bikesharing table
  
create table `stately-minutia-402911.bikeshare.bikesharing` as
select distinct
ride_id as ride,
rideable_type as type_of_ride,
started_at,
ended_at,
date,
year,
case
when month = 1 then 'january'
when month = 2 then 'february'
when month = 3 then 'march'
when month = 4 then 'april'
when month = 5 then 'may'
when month = 6 then 'june'
when month = 7 then 'july'
when month = 8 then 'august'
when month = 9 then 'september'
when month = 10 then 'october'
when month = 11 then 'november'
when month = 12 then 'december'
else 'unknown'
end as month,
case
when day = 1 then 'monday'
when day = 2 then 'tuesday'
when day = 3 then 'wednesday'
when day = 4 then 'thursday'
when day = 5 then 'friday'
when day = 6 then 'saturday'
when day = 7 then 'sunday'
else 'unknown'
end as day,
case
when month in (12,1,2) then 'winter'
            when month in (3,4,5) then 'spring'
            when month in (6,7,8) then 'summer'
            when month in (9,10,11) then 'autumn'
            else 'unknown'
            end as season,
started_time,
ended_time,
ride_length as duration,
start_station_id,
start_station_name,
end_station_id,
end_station_name,
member_casual as membership,
from `stately-minutia-402911.bikeshare.biketrips`
